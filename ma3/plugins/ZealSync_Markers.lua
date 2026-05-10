-- ZealSync_Markers — diagnostic plugin. Sends a `markers` request to the
-- Reaper extension and prints the full marker list per WIRE_PROTOCOL §7.2
-- to System Monitor. Used to confirm the markers handler end-to-end before
-- M4 lands the sync preview dialog.

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

-- 24-bit RGB integer -> "RRGGBB" zero-padded hex (D11). string.format with
-- %06X uppercases; lowercase via string.lower for log readability and to
-- match the wire-protocol GUID format convention (lowercase hex).
local function color_hex(c)
    return string.lower(string.format("%06X", tonumber(c) or 0))
end

local function format_end(marker)
    if marker.endTime == nil then return "-" end
    return string.format("%.3fs", tonumber(marker.endTime) or 0)
end

local function main(...)
    Printf("ZealSync_Markers: sending markers ...")
    local resp, err = wire.send_request({
        action = "markers",
        protocolVersion = wire.PROTOCOL_VERSION,
        dataPool = HandleToInt(DataPool()),
    })
    if not resp then
        Printf("ZealSync_Markers: ERROR — %s", tostring(err))
        return
    end
    if resp.status == "error" then
        Printf("ZealSync_Markers: ERROR — code=%s  message=%s",
            tostring(resp.code), tostring(resp.message))
        return
    end

    local markers = resp.markers or {}
    local color_groups = resp.colorGroups or {}

    -- D11: summary line, per-marker lines in timeline order, colorGroups
    -- summary. Idx 1-based for human readability; the wire array is already
    -- sorted server-side (§7.2.1), so we just walk it.
    Printf("[markers] received %d markers across %d color groups",
        #markers, #color_groups)

    for i, m in ipairs(markers) do
        Printf('[markers] %d %.3fs %s  #%s  "%s"',
            i,
            tonumber(m.startTime) or 0,
            format_end(m),
            color_hex(m.color),
            tostring(m.name or ""))
    end

    -- colorGroups one-line summary. Build a comma-separated list in the
    -- §7.2.2 order the server already gave us.
    local parts = {}
    for _, g in ipairs(color_groups) do
        parts[#parts + 1] = string.format("#%s×%d", color_hex(g.color), tonumber(g.count) or 0)
    end
    Printf("[markers] colorGroups: %s", table.concat(parts, ", "))
end

return main
