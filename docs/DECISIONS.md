# ZealSync decisions log

D-numbered decisions made during planning, recorded here so future sessions
can find the rationale without trawling chat threads. Each entry is brief
by design — the chat threads have the full conversation; this file is the
index.

Format per entry:

- One-line summary of the decision.
- "Settled" or "Reversed" with date.
- Brief rationale (2–4 lines).
- For reversals: original decision, why it was wrong, the fix's commit SHA.

## M2 — info handler, main-thread queue, UDP discovery

### D1 — wire protocol authoritative over PLAN.md

**Settled 2026-05-08.**
PLAN.md §M2 mentioned "sample rate" and "Reaper version" for the info verb;
neither field exists in WIRE_PROTOCOL §7.1. Wire protocol wins. PLAN.md is
loose phrasing.

### D2 — wait mechanics: handler captures fd, main-thread closure writes final frame

**Settled 2026-05-08.**
Listener thread invokes the handler. Handler synchronously sends
`{"status":"wait"}`, enqueues a closure capturing the connection fd onto
the main-thread queue, returns DispatchDeferred. Closure writes the final
done/error frame directly to the captured fd. Each connection has its own
fd; concurrent requests don't serialise.

### D3 — info handler placement: src/sync/info.cpp

**Settled 2026-05-08.**
Treat `reaper/src/sync/` as "all verb handlers." M7's `transport/` is the
only sibling. No `src/handlers/` for one file.

### D4 — UDP broadcast: per-NIC enumeration via Obj.Children(Root().Interfaces)

**REVERSED 2026-05-09.**
**Original decision (2026-05-08):** broadcast to `255.255.255.255`, defer
per-NIC enumeration to M2-followup. Rationale: "single-subnet show LANs
are the assumed deployment."
**Why it was wrong:** desk testing revealed the MA3 LuaSocket build does
not accept `"255.255.255.255"` as a literal in `sendto` (`getaddrinfo`
rejects it without `AI_NUMERICHOST`). Per-NIC enumeration is required by
the LuaSocket build, not optional based on topology. The MArkers prior art
at `MArkersLIVE_deobfuscated.lua:10169-10192` already encoded this fact;
we modelled `discover.lua` on MArkers but skipped this part by mistake.
**Fix:** commit `aa56107` on `m2/info-and-discovery` (per-NIC enumeration),
plus commit `41970b0` (`socket.udp4()` — same LuaSocket family of quirks).

### D5 — picker UI: first response wins, log all

**Settled 2026-05-08.**
No picker dialog in M2. Manual `ZealSync_Discover` plugin picks the first
response, logs all received. Picker dialog deferred to M4 alongside the
sync preview dialog work, where the `GrandMA3_UI_Agent.md` primitives are
already being built.

### D6 — silent re-discover on connect failure

**Settled 2026-05-08.**
WIRE_PROTOCOL §6.4 specifies operator confirmation on auto-rediscover.
M2 carve-out: silent re-discover with log message, until M4's dialog work
provides a confirmation prompt.

### D7 — wait-loop with cap of 60 iterations

**Settled 2026-05-08.**
MA3 read path loops on `wait` continuations, resetting socket deadline per
§5.2. Hard cap at 60 iterations as client-side safety belt; on exceeding,
return synthetic decoded-table error
`{status="error", code="waitCapExceeded"}` matching server-side error
envelope shape.

### D8 — vendor WDL as copy, sibling-of-sdk layout

**Settled 2026-05-08. Layout modified during execution.**
Vendor WDL into `reaper/third_party/` as a copy (not git submodule). Initial
plan was `reaper/third_party/WDL/`; modified the same day to
`reaper/third_party/reaper-sdk/WDL/` (sibling of `sdk/`) because the SDK
header `reaper_plugin.h:48` has `#include "../WDL/swell/swell.h"`, which is
relative to the SDK header's own directory. Sibling layout matches upstream
REAPER source tree.
Surface: three headers (`swell.h`, `swell-types.h`, `swell-functions.h`).

### D9 — MA3 shared-module loading: load_shared helper inlined per plugin

**Settled 2026-05-08.**
`GetPath('plugins')` + `dofile(absolute path)`, pattern from
`MA3_Tools/lua/plugins/ClaudeBridge.lua:429-458`. Inlined per plugin file
(no separate loader module — chicken-and-egg). Errors raised via `error()`,
not returned as tagged strings — ZealSync plugins want loud console
failures. Install location: `<MA3 plugins root>/ZealSync_shared/`, distinct
from MA3_Tools' `zeal_shared/`.

### D10 — dev port 29892, ZEALSYNC_TCP_PORT env override

**Settled 2026-05-08.**
Server reads `ZEALSYNC_TCP_PORT` env var (default 29892 during M2–M6) to
coexist with ZealServer on 29882. M7 cutover flips default to 29882. UDP
discovery port stays 29881 (no ZealServer collision). MA3 client reads
`tcpPort` from discovery response — never hardcodes a TCP port.

## M3 — markers verb (read-only)

### D11 — MA3 log format for marker list

**Settled 2026-05-10.**
Three log lines per `markers` request: a summary, per-marker lines in
timeline order, a colorGroups summary. Per-marker line:
`[markers] <idx> <startTime>s [<endTime>s|-]  #<color hex>  "<name>"`
where `idx` is 1-based for human readability, `color` is the wire-format
24-bit RGB rendered as zero-padded 6-digit hex, `endTime` is `-` for
point markers and `<seconds>s` for regions. Summary line:
`[markers] received N markers across M color groups`. Trailing line:
`[markers] colorGroups: #<hex>×<count>, ...` in §7.2.2 order. M4's UI
will surface the same data in the preview dialog; the log is the M3
diagnostic surface only.

### D12 — Hot-reload flag for load_shared

**Settled 2026-05-10.**
Inlined `load_shared` helper in every ZealSync plugin checks
`_G.ZEALSYNC_HOTRELOAD` before returning the cached `_G.ZealSync_<name>`
slot; if truthy, skip the cache and re-`dofile` from disk. Off by
default. Folded into M3 from the M3+ backlog item. Documented in
`ma3/docs/install.md`. ~5 lines per plugin file.

### D13 — marker enumeration via GetRegionOrMarker, not EnumProjectMarkers3

**Settled 2026-05-10.**
Marker enumeration uses `GetRegionOrMarker(proj, i, "")` plus
`GetRegionOrMarkerInfo_Value` / `GetSetRegionOrMarkerInfo_String` for
all per-marker fields, including `I_DISPLAYEDCOLOR` and `GUID`. Cleaner
than the path the M3 plan suggested (`EnumProjectMarkers3` for fields,
`GetSetProjectInfo_String("MARKER_GUID:idx", ...)` for the GUID): the
SDK header explicitly tags both `EnumProjectMarkers3` and
`MARKER_GUID:X` as "discouraged. see GetRegionOrMarker,
GetSetRegionOrMarkerInfo_String." Matches MArkers prior art at
`MArkersServer_clean.lua:1099-1115`.

### D14 — bpmAtPosition wrapper returns full triple

**Settled 2026-05-10.**
The `reaper_api/` wrapper computing BPM at a position returns
`{bpm, numerator, denominator}`, not BPM only. §7.4 (M6, tempo verb)
will reuse this wrapper unchanged. Wrapper name:
`time_sig_at_time(seconds) -> {bpm, numerator, denominator}`.
