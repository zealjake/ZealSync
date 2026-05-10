# ZealSync — Milestone Plan

Tracking doc, not a spec. Each milestone has scope, exit criteria, and out-of-scope notes. Detail lives in per-milestone plan docs under `docs/plans/` as they're started.

---

## M0 — Repo skeleton + protocol draft

**Scope.** Stand up the repo and write the wire protocol contract before any code lands.

- Repo skeleton: directories, `CLAUDE.md`, `README.md`, this plan, `.gitignore`. (this session)
- `docs/WIRE_PROTOCOL.md`: framing, verbs (`info`, `markers`, `midi`, `tempo`, `saveMeta`, transport), `wait` continuation semantics, MTdata format, error shape. (next session)

**Exit.** Skeleton committed. Protocol doc complete enough that M1 can implement framing against it without further questions.

**Out of scope.** Any C++ build system, any Lua, any handler code. No CMake yet.

---

## M1 — End-to-end skeleton

**Status:** Shipped 2026-05-08. Merge commit 73c0ebc.

**Scope.** Prove the wire works.

- Reaper side: TCP listener, framing (`MC`/`MS` + length-prefix + JSON), dispatcher stub, single `info` verb that returns hardcoded JSON. No real REAPER API calls.
- MA3 side: minimal plugin that opens a TCP socket, sends `info`, prints the response. No dialog yet.
- Build system: `CMakeLists.txt` for the Reaper extension. Builds on macOS.

**Exit.** Round-trip: MA3 plugin sends `info`, Reaper extension responds, MA3 logs the result.

**Out of scope.** UDP discovery, real handlers, any UI, the main-thread queue (the `info` stub doesn't need it).

---

## M2 — Real info handler + UDP discovery

**Status:** Shipped 2026-05-09. Merge commit 65b65a5. Desk-verified.

**Scope.** Make `info` real and find the server automatically.

- `info` returns actual project name, sample rate, Reaper version — via `reaper_api/`.
- `main_thread_queue`: net thread marshals REAPER calls onto the main thread. `wait` continuation lands here.
- UDP broadcast/listen so the MA3 plugin can find the Reaper machine without a hardcoded IP.

**Exit.** MA3 plugin discovers a running Reaper extension on the LAN and gets real `info` back.

**Out of scope.** Markers, MIDI, tempo. Sync UI. Transport.

---

## M3 — `markers` verb (read-only)

**Status:** Shipped 2026-05-10. Merge commit 34a8857. Desk-verified.

**Scope.** Pull markers out of Reaper and round-trip them to MA3. No MA3 object creation yet — this proves the scrape and the data shape.

- `markers` handler: enumerates Reaper project markers, returns `[{ name, position, color, ... }]`.
- MA3 side logs the parsed list. No Sequences created.

**Exit.** MA3 plugin can request and parse a marker list from a real Reaper session.

**Out of scope.** UI, Sequence creation, MIDI, tempo, identity persistence.

---

## M4 — Sync preview dialog + Sequence creation

**The headline UX milestone.** First version a user can actually use.

**Scope.**

- Sync preview dialog on MA3, built from scratch on `GrandMA3_UI_Agent.md` skeleton, using MArkers' information architecture (per `docs/reference/README.md` and `CLAUDE.md`): two-pane layout, per-row diff with opt-out, colour-key legend (new / saved / existing), Cancel/Apply footer.
- Timecode pool object creation — one per project, anchored by the `timecode` ZealData record (§8.3.1 of the wire protocol).
- TrackGroup hierarchy inside the Timecode: `Tempo`, `Markers`, `MIDI`. `MIDI` is created empty in M4 and populated in M5.
- Tracks: one Track per unique marker colour under `Markers`; a single `Tempo` Track under `Tempo`.
- Sequence creation: one per-colour marker Sequence; the single Tempo Sequence. ZealData stamps per §8.3.2 (`markerSequence`) and §8.3.4 (`tempoSequence`).
- CmdEvent population: one event per Cue per Sequence, routed to the appropriate Track based on colour identity.
- Per-Sequence trigger token system: dropdown in the sync preview dialog with two options for marker Sequences (`Go`, `Goto`), default `Go`. When `Goto` is selected, a companion text field for `tokenTarget`. Tokens persist on the Sequence's ZealData record (§8.4.1). CmdEvent text generated per the token mapping in §8.4.1.
- Diff logic: read existing Sequences' ZealData blobs (§8.7 read contract) and `savedMeta` (§7.5) and classify each incoming marker as new / matches-saved / matches-existing-but-changed.
- Colour-name lookup table at `ma3/shared/colour_names.lua`: hardcoded palette for the eight common colours (Red, Green, Blue, Yellow, Cyan, Magenta, White, Black), `#RRGGBB` hex fallback for others. Used to label Tracks under `Markers`.
- `tempo` verb wired up server-side, sufficient to populate the Tempo Sequence's CmdEvents.
- `saveMeta` write at end of sync, including the new `timecodeHandle` field (§7.5.1).

**Exit.**

- A sync against a real Reaper project with markers produces: one Timecode object, three TrackGroups (`Tempo`, `Markers`, `MIDI`), per-colour Tracks under `Markers`, the `Tempo` Track and Sequence, all per-colour marker Sequences, all CmdEvents routed correctly, all ZealData stamps in place.
- Re-syncing the same project is idempotent — no duplicate objects, no orphaned objects, the `savedMeta` blob round-trips correctly across sync runs.
- Operator can opt out of individual changes from the preview dialog and the opt-outs are respected.

**Out of scope.**

- MIDI in M4 — that's M5. M4 creates the empty `MIDI` TrackGroup as infrastructure; M5 fills it.
- Visual polish on the preview dialog (deferred per `CLAUDE.md` function-first rule).
- MArkers' exact column layout.

---

## M5 — `midi` verb

**Scope.** Same preview/apply path as M4, extended to named MIDI notes.

- `midi` handler: enumerates named MIDI notes per track, returns `[{ trackGuid, note, name, ... }]`. Only notes with a name in Reaper's named-note table.
- Dialog gains a MIDI section (or tab — decide during implementation). Apply path creates one Sequence per `(trackGuid, note)` pair.
- MTdata identity covers both markers and MIDI.
- Per-Sequence trigger token dropdown extended to MIDI Sequences with seven options (`Go`, `Top`, `Goto`, `Off`, `Flash`, `Temp`, `Go/Release`), default `Go`. Same `tokenTarget` companion field for `Goto`. `Go/Release` writes two CmdEvents per hit (note-on and note-off). Other tokens write one CmdEvent per note-on.

**Exit.** Dialog shows markers and MIDI, both diffable, both apply-able. Re-opening shows correct saved-state for both.

**Out of scope.** Tempo. Transport.

---

## M6 — `tempo` + `saveMeta`, persistent re-sync

**Scope.** Round out the sync side.

- `tempo` handler: enumerates BPM and time-signature changes.
- `saveMeta` handler: persists arbitrary MA3-side metadata back into Reaper (track-level or project-level — decide during implementation) so the Reaper session itself remembers what's been synced.
- Verify the MTdata-in-Note round-trip across show save/reload, project save/reload.

**Exit.** Full sync side done. Markers + MIDI + tempo all diffable, applyable, and re-syncable across both ends being saved and reopened.

**Out of scope.** Transport.

---

## M7 — Transport port + ZealServer retirement

**Scope.** Bring transport into ZealSync and shut ZealServer down.

- Port transport handlers (play/stop/seek) from ZealServer into `reaper/src/transport/`.
- Merge into the single dispatcher — transport and sync share net, framing, main-thread queue.
- Cutover: switch the show MA3 plugin (or the existing transport client) from talking to ZealServer to talking to ZealSync.
- Retire ZealServer.

**Exit.** ZealSync handles both sync and transport on the show machine. ZealServer no longer runs.

**Out of scope.** New transport features. Anything beyond parity with what ZealServer does today.

---

## M3+ kickoff backlog

Items surfaced during M2 work that didn't ship in M2 and should be addressed
at the start of the next milestone they affect. Not features; dev-loop and
UX papercuts.

### Hot-reload flag for load_shared cache

**Surfaced:** M2 desk testing.
**Shipped:** M3, commit `a5e47a0` on `m3/markers-readonly`. `_G.ZEALSYNC_HOTRELOAD = true` short-circuits the `load_shared` cache. Documented in `ma3/docs/install.md`. Decision recorded as D12.
**Caveat recorded under D12:** covers `load_shared` cache only, plugin entry files require XML re-import regardless.

### Two-mode UDP discovery timing

**Surfaced:** M2 desk testing.
**Problem:** `discover()` blocks the MA3 main thread for the full 5s listen
window. Acceptable for the manual `ZealSync_Discover` plugin (operator
explicitly invoked discovery, expected wait). Unacceptable on the
connect-with-fallback path (operator invoked `ZealSync_Info`, expected
~50ms, got 5s frozen desk on stale-endpoint case).
**Suggested fix:** add `discover_first()` returning the first valid response
and exiting immediately. Manual plugin keeps the full window
(intent: "show me everything on the LAN"); fallback path uses
`discover_first()` (intent: "find any working endpoint, fast").
**When:** before any milestone where the freeze becomes load-bearing —
likely M4 when sync operations chain.

### docs/DECISIONS.md backfill discipline

**Surfaced:** M2 close-out.
**Problem:** M2 D-decisions were recorded across multiple chat threads and
backfilled to `docs/DECISIONS.md` at milestone close. Risk: a decision made
mid-milestone gets forgotten before backfill.
**Suggested fix:** add a `docs/DECISIONS.md` entry at the moment a decision
is settled, not at milestone close. The format is brief; the cost is small.
**When:** ongoing from M3 (in practice during M3 — D11/D12/D13/D14 were
each recorded as they settled).
**Adopted ongoing from M3.** D11/D12/D13/D14 were recorded mid-milestone as settled, not at close-out. Working practice.
