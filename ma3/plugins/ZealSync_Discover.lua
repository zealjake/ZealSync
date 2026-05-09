-- ZealSync_Discover — broadcast UDP discovery, persist endpoint to UserVars.
--
-- Run from the MA3 plugin pool. Broadcasts on UDP 255.255.255.255:29881,
-- listens 5 seconds, picks the first response (D5 — first response wins;
-- picker dialog comes in M4), and writes ZealSync_IP / ZealSync_Port /
-- ZealSync_Name UserVars.

local componentName = select(1, ...)
local pluginName    = select(2, ...)
local signalTable   = select(3, ...)
local myHandle      = select(4, ...)

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

local discover = load_shared("discover")

local function main(...)
    Printf("ZealSync_Discover: broadcasting on 255.255.255.255:29881, listening 5s...")
    local responses = discover.discover()

    if #responses == 0 then
        Printf("ZealSync_Discover: No Reaper found.")
        return
    end

    Printf("ZealSync_Discover: %d response(s) received:", #responses)
    for i, r in ipairs(responses) do
        Printf("  [%d] %s — %s:%d", i, tostring(r.name), tostring(r.ip), tonumber(r.tcpPort) or 0)
    end

    -- D5: first response wins. The picker dialog lands in M4.
    local chosen = responses[1]
    local ok, err = discover.persist_endpoint(chosen)
    if not ok then
        Printf("ZealSync_Discover: failed to persist UserVars: %s", tostring(err))
        return
    end
    Printf("ZealSync_Discover: Persisted: %s — %s:%d",
        tostring(chosen.name), tostring(chosen.ip), tonumber(chosen.tcpPort) or 0)
end

return main
