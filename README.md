# ZealSync

One product, two devices: a grandMA3 lighting desk and the Reaper audio machine running alongside it.

## What it is

ZealSync keeps a Reaper session and an MA3 show in sync. The MA3 plugin pulls markers, named MIDI notes, and tempo from Reaper and creates matching Sequences on the desk. The Reaper extension also exposes transport (play/stop/seek) so the desk can drive playback.

## Who it's for

Internal tool for [Zeal](https://wearezeal.co) — a UK lighting and visual design company. It is built around our show workflow and is not a general-purpose product.

## How it installs

Two halves, two machines.

- **MA3 side** (`ma3/plugins/`) — Lua plugins imported into grandMA3 via the desk's plugin pool, or pushed during dev with the PluginLoader workflow from [MA3_Tools](../MA3_Tools). Install procedure: see [`ma3/docs/install.md`](ma3/docs/install.md).
- **Reaper side** (`reaper/`) — C++ extension built and dropped into Reaper's `UserPlugins/` directory on the audio machine.

Build instructions land alongside the C++ source once the build system is in place (next session).

## Wire protocol

The two halves talk over TCP+UDP on the local network. The protocol is documented in [`docs/WIRE_PROTOCOL.md`](docs/WIRE_PROTOCOL.md) — that doc is the source of truth when the implementations disagree.

## Status

**In development.** See [`docs/PLAN.md`](docs/PLAN.md) for milestones. ZealSync is not yet running on a show — until it is, [ZealServer](../ZealServer) continues to handle transport on the show machine. ZealServer is retired after M7.
