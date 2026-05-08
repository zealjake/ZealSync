-- ZealSync wire-protocol client. One request per connection.
-- Uses LuaSocket; rxi/json.lua for encode/decode.

-- LuaSocket and json are both available on the MA3 desk's Lua path
-- (proven by MArkersLIVE — see docs/reference/MArkersLIVE_deobfuscated.lua).
-- ma3/shared/json.lua is vendored as a fallback only.
local socket = require("socket")
local json = require("json")

local M = {}

local CLIENT_MAGIC = "MC"
local SERVER_MAGIC = "MS"
local DEFAULT_TIMEOUT = 2.0

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

function M.send_request(host, port, request_table, timeout)
    timeout = timeout or DEFAULT_TIMEOUT
    local sock = socket.tcp()
    if not sock then return nil, "socket.tcp() returned nil" end
    sock:settimeout(timeout)

    local ok, err = sock:connect(host, port)
    if not ok then sock:close(); return nil, "connect: " .. tostring(err) end

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
