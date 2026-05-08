-- ZealSync M1 — minimal info round-trip plugin.
-- Sends `info` to the Reaper extension at 127.0.0.1:29882 and Printfs each response field.

local componentName = select(1, ...)
local pluginName    = select(2, ...)
local signalTable   = select(3, ...)
local myHandle      = select(4, ...)

-- Resolve ma3/shared/wire.lua relative to the plugin directory. MA3_Tools'
-- ClaudeBridge uses the same dofile pattern (lua/plugins/ClaudeBridge.lua).
-- Adjust the path below if the repo lives elsewhere on the desk.
local SHARED_WIRE_PATH = "/Users/jake/Documents/dev/ZealSync/ma3/shared/wire.lua"
local wire = dofile(SHARED_WIRE_PATH)

local HOST = "127.0.0.1"
local PORT = 29882

local function main(...)
    Printf("ZealSync_Info: sending info to %s:%d ...", HOST, PORT)
    local resp, err = wire.send_request(HOST, PORT, {
        action = "info",
        protocolVersion = "1.0",
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
