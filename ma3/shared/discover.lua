-- ZealSync UDP discovery client. Broadcasts a `discover` probe on
-- 255.255.255.255:29881, listens 5 seconds, returns a list of responses.
-- WIRE_PROTOCOL §6.
--
-- Bare JSON in/out — no MC/MS framing. UDP, not TCP. The discover verb is
-- UDP-only per §6.5.

local function load_shared(name)
    local plugins_root
    if type(GetPath) == "function" then
        local ok, v = pcall(GetPath, "plugins")
        if ok and type(v) == "string" and v ~= "" then plugins_root = v end
    end
    if not plugins_root then
        error("ZealSync: GetPath('plugins') unavailable; cannot locate shared modules")
    end
    local cache_key = "ZealSync_" .. name
    if _G[cache_key] then return _G[cache_key] end
    local path = plugins_root .. "/ZealSync_shared/" .. name .. ".lua"
    local ok, mod = pcall(dofile, path)
    if not ok then
        error("ZealSync: failed to load " .. path .. ": " .. tostring(mod))
    end
    _G[cache_key] = mod
    return mod
end

local socket = require("socket")
local json = load_shared("json")
-- Don't load_shared("wire") here — wire loads discover for connect-with-
-- fallback, so a wire dep here would form a circular load_shared during
-- the first load of either module. PROTOCOL_VERSION lives in version.lua
-- precisely to break that cycle.
local version = load_shared("version")

local M = {}

local DISCOVERY_PORT = 29881
local LISTEN_SECONDS = 5.0
local RECV_POLL_TIMEOUT = 0.2 -- per-recv timeout; loop until LISTEN_SECONDS elapses
local RECV_BUFFER = 4096

-- Generic ZealSync prefix — discover is a shared module that's called from
-- multiple plugin entries (ZealSync_Discover for the manual flow, wire.lua
-- for the connect-with-fallback path). A per-call prefix would mismatch the
-- caller; a generic one reads consistently in System Monitor.
local function log(fmt, ...)
    if Printf then Printf("ZealSync: " .. fmt, ...) end
end

-- Compute the directed broadcast for an (IPv4, mask) pair, both as dotted-
-- decimal strings. Standard formula per octet: (ip & mask) | ~mask, clamped
-- to a byte. Worked examples:
--   192.168.1.42 / 255.255.255.0 -> 192.168.1.255
--   10.0.0.5     / 255.0.0.0     -> 10.255.255.255
--   127.0.0.1    / 255.0.0.0     -> 127.255.255.255 (then mapped to 127.0.0.1
--                                  by the caller — loopback directed
--                                  broadcasts have divergent OS behaviour)
local function compute_directed_broadcast(ip, mask)
    local ip_octets = {}
    local mask_octets = {}
    for n in string.gmatch(ip, "(%d+)") do
        ip_octets[#ip_octets + 1] = tonumber(n)
    end
    for n in string.gmatch(mask, "(%d+)") do
        mask_octets[#mask_octets + 1] = tonumber(n)
    end
    if #ip_octets ~= 4 or #mask_octets ~= 4 then return nil end
    local out = {}
    for i = 1, 4 do
        local network = ip_octets[i] & mask_octets[i]
        local host_fill = (~mask_octets[i]) & 0xff
        out[i] = (network | host_fill) & 0xff
    end
    return table.concat(out, ".")
end

-- Iterate every linked MA3 interface and send `payload` to its directed
-- broadcast address on DISCOVERY_PORT. Loopback directed broadcasts are
-- mapped to 127.0.0.1 (matches MArkers; 127.255.255.255 has divergent OS
-- behaviour). Returns the count of sendto calls that succeeded.
--
-- The whole enumeration is wrapped in pcall — if Obj.Children(Root().Interfaces)
-- isn't available on a future MA3 build, we log and return 0 cleanly rather
-- than crashing. Per-interface sendto failures are non-fatal: log and
-- continue to the next NIC.
local function broadcast_to_all_nics(sock, payload)
    local sent_count = 0
    local ok, err = pcall(function()
        local interfaces = Root().Interfaces
        if not interfaces then return end
        for _, iface in pairs(Obj.Children(interfaces)) do
            if iface.Link then
                for _, ip_cfg in pairs(Obj.Children(iface)) do
                    local ip_str = tostring(ip_cfg.Ip or "")
                    local mask_str = tostring(ip_cfg.Mask or "")
                    if ip_str:match("^%d+%.%d+%.%d+%.%d+$") and
                       mask_str:match("^%d+%.%d+%.%d+%.%d+$") then
                        local bcast = compute_directed_broadcast(ip_str, mask_str)
                        if bcast and bcast:match("^127%.") then
                            bcast = "127.0.0.1"
                        end
                        if bcast then
                            local sent_ok, send_err =
                                sock:sendto(payload, bcast, DISCOVERY_PORT)
                            if sent_ok then
                                sent_count = sent_count + 1
                                log("broadcast sent to %s", bcast)
                            else
                                log("broadcast to %s failed: %s",
                                    bcast, tostring(send_err))
                            end
                        end
                    end
                end
            end
        end
    end)
    if not ok then
        log("interface enumeration failed: %s", tostring(err))
    end
    return sent_count
end

local function valid_done_response(t)
    return type(t) == "table"
        and t.status == "done"
        and type(t.ip) == "string" and t.ip ~= ""
        and type(t.tcpPort) == "number"
        and type(t.name) == "string"
end

-- Broadcast a discover probe and accumulate responses for LISTEN_SECONDS.
-- Returns a list { { ip, tcpPort, name }, ... } in arrival order. Empty
-- list if nothing replied.
function M.discover()
    -- udp4(), not udp(). LuaSocket's IPv6-capable udp() routes sendto
    -- through getaddrinfo even for numeric IPv4 addresses, which fails on
    -- the MA3 desk's build. Pure-IPv4 socket bypasses this. Matches MArkers
    -- prior art at MArkersLIVE_deobfuscated.lua:10199.
    local sock = socket.udp4()
    if not sock then
        log("socket.udp4() returned nil; cannot broadcast")
        return {}
    end

    -- Ephemeral local port; let the kernel pick. Enable broadcast so sendto
    -- to 255.255.255.255 isn't EACCES-rejected.
    sock:setsockname("*", 0)
    sock:setoption("broadcast", true)
    sock:settimeout(RECV_POLL_TIMEOUT)

    local probe = json.encode({
        action = "discover",
        protocolVersion = version.PROTOCOL_VERSION,
    })

    -- Enumerate MA3 interfaces and broadcast per NIC. The desk's LuaSocket
    -- build does not accept "255.255.255.255" as a literal in sendto
    -- (getaddrinfo rejects it without AI_NUMERICHOST). Per-NIC directed
    -- broadcast is the working pattern, validated by MArkers prior art at
    -- MArkersLIVE_deobfuscated.lua:10169-10192. Don't "simplify" this back
    -- to limited broadcast — D4 was reversed precisely because it doesn't
    -- work on this LuaSocket build.
    local sent_count = broadcast_to_all_nics(sock, probe)
    if sent_count == 0 then
        log("no broadcast sent (no linked interfaces with valid IP/mask)")
        sock:close()
        return {}
    end

    local responses = {}
    local deadline = socket.gettime() + LISTEN_SECONDS

    while socket.gettime() < deadline do
        local data, peer_ip_or_err, peer_port = sock:receivefrom(RECV_BUFFER)
        if data then
            local ok, decoded = pcall(json.decode, data)
            if not ok then
                log("malformed response from %s: %s", tostring(peer_ip_or_err), tostring(decoded))
            elseif decoded.status == "error" then
                log("error response from %s: code=%s message=%s",
                    tostring(peer_ip_or_err),
                    tostring(decoded.code),
                    tostring(decoded.message))
            elseif valid_done_response(decoded) then
                responses[#responses + 1] = {
                    ip = decoded.ip,
                    tcpPort = decoded.tcpPort,
                    name = decoded.name,
                }
            else
                log("unexpected response shape from %s:%s: %s",
                    tostring(peer_ip_or_err), tostring(peer_port), tostring(data))
            end
        elseif peer_ip_or_err ~= "timeout" then
            log("receivefrom error: %s", tostring(peer_ip_or_err))
            break
        end
    end

    sock:close()
    return responses
end

-- UserVars persistence. Wrapped in pcall so missing API doesn't crash the
-- plugin — the caller surfaces a clean error in the UI if it fails.
local USERVAR_IP = "ZealSync_IP"
local USERVAR_PORT = "ZealSync_Port"
local USERVAR_NAME = "ZealSync_Name"

local function user_vars()
    local vars
    pcall(function() vars = UserVars() end)
    return vars
end

function M.persist_endpoint(entry)
    local vars = user_vars()
    if not vars or type(SetVar) ~= "function" then
        return false, "UserVars/SetVar unavailable"
    end
    local ok = pcall(function()
        SetVar(vars, USERVAR_IP, tostring(entry.ip))
        SetVar(vars, USERVAR_PORT, tostring(entry.tcpPort))
        SetVar(vars, USERVAR_NAME, tostring(entry.name))
    end)
    if not ok then return false, "SetVar threw" end
    return true
end

function M.read_endpoint()
    local vars = user_vars()
    if not vars or type(GetVar) ~= "function" then return nil end
    local ip, port, name
    pcall(function()
        ip = GetVar(vars, USERVAR_IP)
        port = GetVar(vars, USERVAR_PORT)
        name = GetVar(vars, USERVAR_NAME)
    end)
    if type(ip) ~= "string" or ip == "" then return nil end
    local port_num = tonumber(port)
    if not port_num then return nil end
    return { ip = ip, tcpPort = port_num, name = tostring(name or "") }
end

return M
