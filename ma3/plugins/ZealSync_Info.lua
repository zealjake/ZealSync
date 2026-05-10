-- ZealSync_Info — diagnostic plugin. Sends an `info` request to the Reaper
-- extension and prints every WIRE_PROTOCOL §7.1 response field to System
-- Monitor. Used to confirm wire-protocol health and to read project-level
-- metadata (frame rate, drop-frame flag, project GUID, etc.) without
-- opening Reaper.

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
    -- D12: _G.ZEALSYNC_HOTRELOAD bypasses the cache so iterating on shared
    -- modules during dev doesn't require a desk restart. Off by default.
    if _G[cache_key] and not _G.ZEALSYNC_HOTRELOAD then return _G[cache_key] end
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
        Printf("ZealSync_Info: ERROR — code=%s  message=%s",
            tostring(resp.code), tostring(resp.message))
        return
    end

    -- savedMeta is `null` in M2 (§7.1.3 — the saveMeta verb lands in M6).
    -- rxi/json decodes null as Lua nil, so the field is absent from the
    -- table; print "(none)" so the line reads as "this field was null"
    -- rather than "this code forgot to handle nil".
    local savedMeta = resp.savedMeta
    if savedMeta == nil then savedMeta = "(none)" else savedMeta = tostring(savedMeta) end

    Printf("ZealSync_Info: response received (status=%s)", tostring(resp.status))
    Printf("ZealSync_Info:   protocolVersion = %s", tostring(resp.protocolVersion))
    Printf("ZealSync_Info:   buildVersion    = %s", tostring(resp.buildVersion))
    Printf("ZealSync_Info:   projectName     = %s", tostring(resp.projectName))
    Printf("ZealSync_Info:   projectGUID     = %s", tostring(resp.projectGUID))
    Printf("ZealSync_Info:   projectPath     = %s", tostring(resp.projectPath))
    Printf("ZealSync_Info:   projectLength   = %s", tostring(resp.projectLength))
    Printf("ZealSync_Info:   timeOffset      = %s", tostring(resp.timeOffset))
    Printf("ZealSync_Info:   frameRate       = %s", tostring(resp.frameRate))
    Printf("ZealSync_Info:   dropFrame       = %s", tostring(resp.dropFrame))
    Printf("ZealSync_Info:   savedMeta       = %s", savedMeta)
end

return main
