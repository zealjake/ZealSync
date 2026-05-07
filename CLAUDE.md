# ZealSync

## Scope

ZealSync is **one product split across two devices**:

- An **MA3 plugin** (Lua) that runs on a grandMA3 lighting desk, in `ma3/`.
- A **REAPER C++ extension** that runs on the audio machine running Reaper, in `reaper/`.

The two halves talk over TCP+UDP on the local show network. The MA3 plugin queries the Reaper extension for project markers, MIDI notes, and tempo, and creates matching Sequences/Cues on the desk. The Reaper extension also handles transport (play/stop/seek) for the desk to drive.

Both halves are designed and edited together — that's why they live in one repo.

### What ZealSync does

- Pulls Reaper project markers → MA3 Sequences (one Sequence per marker colour, Cues per marker).
- Pulls named MIDI notes from Reaper tracks → MA3 Sequences (one per `(track-GUID, note)` pair, only where the note has a name in Reaper's named-note table).
- Pulls tempo / time signature changes.
- Persists cross-sync identity in MA3 by stuffing MTdata into the Note property of created objects, so re-sync doesn't duplicate.
- Presents a sync preview dialog: source on one side, target/preview on the other, per-row diff with opt-out, colour-key for new/saved/existing, Cancel/Apply.
- Drives Reaper transport (play/stop/seek) from the desk.
- Discovers the Reaper machine over UDP.

### What ZealSync explicitly does NOT do

Inherited prior art (the MArkers plugin family) shipped a lot of features we are deliberately dropping. Don't add them back without a fresh decision:

- No hash-obfuscated field names. Plain JSON, namespace `ZealSync`.
- No waveform render.
- No OBS integration.
- No Artnet timecode.
- No auto-sync. Sync is user-initiated via the dialog.
- No RPP-on-disk import. We talk to a running Reaper, not project files.
- No time-offset rewriting of imported objects.
- No verbatim copy of MArkers' UI.

## Repo structure

- `ma3/` — Lua. The MA3-side plugin and any shared Lua modules.
  - `plugins/` — the MA3 plugin entry points.
  - `shared/` — shared Lua modules `require()`-ed by plugins.
  - `docs/` — MA3-side notes specific to this plugin.
- `reaper/` — C++. The REAPER extension.
  - `src/transport/` — play/stop/seek handlers (ported from ZealServer in M7).
  - `src/sync/` — markers / midi / tempo / saveMeta handlers.
  - `src/net/` — TCP+UDP framing, dispatcher, main-thread queue.
  - `src/reaper_api/` — thin wrappers over the REAPER C API.
  - `include/`, `third_party/` — headers and vendored deps.
  - `docs/` — Reaper-side notes specific to the extension.
- `docs/` — cross-cutting docs.
  - `WIRE_PROTOCOL.md` — source of truth for how the two halves talk. **Drafted next session.**
  - `PLAN.md` — milestone tracker.
  - `plans/`, `shipped/` — active and archived plan docs (same convention as MA3_Tools).

## Wire protocol

The wire protocol is the contract between the two halves. It lives at `docs/WIRE_PROTOCOL.md` and is the single source of truth — when MA3 and Reaper disagree, the protocol doc wins.

Inherited from prior art (MArkers) and kept:

- TCP framing: 2-byte verb tag (`MC` for command, `MS` for response) + 4-byte length prefix + JSON body.
- A `wait` continuation: handlers can ack immediately and stream the real response when main-thread work completes. This exists specifically because the REAPER API is main-thread-only (see Reaper conventions below).
- Cross-sync identity: MTdata is stuffed into the Note property of created MA3 objects so re-sync can match against existing Sequences instead of duplicating them.

Explicitly dropped:

- The Caesar shift on MTdata. Plain JSON.
- Hash-obfuscated field names. Plain readable keys, namespace `ZealSync`.

## MA3 plugin conventions

The MA3-side plugin must follow the patterns proven in `MA3_Tools/`. Read those first. Specifically:

- **Dialog UI:** must follow `~/Documents/dev/MA3_Tools/GrandMA3_UI_Agent.md`. No deviations without an explicit reason logged in the relevant plan doc. That document is the structural source of truth for dialog construction.
- **Plugin handle capture:** standard MA3_Tools pattern. Capture varargs at chunk scope:
  ```lua
  local componentName = select(1, ...)
  local pluginName    = select(2, ...)
  local signalTable   = select(3, ...)
  local myHandle      = select(4, ...)
  ```
  Use the captured `myHandle` when setting `PluginComponent` on UI controls. Bare `myHandle` global only works under MA3 native import, not under PluginLoader. A control with `PluginComponent = nil` silently drops signals — no error, no log.
- **Entry point:** `local function main(...) ... end` and `return main` at end of chunk. Without `return main` MA3 reports "no reference to main function found in plugin".
- **Cross-sync identity:** MTdata is stored in the Note property of created Sequences. Namespace under `ZealSync` so it doesn't collide with anything else's Note usage.
- **JSON:** plain. No obfuscation, no Caesar shift, no hashed keys.
- **Reference:** consult `MA3_Tools/CLAUDE_MA3_LUA_Proven.md` first for MA3 Lua API surface, then the other `CLAUDE_*.md` files in MA3_Tools as needed.

### Sync preview dialog (M4)

The dialog uses MArkers' **information architecture**, built from scratch on `GrandMA3_UI_Agent.md` primitives. Take from MArkers:

- Two-pane layout: source list on one side, target/preview on the other.
- Per-row diff: each row shows what the item is, what'll happen to it, and an opt-out.
- Colour key: new / saved / existing.
- Explicit Cancel / Apply footer.

Do **not** copy from MArkers:

- The exact 9-column row layout.
- Unlabelled LineEdits.
- Disabled-but-shown columns.
- The specific pane widths.

Visual polish is deferred until the dialog is functional. Don't tune spacing, fonts, or BackColor tints before the diff/apply path works end-to-end.

## Reaper extension conventions

- **Shared modules:** `net/` and `reaper_api/` are shared between transport and sync. Don't duplicate framing, JSON, or REAPER API wrappers across handler trees.
- **Single dispatcher:** transport handlers and sync handlers register into one dispatcher keyed by verb. M7 merges the ZealServer transport dispatcher into ours.
- **Main-thread-only REAPER API:** the REAPER C API can only be called from the main thread. The network thread must marshal work back via a `main_thread_queue`. The wire protocol's `wait` continuation exists specifically so handlers can return an immediate ack while main-thread work completes.
- **No direct REAPER calls from net code.** All REAPER calls go through `reaper_api/`, which is invoked from main-thread context.

## Cross-references

- **`~/Documents/dev/MA3_Tools/`** — MA3 Lua API reference (`CLAUDE_*.md`), dialog skeleton (`GrandMA3_UI_Agent.md`), plugin patterns. Read-only from this repo's perspective; we follow its conventions, we don't edit it.
- **`~/Documents/dev/ZealServer/`** — existing C++ REAPER extension that handles transport on the show machine. M7 ports its handlers into `reaper/src/transport/`. Until then, ZealServer keeps running. **Do not edit ZealServer in ZealSync sessions.** It is retired only after ZealSync is shipping.

## Status

In development. M0 (this session): repo skeleton. See `docs/PLAN.md` for the milestone breakdown.
