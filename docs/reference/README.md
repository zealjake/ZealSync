# docs/reference/ — MArkers prior art

These files are **reference material, not source.** They are the
deobfuscated source of MArkers (a prior-art commercial plugin that
solves the same problem ZealSync solves), a runtime UI probe of its
import dialog, and a technical walkthrough document. They are kept
in the repo because the wire protocol design draws on them. **Nothing
in this folder ships, and nothing in this folder is a target to clone.**

## Do not copy verbatim

We are deliberately taking a small, specific set of ideas from MArkers
and dropping the rest. The decisions below are recorded in
[/CLAUDE.md](../../CLAUDE.md) (scope) and [/docs/WIRE_PROTOCOL.md](../WIRE_PROTOCOL.md)
(protocol) — those documents win when they disagree with what's in
this folder.

**What we ARE taking:**

- Wire framing: `MC`/`MS` magic + length prefix + body + `wait`
  continuation.
- MTdata-in-Note-property identity trick — but **without** the Caesar
  shift.
- Marker-colour → Sequence object model (one Sequence per marker
  colour, Cues per marker).
- Named-MIDI-note → Sequence object model (one Sequence per
  `(track-GUID, note)` pair, only for notes named in Reaper's
  named-note table).

**What we are explicitly NOT taking:**

- Hash-obfuscated field names (`a91714e3`, `afd0469a`, `acf4591d`,
  etc.). We use plain camelCase ASCII keys.
- MessagePack body encoding. We use JSON.
- Waveform render.
- OBS integration.
- Artnet timecode streaming.
- Auto-sync mode. Sync is user-initiated.
- Time-offset rewriting inside the `.rpp` file.
- RPP-on-disk import path. We talk to a running Reaper, not project
  files.
- The MArkers import dialog verbatim. We inherit its **information
  architecture** (two-pane source/preview, per-row diff with opt-out,
  colour-key legend, Cancel/Apply footer), not its specific 9-column
  row layout, pane widths, or unlabelled controls.

If you find yourself reading these files and reaching for copy-paste,
stop. Re-read the scope section of [/CLAUDE.md](../../CLAUDE.md) and
the protocol decisions in [/docs/WIRE_PROTOCOL.md](../WIRE_PROTOCOL.md).
The spec wins.

## The files

**[SYNC_FLOW.md](SYNC_FLOW.md)** — full technical walkthrough of MArkers'
sync flow with line references into both Lua sources. **Best starting
point.** Read this before either Lua file to understand the protocol's
shape; use it as an index when you do dive into the Lua.

**[ma_tools_ui_probe_report.md](ma_tools_ui_probe_report.md)** —
read-only probe of MArkers' import dialog as it appears in MA3 at
runtime. Reference for the information-architecture inheritance
(two-pane layout, per-row diff, colour-key legend, Cancel/Apply
footer). **Not a layout spec to copy.**

**[MArkersServer_clean.lua](MArkersServer_clean.lua)** — the Reaper-side
server, deobfuscated but with hash-named fields preserved. Reference
for handler behaviour (`cE` for MIDI, `bS` for markers, `cn` for
tempo, `di` for info, etc.). Cross-reference against `SYNC_FLOW.md`
for the plain-English handler names. *(Note: ZealSync's Reaper side is
C++, not Lua — this file is informational only.)*

**[MArkersLIVE_deobfuscated.lua](MArkersLIVE_deobfuscated.lua)** — the
MA3-side client, deobfuscated. Reference for object-creation patterns
and the diff/reconcile logic. ~30k lines; **do not read end-to-end.**
Use `SYNC_FLOW.md` as an index and jump to specific line ranges.

## Snapshot, not mirror

These files are point-in-time captures. They will not be refreshed
unless explicitly needed. If MArkers ships a new version upstream,
this reference set does not automatically update — and probably should
not, since the value here is in the protocol design we already
extracted, not in tracking MArkers' future work.
