# Sync from Reaper — Complete Technical Walkthrough

This document traces, in order of execution, exactly what happens when a grandMA3
operator presses the "Sync from Reaper" macro button shipped by the MArkersLIVE
plugin. It cross-references the deobfuscated MA3-side client
(`MArkersLIVE_deobfuscated.lua`, MA3:N references) with the deobfuscated Reaper-
side server (`MArkersServer_clean.lua`, Reaper:N references). Hashed field
identifiers of the form `aXXXXXXXX` are kept verbatim where their plaintext
name was not recovered; inferred meanings are noted alongside.

The MArkersServer plugin version constant the MA3 client demands is the literal
string `"2.2.0.0"` returned by Reaper:1514 in `di()`'s response key
`afd0469a` — every cue-aware command refuses to proceed if this does not match
the constant `y.str_05c7` held on the MA3 side (MA3:15635-15636).

## 1. Trigger and entry point

Sync from Reaper begins life as an MA3 macro line of the form
`Plugin "MArkersLIVE" "SyncFromReaper"`. The shipping plugin offers it from a
default macro pool entry at MA3:29094-29107 (`{ afe6d202 = 4, a59a115b =
"Sync from Reaper", ... a082ca40 = "Plugin \"MArkersLIVE\"
\"SyncFromReaper\"" }`), and the in-plugin Setup wizard installs that macro at
MA3:25325 with `CmdIndirect(string.format("Call Plugin \"%s\"
\"SyncFromReaper\"", y.plugin_label))`.

When MA3 calls the plugin, the plugin's main returns the dispatcher function
`CR` at MA3:29955. `CR` immediately delegates to `A.a7997ecc(p8, p2, CO)`
(MA3:29956), where `CO` is the top-level command dispatcher and `p2` is the
argument string the macro was called with — in this case, `"SyncFromReaper"`.

`CO` is defined at MA3:29781. Its argument `CP` is the literal command word.
The dispatcher first runs `yt.a20996e0()` (a settings-snapshot pass —
MA3:29783) then takes the early-out branch at MA3:29784 that handles the
"first-run, settings not configured" case via `MessageBox`. With settings
populated, the next `elseif` at MA3:29807 matches:

```lua
elseif string.match(CP, "^SyncFromReaper") then
  local ro = string.gsub(CP, "^SyncFromReaper", "")
  local dl = CK(ro)
  if dl then
    return CG(dl)
  end
```

The trailing `ro` captures any suffix after the literal `SyncFromReaper`
(empty for the basic call; the plugin uses suffixes to pass per-call options
through `rm.a39287ea(ro)` later — see §2). The actual sync work is `CK(ro)`.
`CK` is defined at MA3:29683-29723 and is the entry point this document
follows.

`CG(dl)` (MA3:29071-29077) is the universal error sink: it deletes the
`MArkersLIVE` UserVar and surfaces `dl` via `A.a77a80af(dl)` (a MessageBox
wrapper). When `CK` returns nil for success, control falls through to the
final unconditional `CG()` at MA3:29952 which clears the UserVar and exits.

## 2. Pre-flight checks

`CK` at MA3:29683 runs the following sequence before any actual data
exchange:

1. **Performance timer start.** `local ym = A.ab61e23f()` (MA3:29684). This
   is the plugin's coarse stopwatch helper used throughout the sync to log
   elapsed time per phase via `A.ac167e2b(ym, "<label>")`.

2. **Info handshake.** `local qF, dl = pX.a6ab9715()` (MA3:29685). This is
   the version-checked TCP round-trip described fully in §5. If `dl` is set,
   `CK` returns it immediately and the operator sees an error MessageBox via
   `CG`. The returned `qF` is the project metadata blob; it is reused as the
   primary "project descriptor" object through every subsequent call.

3. **Marker fetch.** `A.ac167e2b(ym, "Get Project Info")` (MA3:29689) caps
   the prior phase, then `local ry, dl = yg.a4d5c370()` (MA3:29690) issues
   the `markers` verb (see §7 and Reaper:1052 `bS`). Failure short-circuits.

4. **MIDI fetch.** Despite the misleading log label "Get Marker Info"
   (MA3:29694), the next call is `xr.a1f734bc()` at MA3:29695, which sends
   the `midi` verb (Reaper:1341 `cE`). The wrapper post-processes the
   response in place at MA3:21474-21531 — parsing trailing `[...]` tags out
   of MIDI track names to extract sequence-type hints (`a04e85a2`), priority
   counts (`a4887d7a`), repeat (`abf2dc54`) and reset (`a44f1259`) flags.

5. **Tempo fetch.** `local rA, dl = yg.a55a1131()` (MA3:29700) issues the
   `tempo` verb (Reaper:1161 `cn`).

6. **Source-mark + arg-merge.** Two fields on the metadata blob are stamped:
   `qF.str_7a7d = "Network"` (MA3:29705 — distinguishes a Network-sourced
   sync from `"File"`-sourced RPP imports — compare MA3:29667), and
   `qF.a936e685 = ro` after `ro = rm.a39287ea(ro)` parses any suffix options
   the macro author bolted onto the verb (MA3:29706-29707).

Only once all four data structures (`qF`, `ry`, `rz`, `rA`) are non-nil does
`CK` enter the body builder `CH` at MA3:29708. There is no caching: each
sync re-fetches every blob.

The Import-from-RPP variant `CI` (MA3:29642) shares the same pipeline but
swaps the network info+markers+midi+tempo fetches for a static parse of an
on-disk `.rpp` file via `rm.a90c8a99` (MA3:17078). Both paths converge on
`CH`.

## 3. NIC discovery and Reaper selection

The very first network call `pX.a6ab9715()` reads `ReaperIP` and
`ReaperPORT` from `UserVars()` (MA3:15601-15602). If those vars are empty,
or if the subsequent TCP `connect()` fails, the discovery routine `q1()`
(MA3:15324-15377) is invoked. `q1` is wrapped by `pX.a8b0dc9b()`
(MA3:15379-15409) which prompts the operator to pick a responder.

Discovery flow:

1. `cA.udp4()` opens a UDP socket bound to `*:0`, broadcast option set
   (MA3:15326-15336).
2. The probe payload is `{ a38325d7 = "ReaperPoll" }` — MessagePack-encoded
   via `pY` at MA3:15340. (`a38325d7` is the action verb hash. `ReaperPoll`
   is one of the few verbs not handled in the main `eB` dispatcher; the
   server picks it up in its UDP listener at Reaper:2159-2179, function
   `f2`.)
3. `A.ac702761(q3, q2, q4)` sends the probe to every per-NIC directed
   broadcast computed via `A.a74abe10` (MA3:10148-10167). The destination
   port is `29881` (MA3:15325).
4. The receive loop yields with `coroutine.yield(0.1)` for up to 5 seconds
   total (MA3:15346, MA3:15364), polling `q3:receive()` and accumulating
   responder dicts into `q6`.
5. `pX.a8b0dc9b()` then converts `q6` into a `PopupInput` choice list at
   MA3:15384-15397 — each entry shows `<friendly_name> - <ip>`. The
   operator's choice is stored to `ReaperIP`, `ReaperPORT`, `ReaperNAME`
   UserVars (MA3:15405-15407).

Reaper-side, `f2` at Reaper:2159 binds UDP `0.0.0.0:29881`, decodes each
inbound MessagePack packet, and replies back via the helper `eZ` at
Reaper:2151-2157 — which uses the trick of opening a connected UDP socket
to the prober's address to recover the local-side outgoing IP, then sends
that IP plus the TCP port `aB` (which `eC` at Reaper:2022 has bound to
`29882` plus a small offset). `aB` is exposed as the responder's
`aed31a9c` field; the local IP is `a74faa94`; the friendly name is
`abf27542`.

There is no persistent connection. Once IP+PORT UserVars are populated,
every command opens a fresh TCP socket via `qe()` (MA3:15411). If the
socket connect fails or the response times out (default 2 s, MA3:15420
`qg.ac420da5 or 2`), `qe` re-runs `pX.a8b0dc9b()` and retries against the
new endpoint. The re-discovery prompt is wrapped at MA3:15515-15539, where
"Connection to remote reaper failed. Would you like to choose a new remote
reaper?" is offered.

## 4. The framing protocol

Every TCP message in either direction wears a six-byte header.

- **Client → server (MC frame):** ASCII `"MC"`, then little-endian uint32
  payload length, then a MessagePack-encoded Lua table. Built at
  MA3:15412-15413: `q4 = "MC" .. string.pack("<I4", #q4) .. q4`.
- **Server → client (MS frame):** ASCII `"MS"`, then little-endian uint32
  payload length, then a MessagePack-encoded Lua table. Built at
  Reaper:2062: `eL = "MS" .. string.pack("<I4", #eL) .. eL`.

The payload encoder on the MA3 side is the local `pY` (referenced
MA3:15340, MA3:15413). On the Reaper side it is `aH` (Reaper:2057).
Both are MessagePack libraries; `o.pack`/`o.unpack` are the stem fields
(see Reaper:1000 where `bp` calls `o.pack(a0.aa942c2a)` to persist the
metadata blob).

The MA3-side receive loop in `qe()` (MA3:15438-15591) is a hand-rolled
state machine:

1. Read 2 bytes, expect them to be `"MS"` (MA3:15444-15451).
2. Read 4 bytes for the length (MA3:15475-15476).
3. Read until `qs >= jT` (MA3:15500-15501), spooling to an `os.tmpname()`
   temp file when `jT > qv` (where `qv = 1000000`, MA3:15481, MA3:15495).
   This is the >1 MB out-of-line response path. The 8 KB chunk size
   constant for the post-receive read-back is `qw = 8096` (MA3:15556).

The decoder is `p_` (MA3:15568). After decoding, `qe` checks for the
**continuation sentinel** at MA3:15571:

```lua
if qz and qz.acf4591d == "wait" then
  local qz, dl = qm()
  cZ:close()
  return qz, dl
end
```

That is, if the response's `acf4591d` (`status`) field is the literal
string `"wait"`, `qe` recursively re-enters its own receive routine on the
same socket. The Reaper side issues `wait` via `eM` at Reaper:2070-2080
when a long-running handler wants to acknowledge the request before it
finishes. The waveform handler (§8) is the canonical user of this pattern,
but the dispatcher hooks `eM` onto every inbound request as field
`a01172df` (Reaper:2106) so any handler can call it.

Within `qe()`, the pre-`receive` connect timeout is `0.1 s` (MA3:15418-
15419), the per-command total deadline is `qg.ac420da5 or 2 s`
(MA3:15420). Cue-aware sends never override this; the waveform send sets
`ac420da5 = ve * 0.25` (MA3:22145) where `ve` is the project length in
seconds — that timeout governs how long Reaper has to render the MP3.

The single send choke point is `pX.a51ef463` at MA3:15600-15613:

```lua
function pX.a51ef463(qg, qA, qB, qh)
  qA = qA or GetVar(UserVars(), "ReaperIP")
  qB = qB or GetVar(UserVars(), "ReaperPORT")
  local qC, dl = qe(qA, qB, qg, qh)
  if qC and type(qC) == "table" then
    if qg.ac524591 then
      return qC, dl
    end
    local qD = A.af6cc38b(qC)
    return qD, dl
  else
    return nil, "Could not connect to Reaper"
  end
end
```

`qg.ac524591` (request-flag "raw") suppresses the `A.af6cc38b` post-pass —
which is `cjson.decode` (the request handler unwraps a JSON-string field
in the response into a Lua table). Waveform sets `ac524591 = true` so the
binary MP3 bytes survive (MA3:22146).

## 5. The handshake — `info`

`pX.a6ab9715()` at MA3:15627-15641 is the version-checked entry. It sends:

```lua
{
  a38325d7 = "info",
  a20cbdb3 = HandleToInt(DataPool())
}
```

`a20cbdb3` carries the integer handle of the active MA3 DataPool — the
server uses it to pick which on-disk per-DataPool blob to return (see
Reaper:1505 `dp = be(bT.a20cbdb3)`).

The Reaper-side handler is `di` at Reaper:1495-1520. It assembles:

```lua
local dq = {
  a3bdc261 = bi,                                 -- project name (sans .RPP)
  a06af6c3 = dj,                                 -- project file path (df())
  aa5f01de = bh,                                 -- project name with extension
  a04556b5 = bb,                                 -- MATOOLSMARKERSGUID (b9())
  a27f7dd7 = dk,                                 -- project time offset
  a9c920d0 = dl,                                 -- TimeMap_curFrameRate, fps
  a5f75b55 = dm,                                 -- drop-frame flag
  afd0469a = h:gsub("^V", ""),                   -- "2.2.0.0"
  aa942c2a = dp,                                 -- per-DataPool meta (be())
  a3e4ce38 = at,                                 -- (server constant; module-level)
  a3075197 = dn                                  -- GetProjectLength
}
```

The values come from: `reaper.EnumProjects(-1)` → currentProj;
`GetProjectName`; `df()` which is `EnumProjects(-1, "")` returning the
absolute filename (Reaper:1481-1493); `GetProjectTimeOffset`;
`TimeMap_curFrameRate` returning fps + drop-frame; `b9()` reading the
project ext-state key `MATOOLSMARKERSGUID` from the namespace `"MARKERS"`
(Reaper:917-926); `be(bT.a20cbdb3)` reading the per-DataPool MessagePack
blob from the `MArkers` directory next to the project (Reaper:935-963);
`GetProjectLength`.

After receipt, MA3:15635-15636 enforces:

```lua
if qF.afd0469a ~= y.str_05c7 then
  return nil, string.format("The MArkers Server Reaper plugin must be V%s, your version is V%s", y.str_05c7, qF.afd0469a)
end
```

`y.str_05c7` is the MA3 client's hard-coded expected server version (the
plugin globals at MA3:47-66 wire it up; in the V2.3.7.0 client of this
build it is `"2.2.0.0"`). The two derived fields appended at MA3:15638-
15639 are:

- `qF.a1f2d3df` — a packed-frame value computed as
  `A.aa3c2984(qF.a27f7dd7 * 16777216, qF.a9c920d0)`. With `aa3c2984` being
  a small-format helper, this packs the project time offset (seconds × 2²⁴)
  with the frame rate; downstream cue arithmetic uses this.
- `qF.ae6dc493` — the project name's initials, computed by stripping each
  word's tail with `string.gsub(qF.a3bdc261, "(%w)%S+%s*", "%1")`.

The MA3 side also shadows the same project metadata into `qF.tc_handle_a`
(set by later phases, MA3:17297) and `qF.song_uuid` (MA3:17247). The
handshake response is therefore the seed for the entire downstream pass
in `CH`.

## 6. Project metadata exchange

The two persistent identity tokens are `MATOOLSMARKERSGUID` (project-level)
and `song_uuid` (per-DataPool). They live in two different places.

**`MATOOLSMARKERSGUID`** is a 32-hex-char value stored inside the `.rpp`
file's `<EXTSTATE>` block as

```
<EXTSTATE
  <MARKERS
    MATOOLSMARKERSGUID {<guid>}
  >
>
```

Reaper writes it via `b6(b7)` at Reaper:908-915:

```lua
reaper.SetProjExtState(-1, "MArkers", "MATOOLSMARKERSGUID", string.format("{%s}", b7))
local b8 = reaper.GetProjectName(-1)
if b8 and "" ~= b8 then
  reaper.SetProjExtState(-1, "MArkersLookup", b7, b8)
  reaper.Main_SaveProject(-1, false)
end
```

It is read back via `b9()` at Reaper:917-926, which uses
`GetProjExtState(currentProj, "MARKERS", "MATOOLSMARKERSGUID")` and
strips the `{}`. Note: `b6` writes to namespace `"MArkers"` while `b9`
reads from namespace `"MARKERS"` (uppercase) — this asymmetry is in the
shipping code; both writer and reader must therefore agree on which path
the project's history actually stamped. There is no separate "MARKERS"
namespace writer in the cleaned source — the GUID round-trips because
Reaper's ext-state key matching is case-insensitive in this context, or
because the EXTSTATE block as parsed off-disk by the MA3 client at
MA3:16963 uses the identical literal `MATOOLSMARKERSGUID` regardless of
namespace. Unclear from code: which exact namespace is canonical when
both code paths are exercised.

The MA3 side touches `MATOOLSMARKERSGUID` only through the static RPP
import path. `rm.a90c8a99` parses the RPP at MA3:17078-17241; the GUID
write into a freshly-loaded RPP is at MA3:16963-16983, which inserts it
into either an existing `<MARKERS` block, an existing `<EXTSTATE` block, or
appends a fresh `<EXTSTATE>` if none exists. On the Sync-from-Reaper
network path, the GUID is delivered as `qF.a04556b5` from the `info`
response (Reaper:1503, MA3 binds it on read), then reconciled with the
local `song_uuid` at MA3:17246-17249.

**`song_uuid`** (recovered name; appears literally in
`rD.tbl_0c3f.song_uuid`) is the per-DataPool identity. It is generated by
`b2()` at Reaper:899-906 as a UUID v4-ish hex string seeded with
`os.time()`. `rm.a4fad83d` at MA3:17243-17261 is the canonical persistor:

```lua
if rD.tbl_0c3f and rD.tbl_0c3f.song_uuid and rD.tbl_0c3f.song_uuid ~= qF.song_uuid then
  qF.song_uuid = rD.tbl_0c3f.song_uuid
  rm.a34bb13d(qF.a06af6c3, rD.tbl_0c3f.song_uuid)
end
local sP = string.format("%s%s-%s.dat", sO, qF.song_uuid, HandleToInt(DataPool()))
```

— that is, the per-DataPool MessagePack blob lives at
`<rpp_dir>/MArkers/<song_uuid>-<datapool_int>.dat`. The function
`rm.a34bb13d` is the GUID↔song-uuid lookup helper; on the Reaper side the
same pairing lives in the `MArkersLookup` ext-state namespace
(Reaper:912).

After a successful sync the round-trip closes via `pX.a255c04a(rD)` at
MA3:15615-15625 — the `saveMeta` send. It packs the entire reconciled
metadata blob `rD` into the request:

```lua
{ a38325d7 = "saveMeta", aa942c2a = rD, a20cbdb3 = HandleToInt(DataPool()) }
```

Reaper's `bp` handler at Reaper:965-1011 then:

1. Resolves the project file's `MArkers/` sibling directory `bq`
   (Reaper:970), `mkdir -p` via `aZ` (Reaper:971).
2. Reads the current GUID via `b9()` (Reaper:972).
3. If the inbound metadata's `a04556b5` differs from the current GUID
   (Reaper:973-976), updates the project ext-state by calling `b6(bb)`.
   This is the only place `MATOOLSMARKERSGUID` is written from the
   network sync path.
4. Writes the per-DataPool blob to `<MArkers>/<guid>-<datapool_int>.dat`
   (Reaper:977-1002), with a timestamped backup in `<MArkers>/backups/`
   if a previous version exists (Reaper:982-996).

## 7. Markers, regions, tempo

### `markers` — Reaper:1052 `bS`

The MA3 wrapper at MA3:22089-22099:

```lua
{ a38325d7 = "markers", a20cbdb3 = HandleToInt(DataPool()) }
```

The handler returns a top-level table with five keyed substructures
(Reaper:1055-1062):

```lua
{
  a91714e3 = {},   -- markers (point-in-time)
  a39401d9 = {},   -- regions (start+end)
  a13c343f = {},   -- master groups (one per unique color)
  a20da4dc = {},   -- ruler lanes
  a931305d = 0,    -- master color
  a91437f3 = 0     -- master lane index
}
```

The body of `bS`:

1. **Lane scan.** Reaper:1066-1093 walks `RULER_LANE_DEFAULT:0..256` via
   `GetSetProjectInfo`, recording each lane's name, color, hidden/locked/
   visible flags, default flag (2 or 3 designates the "master" lane), and
   timebase. The first lane that returns falsy from `RULER_LANE_DEFAULT:N`
   after at least one valid lane terminates the scan. Each lane becomes
   one row in `bV.a20da4dc` (table `tbl_20da`).

2. **Master color recovery.** When a lane's flag is 2 or 3, `bW` (lane
   index) and `bX` (color) are captured and end up at `a91437f3` and
   `a931305d`.

3. **Hide-base + hidden-color map.** `bL()` at Reaper:1031-1050 reads a
   pair of helper ext-state values: `MArkers/ReaperTools_HideBase` (a
   numeric base used to demote certain markers' positions) and the set of
   hidden marker colors from the namespace `ReaperTools_MarkerVisibilityCore`
   keyed by `HIDDEN_<color>=1`. The position adjustment at Reaper:1121-
   1123 (`if bU[tonumber(cj)] then by = by - bN`) demotes a hidden marker
   by `bN` so the MA3 side can filter them.

4. **Marker enumeration.** Reaper:1097-1156 walks every region and marker
   via `GetNumRegionsOrMarkers` + `GetRegionOrMarker`. For each entry:

   - `B_ISREGION` distinguishes region from marker.
   - `D_STARTPOS`, `D_ENDPOS`, `P_NAME` give time + label.
   - `I_INDEX` (display index), `I_NUMBER` (user-assigned number),
     `I_CUSTOMCOLOR`, `I_DISPLAYEDCOLOR`, `I_LANENUMBER` give styling.
   - `GUID` extracted via `GetSetRegionOrMarkerInfo_String`, then
     `guidToString`, then stripped of `{}`.

   The per-marker dict is (Reaper:1124-1135):

   ```lua
   {
     a3bdc261 = name,         -- marker name (display)
     adbfa544 = name,         -- marker name (raw)
     a5320370 = startpos,     -- start in seconds
     a12b4a07 = effective_color,
     a7044d68 = displayed_color,
     a90ff523 = i_number,     -- the user-visible ID
     a09f63fb = i_index,      -- the enumeration index
     ad40375c = guid,
     a156ed81 = bx(startpos), -- BPM at this position
     a4799f71 = lane_number
   }
   ```

   `bx(by)` at Reaper:1013-1029 walks the project's tempo map and returns
   the BPM in effect at time `by`, defaulting to the project signature.

5. **Region tail.** When `cb` (`B_ISREGION`) is true, `a72235e2 = cc` is
   added (the end position) before insertion into `bV.a39401d9`
   (Reaper:1153-1156).

6. **Master-group dedup.** For non-region markers, each unique
   `effective_color` is registered once in `bV.a13c343f` with an enabled
   flag `aedcc9ac = true`, indexed via the running counter `c9`
   (Reaper:1138-1152).

The MA3 client post-processes the response in `rm.ab34cc2a` at MA3:22097
and again in `rm.a47fed4f` (called from `CH` at MA3:29539). `rm.a47fed4f`
is the gate that decides whether the sync should proceed — it returns a
non-nil string (and thus aborts) if the markers/midi tables together
contain nothing actionable.

### `tempo` — Reaper:1161 `cn`

MA3 wrapper at MA3:22101-22110:

```lua
{ a38325d7 = "tempo", a20cbdb3 = HandleToInt(DataPool()) }
```

`cn` at Reaper:1161-1188 walks `CountTempoTimeSigMarkers` calling
`GetTempoTimeSigMarker(currentProj, Q)`. Each entry maps to:

```lua
{
  a43ac778 = bpm,        -- tempo (cr)
  a7890f1e = num,        -- time-sig numerator (bA)
  a1ac97d8 = denom,      -- time-sig denominator (bB)
  a5320370 = startpos    -- position in seconds (cq)
}
```

When a project has zero tempo markers (Reaper:1175-1186), `cn` synthesises
a single entry from `GetProjectTimeSignature2` at position 0, denominator
defaulted to 4. The MA3-side consumer is `rm.a2d2279b` (called at
MA3:29579) which materialises a Tempo Sequence at pool slot
`tempoSeqStart` (PluginVar) and stamps each tempo as a CmdEvent firing
`SetUserVariable "MATools_BPM" <bpm>`, plus an optional
`<MasterSpeed> At BPM <bpm>` if the user has selected a Speed master to
drive (MA3:17717-17725).

## 8. Audio / waveform handling

The waveform pipeline is decoupled from `CK`'s top-level pre-flight; it
runs lazily, only when the MA3 user explicitly asks for a waveform on a
specific Sound pool item. The entry is `yg.a5df0dc7(ve, oZ)` at
MA3:22136-22196, where `ve` is the project length in seconds and `oZ` is
the appearance to apply to the resulting Sound pool entry.

### MA3-side request

```lua
local yo, dl = pX.a51ef463({
  a38325d7 = "waveform",
  ac420da5 = ve * 0.25,    -- per-call timeout: 25% of project length
  ac524591 = true          -- raw response, do not JSON-decode the body
})
```

(MA3:22143-22147.) The `ac420da5` field overrides the default 2 s socket
deadline in `qe` (MA3:15420) — for a 5-minute song the timeout is 75 s.

Before sending, the MA3 side calls `yi()` at MA3:22119-22134 to total the
existing Sound pool's filesize via `Obj.Children(ShowData().MediaPools.Sounds)`
+ `yl.Filesize`, then formats via `yh()` (MB at 2 dp). After receiving
the response the size check enforces MA3's 100 MB Sound pool cap
(MA3:22159-22161).

### Reaper-side handler — Reaper:1290 `cv`

`cv` is a one-shot MP3 render bridge:

1. **Stop and unrepeat.** `CSurf_OnStop()` + `GetSetRepeat(0)`
   (Reaper:1291-1292). Sync is a destructive render; it cannot run
   alongside playback.
2. **Render-config write.** Reaper:1293-1313 sets the project's render
   config in-place via repeated `GetSetProjectInfo` / `GetSetProjectInfo_String`
   calls: `RENDER_SETTINGS=0, RENDER_BOUNDSFLAG=1, RENDER_CHANNELS=2,
   RENDER_SRATE=0, RENDER_STARTPOS=0, RENDER_ENDPOS=0, RENDER_ADDTOPROJ=0,
   RENDER_DITHER=0, RENDER_NORMALIZE=0, RENDER_TAILFLAG=0`. The render
   format is the literal MP3 v3 settings blob hard-coded in `cu.a1300d81.ab547850.ac8a7474`
   at Reaper:1198-1203 (a 16-byte little-endian struct base64-encoded:
   `"bDNwbSAAAAAAAAAACQAAAAAAAAAGAAAAQAEAAAAAAAA="`). The ASCII prefix
   `"l3pm"` confirms the format selector is Reaper's MP3 encoder
   (`l3pm` = LAME3 mp3) at quality value 6.
3. **Pattern + path.** `RENDER_FILE` is set to a `<projpath>/MA3Waveforms/`
   directory, and `RENDER_PATTERN` is set to a one-shot random token
   `cA = b2()` (Reaper:1308-1311). After rendering, the file is moved to
   the canonical path `<project>_Waveform.mp3` (Reaper:1326-1330).
4. **Render trigger.** `Main_OnCommand(40101, 0)` is the "Render project,
   using the most recent render settings" action; the next call
   `Main_OnCommandEx(42230, 0, -1)` is the synchronous render
   ("File: Render project to disk... (default)"). These are blocking, so
   the actual render takes the full waveform's worth of time before
   `cv` returns.
5. **Read back + cleanup.** Open the temp file, read all bytes into `cC`,
   record file size `cD = aF:seek("end")`, close, `os.remove`, then
   write the same bytes to the canonical filename and respond:

```lua
{
  acf4591d = "done",
  a4a6a654 = cx,            -- "<projectname>_Waveform" (sound name)
  ad3af9e6 = cx .. ".mp3",  -- filename for MA3 to write
  ad3b2478 = cC,            -- raw mp3 bytes (binary)
  a057ff63 = cD             -- byte count
}
```

(Reaper:1331-1338.) On `io.open` failure the response degrades to
`{ acf4591d = "fail" }` and the MA3 side surfaces "Waveform failed to
generate in Reaper" (MA3:22156-22158).

### The "wait" continuation

The `wait` handshake (§4) is what keeps the MA3 request socket from
timing out while Reaper's blocking render is running. The dispatcher
hooks `eM` (Reaper:2070) onto the request as `eU.a01172df`, and a
handler that needs more time can call it to send `{ acf4591d = "wait" }`
upstream, after which the MA3 receive loop at MA3:15571 recurses back
into `qm()` to wait for the real response. Whether `cv` itself calls this
is unclear from the source — the render uses Reaper's blocking
`Main_OnCommandEx`, so `cv` cannot call back out during the render. The
client's 25 % timeout buffer (MA3:22145) is the practical guardrail.

### Persisting to MA3

Once the bytes arrive, MA3:22162-22193 writes them to disk under
`ShowData().MediaPools.Sounds`'s path, calls
`Obj.Create(yp, ys)` if no existing Sound entry has the right name,
applies the appearance via `A.aaa980e8`, and issues the engine command
`Drive 1 ; Import Sound <slot> /File "<name>.mp3" /Path "<dir>" /o /nc`
to land the asset.

## 9. The two-way binding — MTdata blobs and MATOOLSMARKERSGUID

The plugin's diff-and-update behaviour relies on two persistence layers:
the project-level `MATOOLSMARKERSGUID` (covered in §6) and the per-object
MTdata blobs stamped into MA3 Note properties.

### MTdata format

Encoder `A.a1c0fa3e` at MA3:13887-13897:

```lua
function A.a1c0fa3e(o2, ob, oc)
  local od = A.a71fa32a(o2)              -- recursively coerce userdata→handle string
  local cp = require("json")
  local oe = {adb67544 = ob, aa3d5d76 = od}
  local of = cp.encode(oe)
  if oc then
    of = A.af7f1945(of)                  -- Caesar +5 byte shift
    of = A.ac2276ce(of)                  -- base64 encode
  end
  return of
end
```

- `adb67544` — namespace (literal string supplied by caller, e.g.
  `rm.str_0c9c` for the plugin's main namespace).
- `aa3d5d76` — body (the actual record).
- The Caesar shift is +5 (`o6 = 5` at MA3:13852-13885; `af7f1945`
  does +5 with mod 256; `a2d7979e` does the inverse).
- The wrapped on-disk form is the literal Lua string
  `MTdata'<base64>'` (MA3:13991, MA3:14002).

Decoder `A.a87703a3` at MA3:13939-13963 inverts the chain. It recognises
two record formats: the modern one with `mt_namespace` + `mt_body`
plaintext keys, and a legacy form with `Label` + `data` keys (which
triggers an automatic field-name re-hash via `A.ab04b396`,
MA3:13912-13937).

### Read-then-update: `A.a21d4837`

`A.a21d4837(mF, ob, oh)` at MA3:13965-13987 walks `mF.Note` — the MA3
object's writable Note property — for substrings matching
`MTdata'<base64>'`, decodes each, and:

- If the record is the legacy form (`Label`/`data`), rewrites it in place
  on the MA3 object via `A.a34ca287`.
- Returns the decoded body (`oq`) for the first record whose namespace
  (`ot`) matches the requested namespace (`ob`).

This is how the plugin recovers identity when it re-encounters a
previously-stamped Sequence/Timecode/Marker.

### Write: `A.a34ca287`

`A.a34ca287(mF, o2, ob)` at MA3:13989-14004 produces a fresh
`MTdata'<base64>'` and surgically replaces any prior record with the same
namespace via `string.gsub`, then appends the new record on its own
newline. Critical: a Note property may carry multiple MTdata blobs in
different namespaces; only same-namespace records are replaced.

### The seven object-stamp call sites

In sync order, every MTdata write that occurs during a Sync from Reaper:

| Site         | MA3 object            | Body record                                                                                                    |
|--------------|-----------------------|----------------------------------------------------------------------------------------------------------------|
| MA3:17297    | `qF.tc_handle_a` (Timecode) | `rD.tbl_0c3f` (the entire metadata table, including `song_uuid`, `mt_type = "Timecode"`, `format_version`, `plugin_label`) |
| MA3:17558    | `qF.a9e9e327` (master Sequence) | `{ ac02a53d = "PlaceholderSeq", a04556b5 = song_uuid, a6ed8791 = project_uuid }` |
| MA3:17594    | per-marker-color Sequence | `{ ac02a53d = "MarkerSequence", a04556b5 = song_uuid, a6ed8791 = project_uuid, a12b4a07 = master_idx, a01c4c55 = tc_slot }` |
| MA3:17633    | per-MIDI-track Sequence | `{ ac02a53d = "MidiSequence", a04556b5 = song_uuid, a6ed8791 = project_uuid, a2559603 = midi_uuid, a6d2608d = stem_index, a01c4c55 = tc_slot, aedcc9ac = enabled, a190b284 = flag_offset, a134d150, ae0ea4fe, a2309d93 = (flag fields) }` |
| MA3:17702    | tempo Sequence        | `{ ac02a53d = "TempoSeq", a04556b5 = song_uuid, a6ed8791 = project_uuid }`                                     |
| MA3:18583    | (timecode-track stamp; Unclear from code which object) | a tagged dict with `ac02a53d` + identity fields |
| MA3:19386    | MIDI-Track Marker     | `{ ac02a53d = "MIDITrack", a04556b5 = song_uuid, a6ed8791 = project_uuid, ad1509b7 = track_guid, a01c4c55 = tc_slot, a33a7def = flag }` |

`a04556b5` here is the MA3-side mirror of the Reaper `info` field
`a04556b5` — the project-level `MATOOLSMARKERSGUID` — and `a6ed8791`
appears to be the project_uuid (a separate per-project identifier
distinct from the GUID). `ac02a53d` is the type discriminator
(`PlaceholderSeq`, `MarkerSequence`, `MidiSequence`, `TempoSeq`,
`Timecode`, `MIDITrack`). `a01c4c55` is the timecode-slot pool index.

### Round-trip through `saveMeta`

After the MA3 side has reconciled its world view, `CK` calls
`pX.a255c04a(rD)` at MA3:29716 to push the updated metadata back to
Reaper. The body `rD` here is the same metadata table the plugin has
been mutating throughout `CH`. Reaper persists it to
`<projdir>/MArkers/<song_uuid>-<datapool_int>.dat` (`bp` at Reaper:965-
1011). The next sync's `info` response carries this metadata back via
`dp = be(bT.a20cbdb3)` (Reaper:1505) inside `qF.aa942c2a`, allowing the
next `CH` to re-discover all prior identities by reading both the MTdata
on each MA3 object and the canonical record from the `.dat` file.

## 10. Update / diff logic on re-sync

The diff happens implicitly across multiple phases of `CH`:

1. **`rm.a47fed4f`** (MA3:29539) — gating sanity check. Returns a string
   (and aborts) if `ry` (markers) or `rz` (midi) are empty.

2. **`rm.a1d6dffa`** (MA3:29543) — the master reconciliation dialog
   builder. Compares the inbound markers/regions/midi against the
   per-MA3-DataPool metadata `qF.aa942c2a` and presents the operator with
   `MessageBox` confirmations. The "no longer exist in Reaper" prompt at
   MA3:17878 (`hC["text"] = "The following cue(s) no longer exist in
   Reaper, do you want to delete them?"`) is rendered from a
   `ScrollContainer` of `Button`s, one per orphan cue, with `Select All`
   / `Unselect All` toggles (MA3:17923-17977). The dialog is owned by
   `xr.a95b072e` at MA3:21536-21605 — note the deeper "Cue(s) thru in
   Seq" message at MA3:21557 and the MTdata write of
   `{ad435872 = true}` at MA3:21583 to suppress this dialog on a
   per-Sequence basis (`DeleteWarning` namespace) when the user picks
   "Don't show again".

3. **`rm.ade198ec` → `rm.a228fde5` → `rm.a6c560c5`** (MA3:29547-29549) —
   the sequence-slot reservation pass. Computes `sW`, the materialised
   stem-sequence allocation, including which pool indices to reuse from
   the prior sync.

4. **`Ac.adbd069f`** (MA3:29550) — the master decision wrapper. Returns
   `t4`, where `t4.num_52fe` is the user's choice from the preceding
   confirmation dialog: `0` = cancel, `2` = abort and reopen Setup, any
   other value = proceed.

5. **`rm.a9d7237f`** (MA3:29573) — the per-Sequence write pass. For each
   marker color:
   - If the existing sequence at the recorded pool slot
     (`rD.tbl_0c3f.ac5fccac` for the master, `e4.a283b5c6` for stems)
     matches, reuse it (`DataPool().Sequences[...]`).
   - Otherwise call `rm.a4b0cf0f` to either create or rename. Stamp the
     fresh MTdata blob (MA3:17558, MA3:17594).

6. **`rm.a2d2279b`** (MA3:29579) — Tempo Sequence diff. Existing Tempo
   Sequence is fetched via `qF.tc_handle_c` (a previous sync's pointer
   restored from the MTdata blob); CmdEvents are appended past the
   existing count (`tj = 3` start + per-tempo increment, MA3:17708-
   17735), so unchanged tempos do not regenerate.

7. **`rm.acf51bce`**, **`rm.aea97f7c`** (MA3:29587, MA3:29591) —
   per-Cue diff. Walks `ry.tbl_9171` (markers from `bS`), looks up each
   by `e4.master_idx == mh.master_idx` against the prior sequences in
   `sW.tbl_13c3` (the pool reservation map), and binds `e4.aad45010`.
   Cues whose Sequence parent has changed clear `e4.a1925f31` to nil
   (MA3:17760-17765 in `rm.ad4a5f1f`), forcing recreation later.

8. **`rm.a317b304`**, **`rm.a246e0ab`** (MA3:29607, MA3:29613) —
   Timecode track + trackgroup reconciliation. Each MIDI track
   (`tbl_b89c`) carries a stable `stem_index` derived from the MIDI
   note number, so re-syncs preserve track→sequence mappings.

9. **`xr.a95b072e`** (called transitively via `rm.a4eXXXXX` paths) —
   the explicit "delete obsolete cues" prompt described above. This is
   the only user-facing prompt where the diff result becomes
   destructive. `Cue Only` checkbox (MA3:21570) lets the user keep the
   MA3 sequence but delete only the dangling cue inside it.

The reconciliation is not 100 % stateless: the `aedcc9ac = true` flag
defaults on each marker/region map (Reaper:1148, Reaper:1368) and the
`enabled` boolean in `sW.tbl_13c3` rows mean that the user's prior
"disable this stem" setting is preserved across syncs because the
`enabled` value is read from the MTdata blob on the existing object
(MA3:17640 `aedcc9ac = e4.enabled`).

## 11. Post-sync state

Once `CH` returns `nil, rD, true` (success — MA3:29639), `CK` performs
two final actions:

1. **`pX.a255c04a(rD)`** at MA3:29716 — the `saveMeta` push back to
   Reaper. On failure the operator sees a MessageBox at MA3:29718. On
   success the function falls through.
2. **Success toast.** `A.a880c84e(...)` at MA3:29721 produces
   `"Reaper Project '<name>' synced successfully!"` as a non-blocking
   notification.

Persistent residue after a successful sync:

- All created Timecode, Sequence, Page, Macro, Sound, and Appearance
  objects carry MTdata blobs in their Note properties (§9).
- The plugin holds no in-memory state across calls — all next-sync
  state is on-object.
- Reaper has a fresh `<projdir>/MArkers/<guid>-<dpid>.dat` file (and
  optionally a backup under `<projdir>/MArkers/backups/`).
- The Reaper project's `<EXTSTATE>` block contains
  `MATOOLSMARKERSGUID {<guid>}` (only if absent before, or re-written by
  `bp`).
- The Reaper ext-state namespace `MArkersLookup` maps that GUID back to
  the project's filename, supporting Reaper's own project-renamed
  prompt at Reaper:2287-2305.
- The MA3 UserVar `MArkersLIVE` is deleted by the unconditional `CG()`
  at MA3:29952 — this is the plugin's "I'm done" signal.

## 12. Error paths and recovery

The MA3 plugin's error contract is uniform: every internal function
returns `nil, dl` on error, where `dl` is a string. The dispatcher `CO`
calls `CG(dl)` (MA3:29076) which surfaces the string via
`A.a77a80af(dl)` (a MessageBox wrapper).

Distinguishable failure modes during Sync from Reaper:

| Failure                                  | Where returned                                         | Surface                                               |
|------------------------------------------|--------------------------------------------------------|-------------------------------------------------------|
| Connect refused / no responder           | MA3:15611                                              | "Could not connect to Reaper"                         |
| TCP read closed                          | MA3:15446 / MA3:15513                                  | "Reaper connection closed" / re-discovery prompt      |
| Wrong MArkersServer version              | MA3:15636                                              | "The MArkers Server Reaper plugin must be V%s, your version is V%s" |
| Discovery returned empty                 | MA3:15382                                              | Long help message ending "...try to Sync From Reaper" |
| Operator cancelled discovery prompt      | MA3:15399                                              | "User cancelled"                                      |
| MessagePack decode failure               | MA3:15582                                              | "Invalid  data in response" (sic, double space)       |
| Markers/MIDI both empty                  | `rm.a47fed4f` returns string                           | Operator-friendly per-string message                  |
| Operator cancelled diff dialog           | `t4.num_52fe == 0`                                     | Silent return from `CH`                               |
| Sound pool > 100 MB after import         | MA3:22159                                              | "Sound file can't be imported as this will cause..."  |
| Reaper render produced no MP3            | Reaper:1318 → MA3:22156                                | "Waveform failed to generate in Reaper"               |
| `saveMeta` write failed                  | Reaper:1007 → MA3:29718                                | Reaper-side "Unable to save metadata to Reaper Project" |
| Persistent metadata write (MA3 disk)     | MA3:17259                                              | "Unable to save metadata"                             |
| RPP file open failed                     | MA3:17108                                              | "Error opening Reaper file"                           |
| Reaper version < 6                        | MA3:17126                                              | "This plugin only works with Reaper Version 6 or greater..." |

Recovery behaviours:

- **Connect failure → re-discovery.** `qe()` recurses into
  `pX.a8b0dc9b()` at MA3:15426-15432. If `qh` (recursion guard) is
  already true the recursion is skipped to prevent infinite loops.
- **Mid-receive close → operator prompt.** MA3:15515-15539 puts up the
  "Connection to remote reaper failed... Choose a new remote reaper?"
  dialog and either re-discovers (`hP.result == 1`) or aborts with
  `"Could not connect to Reaper"`.
- **Wait recursion.** §4 — `acf4591d == "wait"` re-enters `qm()`
  without closing the socket. There is no explicit timeout cap on the
  number of consecutive `wait` packets.
- **Spool to disk for big payloads.** `qe()` switches to a tempfile
  when `jT > qv` (1 000 000 bytes, MA3:15495), preventing OOM on
  waveform responses or very dense marker dumps.
- **Per-stem MTdata namespace fallback.** The MTdata reader
  `A.a87703a3` will accept either modern (`mt_namespace`/`mt_body`) or
  legacy (`Label`/`data`) records (MA3:13953-13954). When the legacy
  form is found it is rewritten in place with current hashes via
  `A.ab04b396` (MA3:13975-13980) so that subsequent reads are direct.

## 13. Reaper-side architecture summary

`MArkersServer.lua` is loaded indirectly. The user runs
`MArkersServer_ShowPanel` as a ReaScript via Reaper's Actions UI (or via
the toolbar after Reaper imports the action). The decompiled ShowPanel
is reproduced at `MArkersServer_ShowPanel_clean.lua:1-31`:

```lua
local function j()
  reaper.SetExtState("MArkers", "gui_open_state", "true", true)
  local k = reaper.GetResourcePath() .. "/Scripts/MArkers/MArkersServer.lua"
  if reaper.file_exists(k) then
    local l = loadfile(k)
    reaper.defer(l)
  end
end
return j()
```

So the launcher (a) writes `MArkers/gui_open_state=true` (the persistent
flag the main server polls to render its ImGui dock window), (b)
`loadfile`s the main server, (c) `reaper.defer`s its returned chunk so
it integrates with Reaper's main thread loop.

The main server's structure:

- **Top-level setup.** Reaper:759-771 extends `package.path` and
  `package.cpath` to find the bundled LuaSocket (`v7/requirements/?.lua`
  and `?.so`/`?.dll`/`?.so.linux`), then `require`s socket, msgpack
  (`o`), and other modules. On failure the entire script aborts with
  `"Could not start MArkersServer, please contact MATools support"`.
- **TCP listener.** `eC()` at Reaper:2021-2141 binds to TCP `0.0.0.0:29882`
  (the `aB` variable; `aM` rolls forward by up to 100 from `29882` if
  the port is busy — the discovery probe response carries the chosen
  port back, so multiple Reapers on one host can coexist). A non-blocking
  accept-loop runs on every `eQ()` defer tick: each accepted socket is
  appended to `eE`, drained for `MC<len><payload>` frames, decoded,
  enriched with continuation hooks (`a01172df`, `af172a50`, `a45d4094`,
  `ac007bd8`, `a2f2f405`), and dispatched via `eB(eU)`. Responses are
  framed `MS<len><payload>` and sent back on the same socket via `eI`
  at Reaper:2056. Per-tick the entire pump runs once and re-defers
  itself: `reaper.defer(eQ)` (Reaper:2137).
- **UDP discovery listener.** `f2()` at Reaper:2159-2179 binds UDP
  `0.0.0.0:29881`. On every receive that decodes to
  `{ a38325d7 = "ReaperPoll" }` it sends back the responder dict using
  the `eZ` IP-recovery trick (Reaper:2151-2157).
- **Auto-sync poller.** `fs()` at Reaper:2308-2384 is the heartbeat
  defer loop. Every 0.2 s real time it:
  1. If `MArkers/AutoSync == "true"`, runs `fe()` (Reaper:2204-2266)
     which compares the currently-loaded RPP's mtime + SERVERNAME
     against the last seen pair, and if changed, calls
     `Main_openProject` to reload — preserving cursor + transport state.
     This is the "another user saved this project, reload my copy"
     feature.
  2. Calls `fo()` (Reaper:2268-2306) which checks
     `MATOOLSMARKERSGUID`'s round-trip: if the GUID exists but the
     project name in `MArkersLookup` doesn't match the current name,
     prompts the user "Project name has changed... keep existing
     MArkers sync data?" with Yes/No.
  3. Polls `MArkers/artnet_tc_enabled` and starts/stops the ArtNet
     timecode UDP transmitter `e8()` (Reaper:1775-1841) accordingly.
  4. Re-defers itself via `reaper.defer(fs)` (Reaper:2383).
- **GUI thread.** `fB(...)` at Reaper:2386-... + ImGui rendering
  driven by ext-state semaphores `markers_server_gui_instance`,
  `markers_server_gui_timestamp`, `markers_server_gui_close_request`
  to coordinate single-instance behaviour across sessions.
- **Lifetime.** The script lives until Reaper exits. There is no
  explicit teardown except the close handlers registered via
  `reaper.atexit(...)` (Reaper:1787 closes the ArtNet socket).

The `MArkers` ext-state namespace is the lingua franca with the
ShowPanel launcher and with external scripts. Keys observed in this
Sync flow:

- `gui_open_state` — written `"true"` by ShowPanel, consumed by the
  main server's ImGui rendering loop.
- `ServerName` — friendly name, persisted at Reaper:807, surfaced in
  discovery probes.
- `AutoSync` — `"true"`/`"false"`, polled by `fs`.
- `artnet_tc_enabled`, `artnet_mode`, `artnet_iface`,
  `artnet_unicast_ip`, `artnet_tc_always_send`, `artnet_tc_stream_id`,
  `artnet_iface_broadcast` — ArtNet timecode config.
- `MATOOLSMARKERSGUID` (project-level via `SetProjExtState`) and
  `MArkersLookup/<guid> = <projname>` (project-level lookup table).
- `ReaperTools_HideBase`, `ReaperTools_MarkerVisibilityCore.HIDDEN_<color>`
  — third-party markers-visibility helper that the server interoperates
  with at Reaper:1031-1050.

## 14. Action verb reference

Every verb the MA3 plugin can send. MA3 caller is the function that
constructs the request; Reaper handler is the dispatcher branch in `eB`
(Reaper:1953-2019). All requests have `a38325d7 = "<verb>"`. All
responses have `acf4591d = "done"` unless a richer payload is shown.

| Verb                  | MA3 caller                  | Reaper handler  | Request fields                                       | Response fields                                                                                  | Description                                                                 |
|-----------------------|-----------------------------|-----------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| `info`                | `pX.a6ab9715` (MA3:15627)   | `di` (R:1495)   | `a20cbdb3` = DataPool int                            | `a3bdc261, a06af6c3, aa5f01de, a04556b5, a27f7dd7, a9c920d0, a5f75b55, afd0469a, aa942c2a, a3e4ce38, a3075197` | Project meta + version handshake. Required before every cue-aware command. |
| `markers`             | `yg.a4d5c370` (MA3:22089)   | `bS` (R:1052)   | `a20cbdb3`                                           | `a91714e3` (markers), `a39401d9` (regions), `a13c343f` (groups), `a20da4dc` (lanes), `a931305d`, `a91437f3` | Project markers, regions, ruler lanes.                                       |
| `tempo`               | `yg.a55a1131` (MA3:22101)   | `cn` (R:1161)   | `a20cbdb3`                                           | array of `{a43ac778, a7890f1e, a1ac97d8, a5320370}`                                              | Tempo + time-sig markers.                                                    |
| `midi`                | `xr.a1f734bc` (MA3:21466)   | `cE` (R:1341)   | `a20cbdb3`                                           | per-track-GUID dict of `{ab89ceef (notes), a01d3537 (events), a3bdc261, a12b4a07, a09f63fb, ad40375c}` | MIDI items keyed by track GUID with note + event lists.                      |
| `waveform`            | `yg.a5df0dc7` (MA3:22136)   | `cv` (R:1290)   | `ac420da5` (timeout-ish), `ac524591=true` (raw)      | `acf4591d="done"`, `a4a6a654` (sound name), `ad3af9e6` (filename), `ad3b2478` (mp3 bytes), `a057ff63` (size) | Render full project to MP3 and stream bytes. Blocking on the Reaper side.    |
| `saveMeta`            | `pX.a255c04a` (MA3:15615)   | `bp` (R:965)    | `aa942c2a` (full metadata blob), `a20cbdb3`          | `acf4591d="done"`                                                                                | Persist per-DataPool metadata to `<projdir>/MArkers/<guid>-<dp>.dat`.        |
| `openProject`         | `rm.*` (open helpers)        | `dt` (R:1532)   | `aefac44a` (rpp path), `ad0e1f41` (skip-save flag)   | `acf4591d="done"`                                                                                | `Main_openProject("noprompt:<path>")`.                                       |
| `isProjectDirty`      | dirty checks                 | `du` (R:1543)   | (none)                                               | `acf4591d="clean"|"dirty"`, `a5142dd0` (project name)                                           | `IsProjectDirty(currentProj)`.                                               |
| `saveProject`         | save before send-offset      | `dw` (R:1562)   | (none)                                               | `acf4591d="done"`                                                                                | `Main_SaveProject(currentProj)`.                                             |
| `play`                | `rm.a11b2fc9`                | `el` (R:1859)   | (none)                                               | `acf4591d="done"`                                                                                | `CSurf_OnPlay()`.                                                            |
| `pause`               | `rm.a54623ba`                | `em` (R:1866)   | (none)                                               | `acf4591d="done"`                                                                                | `CSurf_OnPause()`.                                                           |
| `stop`                | `rm.adbfc5c9`                | `en` (R:1873)   | (none)                                               | `acf4591d="done"`                                                                                | `CSurf_OnStop()` + `GetSetRepeat(0)`.                                        |
| `record`              | `rm.a4f1d7be`                | `eo` (R:1881)   | (none)                                               | `acf4591d="done"`                                                                                | `CSurf_OnRecord()`.                                                          |
| `seek`                | `rm.acb304b9` etc.           | `ep` (R:1888)   | `a67a3ae2` (seconds)                                 | `acf4591d="done"`                                                                                | `SetEditCurPos2(0, secs, true, true)`.                                       |
| `skip`                | `rm.a68ec000`                | `eq` (R:1895)   | `a3ebc518` (seconds), `a6968c76` (direction ±1)      | `acf4591d="done"`                                                                                | Cursor + direction × seconds, clamped to project length.                     |
| `setRepeat`           | (transport)                  | `ex` (R:1917)   | `ad2ce7f1` (0/1)                                     | `acf4591d="done"`                                                                                | `GetSetRepeat`.                                                              |
| `setLoop`             | `rm.a547cb02`                | `ey` (R:1924)   | `ac40ed7a` (start), `a7f91941` (end)                 | `acf4591d="done"`                                                                                | `GetSet_LoopTimeRange2(0,true,true,start,end,false)`.                        |
| `setClick`            | `rm.a3a9538c`/`afa22900`     | `eA` (R:1942)   | `ad2ce7f1` (0/1)                                     | `acf4591d="done"`                                                                                | `Main_OnCommand(41745|41746, 0)` — Reaper metronome on/off actions.          |
| `saveTimecodeOffset`  | `rm.ae771990`                | `dx` (R:1569)   | `adeda4ce` (seconds)                                 | `acf4591d="done"`                                                                                | Rewrites `PROJOFFS` in the .rpp on disk + Timecode Generator items, reopens. |
| `SetAutoSync`         | `rm.ad73a87a`                | `ez` (R:1931)   | `ad2ce7f1` (0/1)                                     | `acf4591d="done"`                                                                                | Toggles `MArkers/AutoSync` ext-state.                                        |
| `startArtnetTimecode` | (in transport bindings)      | inline (R:1995) | (none)                                               | `acf4591d="done"`                                                                                | Sets `MArkers/artnet_tc_enabled=true`.                                       |
| `stopArtnetTimecode`  | (in transport bindings)      | inline (R:2000) | (none)                                               | `acf4591d="done"`                                                                                | Sets `MArkers/artnet_tc_enabled=false`.                                      |
| `StartOBS`            | `CL` (MA3:29725)             | `ej` (R:1843)   | (none)                                               | `acf4591d="done"`                                                                                | `reaper.defer(loadfile("/Scripts/obs_start.lua"))`.                          |
| `StopOBS`             | `CN` (MA3:29769)             | `ek` (R:1851)   | (none)                                               | `acf4591d="done"`                                                                                | `reaper.defer(loadfile("/Scripts/obs_stop.lua"))`.                           |
| `ReaperPoll`          | `q1` (MA3:15324)             | `f2` (R:2159)   | (UDP, no extra fields)                               | UDP: responder dict with `a74faa94` (ip), `aed31a9c` (port), `abf27542` (name)                   | Discovery probe — UDP only, not handled in `eB`.                             |

## 15. Field hash glossary

Hashes recovered or inferred during this trace. Where the same hash
appears in both files, both citations are given. "Inferred" means the
plaintext is plausible from the value's role; "recovered" means the
plaintext appears verbatim somewhere in the source.

### Top-level protocol

| Hash         | Plaintext (recovered/inferred) | Citations                                           |
|--------------|--------------------------------|-----------------------------------------------------|
| `a38325d7`   | `action` (recovered, REPORT.md) | MA3:15338, R:1954                                   |
| `acf4591d`   | `status` (recovered)            | R:2010, MA3:15571                                   |
| `a20cbdb3`   | `dataPool` (inferred — int handle of MA3 DataPool) | MA3:15630, R:1505                                   |
| `afd0469a`   | `version` (inferred — server build version) | R:1514, MA3:15635                                   |
| `ac420da5`   | `timeout` (inferred — per-call seconds) | MA3:15420, MA3:22145, R:2111                        |
| `ac524591`   | `raw` (inferred — opt out of cjson decode of body) | MA3:15605, MA3:22146                                |
| `abd9ebec`   | `eager_ack` (inferred — server returns `done` immediately, runs handler async) | R:2114                                              |

### Project metadata (`info` response)

| Hash         | Inferred meaning                                          | Citations         |
|--------------|-----------------------------------------------------------|-------------------|
| `a3bdc261`   | project name (no extension) — also used for marker names | R:1507, MA3:15639 |
| `a06af6c3`   | absolute project file path                                | R:1508, MA3:17088 |
| `aa5f01de`   | project filename (with `.rpp`)                            | R:1509            |
| `a04556b5`   | `MATOOLSMARKERSGUID` — project-level identity            | R:1510, MA3:17090 |
| `a27f7dd7`   | project time offset (seconds, fractional)                 | R:1511, MA3:17199 |
| `a9c920d0`   | frame rate (fps as float)                                 | R:1512, MA3:17203 |
| `a5f75b55`   | drop-frame flag (boolean)                                 | R:1513, MA3:17204 |
| `aa942c2a`   | per-DataPool metadata (the meta blob `bp` persists)       | R:1515, MA3:15618 |
| `a3e4ce38`   | server-internal token (constant `at`)                     | R:1516            |
| `a3075197`   | project length (seconds)                                  | R:1517            |
| `a1f2d3df`   | derived packed offset×fps (computed client-side)          | MA3:15638         |
| `ae6dc493`   | project initials (computed client-side)                   | MA3:15639         |
| `adeda4ce`   | timecode offset (request body for `saveTimecodeOffset`)   | R:1992            |

### Markers / regions (`bS` response)

| Hash         | Inferred meaning                                          | Citations              |
|--------------|-----------------------------------------------------------|------------------------|
| `a91714e3`   | markers array (point-in-time)                             | R:1056, MA3 read sites |
| `a39401d9`   | regions array (start+end)                                 | R:1057                 |
| `a13c343f`   | master groups array                                       | R:1058                 |
| `a20da4dc`   | ruler lanes array                                         | R:1059                 |
| `a931305d`   | master color                                              | R:1060                 |
| `a91437f3`   | master lane index                                         | R:1061                 |
| `adbfa544`   | marker raw name (pre-tag-strip)                           | R:1126, MA3:17148      |
| `a5320370`   | startpos (seconds)                                        | R:1127                 |
| `a72235e2`   | endpos (seconds, regions only)                            | R:1154                 |
| `a12b4a07`   | effective color                                           | R:1128                 |
| `a7044d68`   | displayed color                                           | R:1129                 |
| `a90ff523`   | I_NUMBER (user-visible id)                                | R:1130                 |
| `a09f63fb`   | I_INDEX (enumeration index) / track number / IDX field    | R:1131, R:1081, R:1354 |
| `ad40375c`   | GUID (marker / track / item)                              | R:1132                 |
| `a156ed81`   | BPM at this position                                      | R:1133                 |
| `a4799f71`   | lane number                                               | R:1134                 |
| `aedcc9ac`   | enabled flag                                              | R:1148, R:1368         |
| `ab834454`   | RULER_LANE_DEFAULT raw value                              | R:1087                 |
| `a3150ea5`   | RULER_LANE_TIMEBASE                                       | R:1088                 |
| `a25932d6`   | hidden flag                                               | R:1084                 |
| `adc035d4`   | locked flag                                               | R:1085                 |
| `a3c40563`   | visible flag                                              | R:1086                 |

### Tempo (`cn` response)

| Hash         | Inferred meaning                                          | Citations |
|--------------|-----------------------------------------------------------|-----------|
| `a43ac778`   | bpm                                                       | R:1168    |
| `a7890f1e`   | time-sig numerator                                        | R:1169    |
| `a1ac97d8`   | time-sig denominator                                      | R:1170    |

### MIDI (`cE` response)

| Hash         | Inferred meaning                                          | Citations |
|--------------|-----------------------------------------------------------|-----------|
| `ab89ceef`   | per-track named-note table                                | R:1350    |
| `a01d3537`   | per-track event array                                     | R:1351    |
| `a33a7def`   | enabled flag (per track)                                  | R:1355    |
| `af09dc19`   | (Page binding pointer, set MA3-side)                      | R:1356    |
| `a6d2608d`   | midi note number                                          | R:1364    |
| `abbbba71`   | velocity-set array                                        | R:1366    |
| `a190b284`   | offset flag                                               | R:1369    |
| `a77a41bb`   | velocity                                                  | R:1421    |
| `ad4987af`   | take GUID                                                 | R:1422    |

### Waveform (`cv` response)

| Hash         | Inferred meaning                                          | Citations |
|--------------|-----------------------------------------------------------|-----------|
| `a4a6a654`   | sound asset name (project + `_Waveform`)                  | R:1333    |
| `ad3af9e6`   | filename including `.mp3`                                 | R:1334    |
| `ad3b2478`   | binary mp3 bytes                                          | R:1335    |
| `a057ff63`   | size in bytes                                             | R:1336    |
| `a786d3d7`   | format selector size                                      | R:1200    |
| `ac8a7474`   | base64-encoded MP3 format struct                          | R:1201    |
| `a87591ee`   | (MA3-side) Sound pool object pointer                      | MA3:22194 |

### Discovery (`ReaperPoll` UDP)

| Hash         | Inferred meaning                                          | Citations |
|--------------|-----------------------------------------------------------|-----------|
| `a74faa94`   | reaper IP                                                 | R:2333, MA3:15405 |
| `aed31a9c`   | reaper TCP port                                           | MA3:15406 |
| `abf27542`   | friendly server name                                      | MA3:15407 |
| `a4151b75`   | always-send flag (artnet)                                 | R:2334    |
| `ac02463f`   | stream id (artnet)                                        | R:2335    |

### Transport request fields

| Hash         | Inferred meaning                                          | Citations |
|--------------|-----------------------------------------------------------|-----------|
| `a67a3ae2`   | seek seconds                                              | R:1889    |
| `a3ebc518`   | skip distance (seconds)                                   | R:1896    |
| `a6968c76`   | skip direction (±1)                                       | R:1897    |
| `ad2ce7f1`   | toggle / 0|1 flag (repeat, click, autosync)               | R:1918, R:1932, R:1943 |
| `ac40ed7a`   | loop start                                                | R:1925    |
| `a7f91941`   | loop end                                                  | R:1925    |
| `aefac44a`   | rpp path (openProject)                                    | R:1533    |
| `ad0e1f41`   | skip-save flag (openProject)                              | R:1537    |
| `a5142dd0`   | response project name (isProjectDirty)                    | R:1552    |

### MTdata record fields

| Hash         | Plaintext (recovered/inferred)                | Citations           |
|--------------|-----------------------------------------------|---------------------|
| `adb67544`   | `mt_namespace` (MTdata wire key)              | MA3:13890           |
| `aa3d5d76`   | `mt_body` (MTdata wire key)                   | MA3:13890           |
| `ac02a53d`   | `mt_type` (record-type discriminator)         | MA3:17559, MA3:17595 |
| `a04556b5`   | `song_uuid_or_GUID` — same hash as project GUID, reused as identity field | MA3:17560 |
| `a6ed8791`   | `project_uuid` (inferred)                     | MA3:17561           |
| `a01c4c55`   | `tc_slot` (timecode pool index, inferred)     | MA3:17600           |
| `a2559603`   | `midi_uuid` (inferred)                        | MA3:17637           |
| `ad1509b7`   | track GUID (inferred from `MIDITrack` record) | MA3:19390           |
| `a2309d93`   | `flag_a` mirror (inferred)                    | MA3:17644           |
| `a134d150`   | `index_b` mirror                              | MA3:17642           |
| `ae0ea4fe`   | `index_a` mirror                              | MA3:17643           |
| `ad435872`   | DeleteWarning suppression flag                | MA3:21583           |
| `a9e9e327`   | (MA3-side) master sequence handle on `qF`     | MA3:17547           |
| `tc_handle_a`| (recovered) Timecode object handle            | MA3:17297           |
| `tc_handle_c`| (recovered) Tempo Sequence handle             | MA3:17683           |

### Continuation hooks (server-side request enrichment)

| Hash         | Inferred meaning                              | Citations |
|--------------|-----------------------------------------------|-----------|
| `a01172df`   | `wait()` — async ack-with-wait emitter        | R:2106    |
| `af172a50`   | `respond()` — direct response emitter         | R:2107    |
| `a45d4094`   | `close()` — connection closer                 | R:2108    |
| `ac007bd8`   | socket handle reference                       | R:2109    |
| `a2f2f405`   | connection index in `eE`                      | R:2110    |

Significant gaps marked "Unclear from code":

- **§6** — the writer/reader namespace asymmetry (`MArkers` write vs.
  `MARKERS` read) on `MATOOLSMARKERSGUID`. Likely a typo working
  because Reaper's ext-state lookup is case-insensitive in some paths,
  but not directly verifiable from the source.
- **§8** — whether `cv` itself ever calls the `wait` hook
  (`eU.a01172df`) before the synchronous `Main_OnCommandEx(42230)`.
  Code flow says no; only the per-call `ac420da5` timeout protects
  the client from disconnect during render.
- **§9** — the MTdata stamp at MA3:18583 lands on a
  timecode-track-related object whose exact identity (Track? Subtrack?
  Group?) was not traced, only the body shape.
- **§13** — the precise `aB` port arithmetic in `aM(29882, 100)`. The
  base port + range-up-to-100 strategy is clear; the tie-breaking on
  multi-Reaper hosts is via `eZ` callback into the discovery
  responder, but the deterministic port-pick rule on the first server
  was not fully traced.
