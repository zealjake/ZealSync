-- Tiny constants module, loaded by wire and discover. Lives in its own file
-- so wire ↔ discover don't form a circular load_shared dependency: wire loads
-- discover for connect-with-fallback; if discover also loaded wire (for
-- PROTOCOL_VERSION) we'd recurse during the first load and the cache slots
-- wouldn't be populated yet. This file has no dependencies of its own.

local M = {}

-- Wire-protocol version string, sent on every request and verified by the
-- server (WIRE_PROTOCOL §10.3).
M.PROTOCOL_VERSION = "1.0"

return M
