-- ZealSync M1 — minimal info round-trip plugin.
-- Sends `info` to the Reaper extension and Printfs each response field.

local componentName = select(1, ...)
local pluginName    = select(2, ...)
local signalTable   = select(3, ...)
local myHandle      = select(4, ...)

-- Shared-module loader. Inlined per plugin file (D9): no separate loader
-- module to avoid the chicken-and-egg of bootstrapping a loader. Pattern
-- modelled on MA3_Tools/lua/plugins/ClaudeBridge.lua:429-458, with errors
-- raised loudly via error() instead of returned as tagged strings.
--
-- Install: copy ma3/shared/*.lua to <MA3 plugins root>/ZealSync_shared/.
-- See ma3/docs/install.md for the full procedure.
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

local wire = load_shared("wire")

local function main(...)
    Printf("ZealSync_Info: sending info ...")
    local resp, err = wire.send_request({
        action = "info",
        protocolVersion = wire.PROTOCOL_VERSION,
        dataPool = HandleToInt(DataPool()),
    })
    if not resp then
        Printf("ZealSync_Info: ERROR — %s", tostring(err))
        return
    end
    if resp.status == "error" then
        Printf("ZealSync_Info: server error code=%s message=%s",
            tostring(resp.code), tostring(resp.message))
        return
    end
    Printf("ZealSync_Info: response (status=%s)", tostring(resp.status))
    Printf("  protocolVersion = %s", tostring(resp.protocolVersion))
    Printf("  buildVersion    = %s", tostring(resp.buildVersion))
    Printf("  projectName     = %s", tostring(resp.projectName))
    Printf("  projectGUID     = %s", tostring(resp.projectGUID))
    Printf("  projectPath     = %s", tostring(resp.projectPath))
    Printf("  projectLength   = %s", tostring(resp.projectLength))
    Printf("  timeOffset      = %s", tostring(resp.timeOffset))
    Printf("  frameRate       = %s", tostring(resp.frameRate))
    Printf("  dropFrame       = %s", tostring(resp.dropFrame))
    Printf("  savedMeta       = %s", tostring(resp.savedMeta))
end

return main
