-- ZealSync wire-protocol client. One request per connection (§2.5).
--
-- Resolves the Reaper extension's endpoint via UserVars; falls back to UDP
-- discovery on miss or stale endpoint per D6 (silent re-discover; the
-- operator-confirmation prompt comes in M4 with the picker dialog).
--
-- Uses LuaSocket (a system module on the MA3 desk) and our vendored
-- rxi/json.lua loaded via load_shared.

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

-- LuaSocket is a system module on the desk — lives on the MA3 Lua path, not
-- in our ZealSync_shared/ folder. require() is correct here.
local socket = require("socket")
local json = load_shared("json")
local version = load_shared("version")
local discover = load_shared("discover")

local M = {}

-- Re-export so existing call sites that still read wire.PROTOCOL_VERSION
-- keep working. New code should prefer load_shared("version").PROTOCOL_VERSION.
M.PROTOCOL_VERSION = version.PROTOCOL_VERSION

local CLIENT_MAGIC = "MC"
local SERVER_MAGIC = "MS"
local DEFAULT_TIMEOUT = 2.0
local CONNECT_TIMEOUT = 2.0 -- §3.3 default; matches recv timeout for symmetry

local function log(fmt, ...)
    if Printf then Printf("ZealSync: " .. fmt, ...) end
end

local function recv_exact(sock, n)
    local buf = {}
    local got = 0
    while got < n do
        local chunk, err, partial = sock:receive(n - got)
        if not chunk then
            if partial and #partial > 0 then
                buf[#buf + 1] = partial
                got = got + #partial
            end
            return nil, err or "closed"
        end
        buf[#buf + 1] = chunk
        got = got + #chunk
    end
    return table.concat(buf)
end

-- Open a TCP socket and connect, settimeout for the connect call.
-- Returns sock on success, nil + err on failure. Caller closes on error.
local function try_connect(ip, port)
    local sock = socket.tcp()
    if not sock then return nil, "socket.tcp() returned nil" end
    sock:settimeout(CONNECT_TIMEOUT)
    local ok, err = sock:connect(ip, port)
    if not ok then
        sock:close()
        return nil, tostring(err)
    end
    return sock
end

-- Resolve the Reaper extension's endpoint and return a connected TCP socket.
-- Strategy:
--   1. Read UserVars endpoint. If present, try to connect.
--   2. On miss or connect failure, run UDP discovery once. Persist first
--      response. Try to connect to the discovered endpoint.
--   3. If discovery returns nothing, or the post-discovery connect also
--      fails, return nil + error string. No second discovery loop —
--      a misconfigured firewall must not generate infinite UDP traffic.
function M.connect()
    local persisted = discover.read_endpoint()
    if persisted then
        local sock, err = try_connect(persisted.ip, persisted.tcpPort)
        if sock then return sock end
        log("connect to %s at %s:%d failed (%s); rediscovering",
            tostring(persisted.name), tostring(persisted.ip),
            tonumber(persisted.tcpPort) or 0, tostring(err))
    else
        log("no persisted endpoint; discovering Reaper extension...")
    end

    local responses = discover.discover()
    if #responses == 0 then
        log("no Reaper found on the network")
        return nil, "no_reaper_found"
    end

    local chosen = responses[1]
    local persisted_ok, persist_err = discover.persist_endpoint(chosen)
    if not persisted_ok then
        -- Endpoint discovered but couldn't be persisted (e.g. UserVars API
        -- missing). Carry on with the connect attempt — the next plugin
        -- run will rediscover, but this run can still proceed.
        log("discovered %s at %s:%d (warning: persist failed: %s)",
            tostring(chosen.name), tostring(chosen.ip),
            tonumber(chosen.tcpPort) or 0, tostring(persist_err))
    else
        log("discovered %s at %s:%d",
            tostring(chosen.name), tostring(chosen.ip),
            tonumber(chosen.tcpPort) or 0)
    end

    local sock, err = try_connect(chosen.ip, chosen.tcpPort)
    if sock then return sock end
    log("connect to discovered %s at %s:%d failed (%s)",
        tostring(chosen.name), tostring(chosen.ip),
        tonumber(chosen.tcpPort) or 0, tostring(err))
    return nil, "connect_failed_after_discovery"
end

-- Send a request, read the response, close. Endpoint resolved internally
-- via M.connect() — callers don't see host/port.
function M.send_request(request_table, timeout)
    timeout = timeout or DEFAULT_TIMEOUT

    local sock, connect_err = M.connect()
    if not sock then return nil, connect_err end
    sock:settimeout(timeout)

    local body = json.encode(request_table)
    local len = #body
    local len_bytes = string.pack("<I4", len)
    local frame = CLIENT_MAGIC .. len_bytes .. body

    local sent_ok, send_err = sock:send(frame)
    if not sent_ok then sock:close(); return nil, "send: " .. tostring(send_err) end

    local magic, mag_err = recv_exact(sock, 2)
    if not magic then sock:close(); return nil, "recv magic: " .. tostring(mag_err) end
    if magic ~= SERVER_MAGIC then sock:close(); return nil, "bad magic: " .. magic end

    local len_raw, len_err = recv_exact(sock, 4)
    if not len_raw then sock:close(); return nil, "recv length: " .. tostring(len_err) end
    local resp_len = string.unpack("<I4", len_raw)

    local resp_body = ""
    if resp_len > 0 then
        local b, body_err = recv_exact(sock, resp_len)
        if not b then sock:close(); return nil, "recv body: " .. tostring(body_err) end
        resp_body = b
    end
    sock:close()

    local decoded_ok, decoded = pcall(json.decode, resp_body)
    if not decoded_ok then return nil, "json decode: " .. tostring(decoded) end
    return decoded
end

return M
