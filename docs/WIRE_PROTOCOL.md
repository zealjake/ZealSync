# ZealSync Wire Protocol

Version: 1.0 draft
Status: design — not yet implemented

This document is the contract between the two halves of ZealSync — the
MA3 plugin (Lua) and the Reaper extension (C++). When the protocol
changes, this document changes first, and both halves are updated to
match.

## §1 Overview

Two protocols run between the halves:

- **TCP, port 29882.** All verbs (info, markers, midi, tempo, saveMeta,
  transport). Connection per request, no persistent session. Length-
  framed JSON.
- **UDP, port 29881.** Discovery only (`discover`). Broadcast probe,
  unicast response.

Roles:

- The Reaper extension is the **server**. It binds the listening
  sockets and responds to requests.
- The MA3 plugin is the **client**. It opens a TCP connection per
  request and sends the request, reads the response, closes.

There is no server→client push. All communication is client-initiated.

Encoding throughout is **JSON** (UTF-8). All keys are camelCase ASCII.
There is no binary content in v1.

## §2 Framing

### §2.1 Frame layout

Every TCP message in either direction wears a six-byte header followed
by a JSON body.

```
+------+------+------+------+------+------+------+------+ ...
| 'M'  | 'C'  | length (uint32, little-endian)        | body (JSON UTF-8) ...
+------+------+------+------+------+------+------+------+ ...
```

- Bytes 0–1: ASCII magic. `MC` for client→server, `MS` for
  server→client.
- Bytes 2–5: payload length in bytes, little-endian unsigned 32-bit.
  Does not include the six-byte header.
- Bytes 6 onward: JSON body, exactly `length` bytes.

### §2.2 Magic

The magic distinguishes direction and lets the receiver fail fast on
junk traffic. A receiver that reads two bytes that are not its expected
magic closes the connection without reading further. There is no
attempt to resync mid-stream.

Client expects `MS` on every read.
Server expects `MC` on every read.

### §2.3 Length

Maximum payload length is **16 MiB** (`0x01000000` bytes). Requests or
responses larger than this are a protocol error. The receiver closes
the connection.

This limit is generous for v1. Marker dumps are tens of KB; MIDI dumps
are hundreds of KB; tempo and info are sub-KB. The limit exists to
bound the receiver's pre-allocated read buffer and to fail closed on
length-field corruption.

### §2.4 Encoding

The body is JSON, UTF-8 encoded. No BOM. No leading or trailing
whitespace. JSON numbers are IEEE 754 double-precision; integers
representable exactly within that (up to 2^53) are safe. Field order
is not significant.

### §2.5 Connection lifetime

One request, one response, then close. No keepalive. No pipelining.

A long-running handler may emit a `wait` continuation (§5) before its
final response, but that still counts as one logical exchange on one
socket.

## §3 Request envelope

Every request body is a JSON object with at least:

```json
{
  "action": "<verb>",
  "protocolVersion": "1.0"
}
```

### §3.1 Reserved fields

These keys are reserved across all verbs. Verb-specific fields are
defined per verb in §7.

| Key               | Type    | Required | Meaning                                          |
|-------------------|---------|----------|--------------------------------------------------|
| `action`          | string  | yes      | The verb name (`info`, `markers`, etc.).         |
| `protocolVersion` | string  | yes      | Client's wire-protocol version (see §10).        |
| `dataPool`        | integer | by verb  | MA3 DataPool int handle. See §3.2.               |
| `timeout`         | number  | no       | Per-call socket deadline override, in seconds.   |

Unknown keys are ignored. Adding a new optional key to a verb is a
non-breaking change.

### §3.2 dataPool

Several verbs are scoped to a specific MA3 DataPool. The MA3 plugin
sends `HandleToInt(DataPool())` so the server can write per-DataPool
metadata to the right file.

The server treats `dataPool` as an opaque integer key — it does not
interpret the value, only uses it for partitioning per-project state
on disk (see §7.5 saveMeta).

### §3.3 timeout

The default per-call socket deadline is **2 seconds**. A request may
override this for verbs known to take longer or shorter.

The server respects the timeout in two ways:
- It must produce *some* response (`done`, `wait`, or `error`) within
  the timeout. If it cannot, the client closes the socket.
- A `wait` response (§5) extends the deadline by the same timeout
  value. The client resets its receive deadline on each `wait`.

Verbs may specify a different default (e.g. transport verbs in §7.6
use 0.2 s).

## §4 Response envelope

Every response body is a JSON object with at least:

```json
{
  "status": "done"
}
```

### §4.1 status values

| Status   | Meaning                                                                |
|----------|------------------------------------------------------------------------|
| `done`   | Final response. Verb-specific fields populated per §7.                 |
| `wait`   | Continuation. Server is still working. Client re-receives. See §5.     |
| `error`  | Final response. Request failed. See §4.3.                              |

### §4.2 Successful responses

A `done` response carries verb-specific fields alongside `status`.
For example, a successful `info`:

```json
{
  "status": "done",
  "projectName": "Fiction_TakeCare",
  "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7",
  ...
}
```

Per-verb response schemas are in §7.

### §4.3 Error responses

A failed request returns:

```json
{
  "status": "error",
  "code": "<machine-readable>",
  "message": "<human-readable>"
}
```

`code` is a stable identifier. The client branches on the framing-
level codes below to choose appropriate UI. For verb-specific codes,
the client displays `message` and otherwise treats the error
generically.

#### Framing-level codes

These are emitted by the dispatcher itself and apply across all verbs.
The MA3 plugin handles each one specifically:

| Code                       | When                                                                   | Client behaviour                                                            |
|----------------------------|------------------------------------------------------------------------|------------------------------------------------------------------------------|
| `unknownAction`            | The `action` field doesn't match any registered verb.                  | Show "Reaper extension doesn't recognise this action — versions out of sync. Update one side." |
| `protocolVersionMismatch`  | `protocolVersion` does not match what the server supports (see §10).   | Show version-mismatch dialog with both versions, link to update.            |
| `noProject`                | A verb requires an open Reaper project; none is loaded.                | Show "Open a Reaper project first."                                          |
| `invalidRequest`           | A required field is missing or malformed.                              | Log; show "Internal error — please report." Bug, not user-facing.           |
| `internalError`            | Handler raised an unexpected exception.                                | Log; show "Reaper-side error: <message>".                                    |

#### Verb-specific codes

Verbs may define additional codes in §7 alongside the verb that emits
them. The client displays `message` and does not branch.

## §5 The wait continuation

### §5.1 Why it exists

Reaper's API is main-thread-only. The TCP server runs on a worker
thread. Handlers that need Reaper API access marshal work onto the
main thread. If the main-thread queue is busy or the handler's work
is genuinely slow, the request can take longer than the client's
default deadline.

`wait` lets the server tell the client "I'm still working — reset your
clock and read again on this socket."

### §5.2 Mechanics

The server may emit a `wait` response at any point before its final
response:

```json
{ "status": "wait" }
```

On receiving `wait`, the client:

1. Resets its socket receive deadline by the request's `timeout` (or
   the verb's default if absent).
2. Re-reads the next frame on the same socket.

The server may emit multiple `wait`s if it needs to extend further.
Each one resets the deadline. The final response is always `done` or
`error`.

A `wait` response carries no other fields. The server should send it
as soon as it knows the handler will exceed the default deadline,
not at the deadline itself — racing the client's timeout is fragile.

### §5.3 Inheritance from MArkers

This continuation pattern is taken directly from MArkers' protocol
(its `acf4591d == "wait"` sentinel). The semantics are unchanged.
The wire encoding differs only in being readable JSON.

## §6 Discovery (UDP)

### §6.1 Why discovery exists

Show machines have multiple network interfaces (wired show LAN,
wireless office network, sometimes a separate timecode VLAN). The MA3
desk and the Reaper machine may not be on the same subnet by default.
Hardcoding IPs is fragile when machines move.

Discovery lets the operator pick the Reaper they want from a list
generated by broadcasting on every available interface.

### §6.2 The probe

The MA3 plugin broadcasts on UDP port **29881** with payload:

```json
{
  "action": "discover",
  "protocolVersion": "1.0"
}
```

The probe is sent on every available NIC's directed broadcast address.
The MA3 plugin then listens on the same socket for 5 seconds,
collecting responses.

### §6.3 The response

Each Reaper extension that receives a `discover` replies via UDP
unicast back to the prober's address:

```json
{
  "status": "done",
  "ip": "192.168.1.42",
  "tcpPort": 29882,
  "name": "Show-PC"
}
```

Fields:

- `ip` — the responder's outgoing IP for that prober. Recovered by
  opening a connected UDP socket to the prober's address and reading
  the local end. Necessary when the responder has multiple NICs and
  the listener bound to `0.0.0.0`.
- `tcpPort` — the port the TCP server is bound to. The default is
  29882; if that's taken, the server tries 29883, 29884, ... up to
  29981. The port is reported in the discovery response so the client
  doesn't have to guess.
- `name` — friendly machine name for the picker UI. From
  `gethostname()` or equivalent.

A `discover` request that fails protocol-version validation responds
with the standard error envelope (`protocolVersionMismatch`). All
other dispatcher errors apply equally over UDP.

### §6.4 The picker

The MA3 plugin presents the collected responses to the operator as a
single-select list (`<name> — <ip>:<tcpPort>`). The selection is
persisted to MA3 UserVars `ZealSync_IP`, `ZealSync_Port`,
`ZealSync_Name`.

Discovery is invoked:

- The first time the plugin opens after install (no UserVars set).
- Manually from the Setup dialog ("Discover" button).
- Automatically when a TCP connect to the persisted endpoint fails,
  with operator confirmation ("Reaper not reachable — search again?").

### §6.5 No discovery on TCP

`discover` is UDP-only. It is not a registered TCP verb. Sending
`discover` over TCP returns `unknownAction`.

### §6.6 Inheritance from MArkers

This is MArkers' UDP discovery flow with the field hashes replaced
by readable names and the verb renamed (MArkers used `ReaperPoll` for
the discovery action). The port allocation is unchanged.

## §7 Verbs

This section defines every verb the protocol supports in v1. Each verb
has: a one-line purpose, request schema, response schema, error codes,
and notes on inheritance from MArkers.

Verbs added in later versions append to this section; they do not
renumber existing entries.

### §7.1 info

**Purpose.** Handshake. Verifies protocol version compatibility and
returns project-level metadata that all other verbs depend on.

**When called.** First request after connection establishment. The MA3
plugin sends `info` before any data verb. The response is cached for
the duration of one sync operation but not across sync operations —
each sync re-handshakes.

#### Request

```json
{
  "action": "info",
  "protocolVersion": "1.0",
  "dataPool": 12345
}
```

| Field             | Type    | Required | Notes                                          |
|-------------------|---------|----------|------------------------------------------------|
| `action`          | string  | yes      | Literal `"info"`.                              |
| `protocolVersion` | string  | yes      | See §10.                                       |
| `dataPool`        | integer | yes      | `HandleToInt(DataPool())` from MA3. The server uses this to look up per-DataPool metadata persisted by an earlier `saveMeta` (see §7.5). |

#### Response — success

```json
{
  "status": "done",
  "protocolVersion": "1.0",
  "buildVersion": "0.1.0",
  "projectName": "Fiction_TakeCare",
  "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7",
  "projectPath": "/Users/jake/reaper/Fiction_TakeCare.rpp",
  "projectLength": 247.5,
  "timeOffset": 0.0,
  "frameRate": 25.0,
  "dropFrame": false,
  "savedMeta": null
}
```

| Field             | Type            | Notes                                                                                                          |
|-------------------|-----------------|----------------------------------------------------------------------------------------------------------------|
| `protocolVersion` | string          | The server's protocol version. Must match the request's. See §10.                                              |
| `buildVersion`    | string          | The Reaper extension's build version (semver). Informational. The MA3 plugin displays this in the Setup dialog. |
| `projectName`     | string          | Reaper project name without `.rpp` extension. From `GetProjectName(-1)`.                                       |
| `projectGUID`     | string          | 32-char lowercase hex UUID (no braces, no dashes). See §7.1.1.                                                 |
| `projectPath`     | string          | Absolute path to the `.rpp` file.                                                                              |
| `projectLength`   | number          | Project length in seconds. From `GetProjectLength(0)`.                                                         |
| `timeOffset`      | number          | Project time offset in seconds. From `GetProjectTimeOffset(-1, false)`.                                        |
| `frameRate`       | number          | Project frame rate (fps). From `TimeMap_curFrameRate(-1)`.                                                     |
| `dropFrame`       | boolean         | Drop-frame flag. Second return of `TimeMap_curFrameRate(-1)`.                                                  |
| `savedMeta`       | object \| null  | Per-DataPool metadata previously persisted by `saveMeta`, keyed by the request's `dataPool`. `null` if no metadata exists for that DataPool. See §7.5 for the shape. |

#### §7.1.1 Project GUID semantics

The GUID is a UUIDv4 generated by the Reaper extension on first
contact for a given project. It lives in Reaper's project ext-state
under namespace `ZealSync`, key `projectGUID`, value the bare 32-char
lowercase hex (no braces, no dashes).

The handler:

1. Reads `GetProjExtState(-1, "ZealSync", "projectGUID")`.
2. If empty, generates a UUIDv4, strips dashes, lowercases, calls
   `SetProjExtState(-1, "ZealSync", "projectGUID", <hex>)`, then
   `MarkProjectDirty(-1)`. The project must be saved by the operator
   for the GUID to persist on disk.
3. Returns the GUID either way.

The GUID is the stable identity used by all downstream sync verbs and
by ZealData blobs on MA3 objects (see §8). It survives "Save As"
because Reaper copies ext-state with the project; this is intended
behaviour. If the operator wants a fresh identity for a Save-As copy,
they delete the ext-state key manually.

The GUID is *not* generated when the extension loads, only when the
first `info` request arrives. Empty Reaper sessions do not get GUIDs.

#### §7.1.2 buildVersion

`buildVersion` is informational only. The MA3 plugin does not gate on
it. It is surfaced in the Setup dialog so an operator can answer "what
versions are you running?" during support.

The server reports its own build version. The MA3 plugin reports its
build version separately in its UI.

The format is dotted semver (`MAJOR.MINOR.PATCH`). Pre-1.0 ZealSync
ships as `0.x.y`.

#### §7.1.3 savedMeta

When the MA3 plugin runs a sync, it sends a metadata blob back to the
server via `saveMeta` (§7.5). The blob contains the MA3 plugin's view
of which Sequences, Cues, Pages, and Sounds it has created or
reconciled for that project, keyed by the MA3 DataPool.

On the next `info` request, the server returns that same blob to the
MA3 plugin under `savedMeta`, so the plugin can rediscover prior state
without walking every Note property on every MA3 object up front.

`savedMeta` is `null` for first-ever syncs and after a project is
moved to a host that doesn't have the per-DataPool `.dat` file.

The shape of `savedMeta` is defined in §7.5 (saveMeta).

#### Errors

`info` may return any framing-level error (§4.3). Verb-specific
errors:

| Code        | When                                                       |
|-------------|------------------------------------------------------------|
| `noProject` | No Reaper project is open. `EnumProjects(-1)` returns nil. |

#### Default timeout

2 seconds (the protocol default). `info` is a fast handler — it does
no I/O beyond ext-state reads.

#### Inheritance from MArkers

`info` corresponds to MArkers' `info` verb (`di` at MArkersServer_clean.lua:1495,
walked in SYNC_FLOW.md §5). Differences:

| MArkers field             | ZealSync field      | Note                                              |
|---------------------------|---------------------|---------------------------------------------------|
| `a3bdc261`                | `projectName`       | Renamed.                                          |
| `a06af6c3`                | `projectPath`       | Renamed.                                          |
| `aa5f01de`                | (dropped)           | Was `<name>.rpp`; redundant with `projectPath`.   |
| `a04556b5`                | `projectGUID`       | Renamed; namespace changed from `MARKERS`/`MArkers` (asymmetric in MArkers) to `ZealSync`. |
| `a27f7dd7`                | `timeOffset`        | Renamed.                                          |
| `a9c920d0`                | `frameRate`         | Renamed.                                          |
| `a5f75b55`                | `dropFrame`         | Renamed.                                          |
| `afd0469a`                | `protocolVersion`   | Was conflated with build version; split in §10.   |
| `aa942c2a`                | `savedMeta`         | Renamed; semantics unchanged.                     |
| `a3e4ce38`                | (dropped)           | MArkers internal token; not used by client.       |
| `a3075197`                | `projectLength`     | Renamed.                                          |
| (none)                    | `buildVersion`      | New; split off from `protocolVersion`.            |

The MArkers client also computed two derived fields (`a1f2d3df`
packed-offset×fps, `ae6dc493` project initials) on receipt. ZealSync
moves these to the MA3 client; they do not appear on the wire.

### §7.2 markers

**Purpose.** Returns the project's markers and regions as a single
flat list, with the per-color groupings the MA3 client needs to map
them to Sequences.

**When called.** During a sync operation, after `info` has succeeded.
The MA3 client uses the response to build the Sequence-creation diff
shown in the sync preview dialog.

#### Request

```json
{
  "action": "markers",
  "protocolVersion": "1.0",
  "dataPool": 12345
}
```

| Field             | Type    | Required | Notes                                                       |
|-------------------|---------|----------|-------------------------------------------------------------|
| `action`          | string  | yes      | Literal `"markers"`.                                        |
| `protocolVersion` | string  | yes      | See §10.                                                    |
| `dataPool`        | integer | yes      | Forwarded to the dispatcher; not used by the markers handler itself. Required for consistency. |

#### Response — success

```json
{
  "status": "done",
  "markers": [
    {
      "guid": "a4f1e2c08b3d4a5e9c1b6f0e8d2c4a7b",
      "name": "Verse 1",
      "startTime": 12.5,
      "endTime": null,
      "color": 16711680,
      "displayedColor": 16711680,
      "userNumber": 1,
      "bpmAtPosition": 120.0
    },
    {
      "guid": "b7e2d3f19c4e5a6b0d2c7f1e9d3b5a8c",
      "name": "Chorus",
      "startTime": 28.0,
      "endTime": 44.0,
      "color": 65280,
      "displayedColor": 65280,
      "userNumber": 2,
      "bpmAtPosition": 120.0
    }
  ],
  "colorGroups": [
    { "color": 16711680, "count": 4 },
    { "color": 65280, "count": 3 }
  ]
}
```

#### §7.2.1 The markers array

Markers and regions are returned as a single flat array. A region is
distinguished from a marker by the presence of a non-null `endTime`.

| Field            | Type            | Notes                                                                                          |
|------------------|-----------------|------------------------------------------------------------------------------------------------|
| `guid`           | string          | 32-char lowercase hex, no braces. From REAPER's marker GUID via `GetSetProjectInfo_String`.   |
| `name`           | string          | Marker name. From `P_NAME`. May be empty.                                                      |
| `startTime`      | number          | Start position in seconds.                                                                     |
| `endTime`        | number \| null  | End position in seconds for regions; `null` for point markers.                                 |
| `color`          | integer         | Effective color as a 24-bit RGB integer (0xRRGGBB). From `I_CUSTOMCOLOR`, with REAPER's high bit stripped. |
| `displayedColor` | integer         | Color actually rendered in REAPER, accounting for the project's color override. From `I_DISPLAYEDCOLOR`, same encoding. |
| `userNumber`     | integer         | The user-assigned marker number visible in REAPER's ruler. From `I_NUMBER`.                    |
| `bpmAtPosition`  | number          | The project's effective BPM at `startTime`. The handler walks the tempo map; if the project has no tempo markers, this is the project signature default. |

The array is sorted by `startTime` ascending, ties broken by REAPER's
marker enumeration order (stable within one response; not exposed on
the wire).

Markers with empty names are included. Filtering empty-named markers
is the MA3 client's responsibility, since the operator may want them
visible in the sync preview.

#### §7.2.2 The colorGroups array

A precomputed summary of how many markers share each unique `color`
value. This drives the MA3 client's "one Sequence per color" mapping
without re-walking the markers array.

| Field   | Type    | Notes                                          |
|---------|---------|------------------------------------------------|
| `color` | integer | Same encoding as the marker `color` field.     |
| `count` | integer | Number of markers (including regions) with this color. |

Sorted by descending `count`, ties broken by ascending `color` value.
Stable ordering is required so the MA3 client's preview dialog rows
appear in a consistent order across re-syncs.

The `color` value `0` (the REAPER default "no custom color") is
included in `colorGroups` if any markers carry it. The MA3 client
treats default-colored markers as a distinct group, not as
"unassigned" — they map to a Sequence too.

#### §7.2.3 Color encoding

REAPER stores marker colors as a 32-bit native integer with the high
bit set (`0x01000000`) to indicate "custom color" vs "inherit." The
handler strips the high bit before transmission. The wire value is a
plain 24-bit RGB integer, where `0xRRGGBB` packs red in bits 16–23,
green in bits 8–15, blue in bits 0–7.

A marker with no custom color set has `color: 0` on the wire.
`displayedColor` is the resolved color REAPER actually rendered,
which may differ if the project has a marker-color override active.
The MA3 client uses `color` for grouping; `displayedColor` is
informational and may be surfaced in the preview dialog.

#### §7.2.4 GUID format

REAPER returns marker GUIDs in the form `{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}`.
The handler strips braces and dashes and lowercases the hex. The wire
value is 32 lowercase hex characters with no separators, matching the
format used for `projectGUID` in `info` (§7.1.1).

This format is also the one stamped into MA3 Note properties via
ZealData blobs — see §8.

#### §7.2.5 Empty projects

A project with no markers and no regions returns:

```json
{
  "status": "done",
  "markers": [],
  "colorGroups": []
}
```

This is not an error. The MA3 client's sync preview surfaces it as
"no markers in project" and offers to proceed (in case the operator
is syncing for MIDI alone).

#### Errors

`markers` may return any framing-level error (§4.3). Verb-specific
errors:

| Code        | When                                                       |
|-------------|------------------------------------------------------------|
| `noProject` | No Reaper project is open.                                 |

#### Default timeout

2 seconds. Marker enumeration is fast; even projects with hundreds of
markers complete well under this.

#### Inheritance from MArkers

`markers` corresponds to MArkers' `markers` verb (`bS` at
MArkersServer_clean.lua:1052, walked in SYNC_FLOW.md §7). Differences:

- MArkers returned three top-level arrays (`a91714e3` markers,
  `a39401d9` regions, `a13c343f` master groups). ZealSync flattens
  markers and regions into one array distinguished by `endTime`, and
  renames master groups to `colorGroups`. Rationale: the MA3-side
  mapping is identical for markers and regions in v1; the split was
  legacy.
- MArkers returned `a20da4dc` (ruler lanes), `a931305d` (master
  color), `a91437f3` (master lane index). ZealSync drops these in
  v1 — color is the only grouping dimension we use. They can return
  as additive response fields if lane-grouping is ever introduced.
- MArkers integrated with a third-party hidden-marker tool
  (`ReaperTools_MarkerVisibilityCore`, see SYNC_FLOW.md §7 step 3).
  ZealSync drops this entirely. Markers the operator wants hidden
  should be deleted in REAPER.

| MArkers field     | ZealSync field      | Note                                              |
|-------------------|---------------------|---------------------------------------------------|
| `a3bdc261`        | `name`              | Renamed.                                          |
| `adbfa544`        | (dropped)           | Was raw pre-tag-strip name; tag stripping is a MArkers MIDI workflow, not used here. |
| `a5320370`        | `startTime`         | Renamed.                                          |
| `a72235e2`        | `endTime`           | Renamed; null instead of absent for point markers. |
| `a12b4a07`        | `color`             | Renamed; high bit stripped on the server side.    |
| `a7044d68`        | `displayedColor`    | Renamed; same encoding as `color`.                |
| `a90ff523`        | `userNumber`        | Renamed.                                          |
| `a09f63fb`        | (dropped)           | Was zero-based enumeration index; not stable across edits, and `guid` covers identity. Server still sorts by it internally as the tie-break for equal `startTime`. |
| `ad40375c`        | `guid`              | Renamed; braces and dashes stripped, lowercased.  |
| `a156ed81`        | `bpmAtPosition`     | Renamed.                                          |
| `a4799f71`        | (dropped)           | Was lane number; lanes dropped in v1.             |
| `aedcc9ac` (per-color-group) | (dropped) | Was an always-true "enabled" flag on color-group entries; semantics never differentiated. Drop unless we add per-group disable later. |
| `a91714e3` (top)  | `markers` (top)     | Renamed; merged with regions.                     |
| `a39401d9` (top)  | (merged)            | Merged into `markers`.                            |
| `a13c343f` (top)  | `colorGroups` (top) | Renamed; semantic unchanged.                      |
| `a20da4dc` (top)  | (dropped)           | Lanes dropped.                                    |
| `a931305d` (top)  | (dropped)           | Master color dropped.                             |
| `a91437f3` (top)  | (dropped)           | Master lane index dropped.                        |

### §7.3 midi

**Purpose.** Returns named MIDI notes from the project, grouped by
track. Each (track, named-note) pair is the source for one MA3
Sequence; each occurrence of that note in the timeline is a Cue in
that Sequence.

**When called.** During a sync operation, after `info` and typically
alongside `markers`. The MA3 client uses the response to extend the
sync preview dialog with MIDI sequences alongside marker sequences.

#### Request

```json
{
  "action": "midi",
  "protocolVersion": "1.0",
  "dataPool": 12345
}
```

| Field             | Type    | Required | Notes                                                     |
|-------------------|---------|----------|-----------------------------------------------------------|
| `action`          | string  | yes      | Literal `"midi"`.                                         |
| `protocolVersion` | string  | yes      | See §10.                                                  |
| `dataPool`        | integer | yes      | Forwarded to the dispatcher; not used by the midi handler itself. |

#### Response — success

```json
{
  "status": "done",
  "tracks": [
    {
      "guid": "c8d4f2e1a9b3c5d7e0f2a4b6c8d0e2f4",
      "name": "Drums",
      "trackNumber": 3,
      "color": 16711680,
      "namedNotes": [
        {
          "noteNumber": 36,
          "name": "Kick",
          "events": [
            { "startTime": 12.5, "endTime": 12.6, "velocity": 100, "takeGUID": "..." },
            { "startTime": 14.0, "endTime": 14.1, "velocity": 110, "takeGUID": "..." }
          ]
        },
        {
          "noteNumber": 38,
          "name": "Snare",
          "events": [
            { "startTime": 13.0, "endTime": 13.1, "velocity": 95, "takeGUID": "..." }
          ]
        }
      ]
    }
  ]
}
```

#### §7.3.1 The tracks array

One entry per REAPER track that has at least one named MIDI note in
its named-note table. Tracks without named notes are excluded
entirely — they do not appear in the response.

| Field         | Type    | Notes                                                                                  |
|---------------|---------|----------------------------------------------------------------------------------------|
| `guid`        | string  | 32-char lowercase hex, no braces. From `GetTrackGUID`. The stable identifier used by ZealData blobs on MA3 Sequences. |
| `name`        | string  | Track name from `GetTrackName`. May be empty.                                          |
| `trackNumber` | integer | 1-based track number from `IP_TRACKNUMBER`. Display-order only; not stable across track reorderings. |
| `color`       | integer | Track color as 24-bit RGB integer (0xRRGGBB), high bit stripped. From `GetTrackColor`. |
| `namedNotes`  | array   | The named-note entries that source MA3 Sequences. See §7.3.2.                          |

The array is sorted by `trackNumber` ascending. Stable ordering for
display.

#### §7.3.2 The namedNotes array

One entry per (track, MIDI note number) pair where the operator has
named the note in REAPER's per-track named-note table. Each entry
maps to exactly one MA3 Sequence on the client side.

| Field        | Type    | Notes                                                                              |
|--------------|---------|------------------------------------------------------------------------------------|
| `noteNumber` | integer | MIDI note number 0–127.                                                            |
| `name`       | string  | The name the operator gave this note. Non-empty by construction (named-only filter). |
| `events`     | array   | Every occurrence of `noteNumber` on this track in the project timeline. See §7.3.3. |

The array is sorted by `noteNumber` ascending.

A track may have a named note in its table that has zero events in
the project (the operator named C1 "Kick" but hasn't placed any C1
events yet). Such entries are included with an empty `events` array.
The MA3 client's preview dialog surfaces these as "Sequence with no
cues" and the operator can choose to create the Sequence anyway or
skip it.

#### §7.3.3 The events array

| Field       | Type    | Notes                                                                                  |
|-------------|---------|----------------------------------------------------------------------------------------|
| `startTime` | number  | Note-on time in project seconds. From `MIDI_GetProjTimeFromPPQPos` on the take's PPQ. |
| `endTime`   | number  | Note-off time in project seconds. Always > `startTime`.                                |
| `velocity`  | integer | Note-on velocity, 1–127.                                                               |
| `takeGUID`  | string  | 32-char lowercase hex, no braces. The GUID of the MIDI take containing this event. Allows the MA3 client to attribute events to specific takes if it ever needs to (not used in v1, retained for future). |

Events are sorted by `startTime` ascending. Ties broken by
`noteNumber` (impossible within one `namedNotes` entry since
`noteNumber` is fixed, but defensive — useful if event arrays are
ever flattened across notes).

Only events whose **note-on** falls within the take's media-item
boundary are included. Events that start before the item but end
inside it (rare; happens with edited takes) are excluded. This
matches REAPER's own playback semantics — the note doesn't fire if
its on-time is outside the item.

#### §7.3.4 The named-note filter

A note number on a track is "named" if `GetTrackMIDINoteName(track,
note, channel=0)` returns a non-empty string for that pairing.

The handler walks every track × note (0..127) combination once at the
start to build the named-note set, *then* walks media items and
events to populate `events` arrays. This two-pass structure means an
unnamed note never produces a Sequence, even if it has thousands of
events in the project.

This is the headline UX choice: naming a note in REAPER is the
operator's explicit signal "this note is a lighting cue." Tracks
full of unnamed musical MIDI (basslines, melodies) produce zero
Sequences regardless of note density.

If the operator wants every note on a track to become a Sequence,
they name every note. There is no "wildcard" or "all notes" option
in v1.

#### §7.3.5 Empty projects and tracks-without-named-notes

A project with no MIDI tracks, or no named notes on any track,
returns:

```json
{
  "status": "done",
  "tracks": []
}
```

This is not an error. The MA3 client surfaces it as "no MIDI in
project" and offers to proceed (markers-only sync).

#### §7.3.6 Channel handling

v1 reads named notes from channel 0 only. REAPER's named-note table
is per-track-per-channel; in practice operators use channel 0 for
all named notes. Multi-channel support can be added later as an
additive request flag without breaking the response shape.

#### Errors

`midi` may return any framing-level error (§4.3). Verb-specific
errors:

| Code        | When                                                       |
|-------------|------------------------------------------------------------|
| `noProject` | No Reaper project is open.                                 |

#### Default timeout

5 seconds. MIDI scrape is the heaviest read in the protocol —
projects with many tracks and many events can exceed the 2-second
default. The handler should emit a `wait` continuation (§5) if it
detects the work will run long, but pre-emptively widening the
default avoids `wait` overhead on common cases.

#### Inheritance from MArkers

`midi` corresponds to MArkers' `midi` verb (`cE` at MArkersServer_clean.lua:1341,
walked in SYNC_FLOW.md §14). Significant differences:

- MArkers returned a **flat dict keyed by track GUID**. ZealSync
  returns an **array of track entries**. Reason: arrays are
  trivially ordered (by `trackNumber`) and the MA3 client wants
  ordered display in the preview. Re-keying server-side is cheaper
  than sorting client-side.
- MArkers built named-note entries opportunistically — when an
  unnamed note appeared in events, MArkers synthesised a Sequence
  for it with the generic name `MIDI Note <N>` (cE at line
  1433-1435). ZealSync drops this entirely. **Named-only.** Unnamed
  notes are silently ignored regardless of event count. Rationale:
  named-only is the operator's opt-in signal; opportunistic
  synthesis produces surprise Sequences.
- MArkers parsed `[tag]` suffixes in track names to extract
  per-Sequence configuration (sequence type, priority, repeat
  count, reset flag). ZealSync drops this. Track names are track
  names. Per-Sequence configuration belongs in the MA3 sync preview
  dialog where the operator can see and adjust.
- MArkers' per-named-note entry carried a `velocity-set` array
  (`abbbba71`) — a deduplicated list of every velocity value seen
  for that note. ZealSync drops it; the per-event `velocity` field
  carries the same information without the dedup pass.
- MArkers carried an always-true `aedcc9ac` "enabled" flag on each
  named-note entry. Dropped (same rationale as §7.2).

| MArkers field (per-track)         | ZealSync field      | Note                                              |
|-----------------------------------|---------------------|---------------------------------------------------|
| dict key (track GUID)             | `guid`              | Hoisted into the entry; braces stripped, lowercased. |
| `a3bdc261`                        | `name`              | Renamed.                                          |
| `a09f63fb`                        | `trackNumber`       | Renamed.                                          |
| `a12b4a07`                        | `color`             | Renamed; high bit stripped.                       |
| `ad40375c`                        | (merged into `guid`) | Was a duplicate field for the dict key.           |
| `a33a7def`                        | (dropped)           | Was a track-level enabled flag, always true.      |
| `af09dc19`                        | (dropped)           | MA3-side Page binding pointer; doesn't belong on the wire. |
| `ab89ceef` (named notes array)    | `namedNotes`        | Renamed.                                          |
| `a01d3537` (events array)         | (restructured)      | Was a flat per-track events array. ZealSync nests events under their named-note entry — closer to the MA3 client's consumption shape. |

| MArkers field (per-named-note)    | ZealSync field      | Note                                              |
|-----------------------------------|---------------------|---------------------------------------------------|
| `a6d2608d`                        | `noteNumber`        | Renamed.                                          |
| `a3bdc261`                        | `name`              | Renamed.                                          |
| `abbbba71` (velocity set)         | (dropped)           | Per-event velocity carries this.                  |
| `a1925f31`                        | (dropped)           | MA3-side Sequence handle; doesn't belong on wire. |
| `aedcc9ac`                        | (dropped)           | Always-true enabled flag.                         |
| `a190b284`                        | (dropped)           | "Offset flag"; MA3-side reconcile state.          |
| `a04e85a2`, `a4887d7a`, `abf2dc54`, `a44f1259` | (dropped) | All from the `[tag]` parser. Tag parsing dropped. |
| `a156ed81`                        | (dropped)           | Was BPM-at-first-event; let the MA3 client compute from `bpmAtPosition` on each marker if it needs this. |

| MArkers field (per-event)         | ZealSync field      | Note                                              |
|-----------------------------------|---------------------|---------------------------------------------------|
| `a5320370`                        | `startTime`         | Renamed.                                          |
| `a72235e2`                        | `endTime`           | Renamed.                                          |
| `a6d2608d`                        | (merged into parent) | Note number is fixed per-namedNotes entry; redundant on each event. |
| `a77a41bb`                        | `velocity`          | Renamed.                                          |
| `ad4987af`                        | `takeGUID`          | Renamed; braces stripped, lowercased.             |
| `a09f63fb`                        | (dropped)           | Was a string per-event sequence number for that note (e.g. "1", "2", "3"). MA3 client can compute trivially. |

### §7.4 tempo

**Purpose.** Returns the project's tempo and time-signature markers as
a flat array. The MA3 client uses this to materialise a Tempo Sequence
on the desk and to stamp BPM-driven cue events.

**When called.** During a sync operation, after `info`. Typically in
parallel with `markers` and `midi`. The response is small and the
handler is fast — there is no penalty for fetching it on every sync.

#### Request

```json
{
  "action": "tempo",
  "protocolVersion": "1.0",
  "dataPool": 12345
}
```

| Field             | Type    | Required | Notes                                                     |
|-------------------|---------|----------|-----------------------------------------------------------|
| `action`          | string  | yes      | Literal `"tempo"`.                                        |
| `protocolVersion` | string  | yes      | See §10.                                                  |
| `dataPool`        | integer | yes      | Forwarded to the dispatcher; not used by the tempo handler itself. |

#### Response — success

```json
{
  "status": "done",
  "tempos": [
    { "startTime": 0.0,   "bpm": 120.0, "numerator": 4, "denominator": 4 },
    { "startTime": 32.0,  "bpm": 140.0, "numerator": 4, "denominator": 4 },
    { "startTime": 64.0,  "bpm": 140.0, "numerator": 6, "denominator": 8 }
  ]
}
```

#### §7.4.1 The tempos array

One entry per tempo / time-signature marker in the project, sorted by
`startTime` ascending.

| Field         | Type    | Notes                                                                                  |
|---------------|---------|----------------------------------------------------------------------------------------|
| `startTime`   | number  | Position in project seconds.                                                           |
| `bpm`         | number  | Tempo in beats per minute at this position.                                            |
| `numerator`   | integer | Time-signature numerator (e.g. 4 for 4/4, 6 for 6/8). Default 4 if REAPER returns 0.  |
| `denominator` | integer | Time-signature denominator (e.g. 4 for 4/4, 8 for 6/8). Default 4 if REAPER returns 0. |

A tempo marker that changes only BPM (no time-signature change)
carries the previous time signature's `numerator` and `denominator`.
A marker that changes only the time signature carries the previous
tempo's `bpm`. The handler resolves these from REAPER's tempo map so
the wire format always carries the *effective* values at each
position, not deltas.

#### §7.4.2 Projects with no tempo markers

A project that has never had a tempo marker added returns a single
synthesised entry at position 0 carrying the project's default
tempo and time signature:

```json
{
  "status": "done",
  "tempos": [
    { "startTime": 0.0, "bpm": 120.0, "numerator": 4, "denominator": 4 }
  ]
}
```

The synthesised entry comes from `GetProjectTimeSignature2`. This
matches REAPER's own behaviour — playback uses the project default
when no tempo markers are set.

The `tempos` array is never empty in a successful response. An empty
array would be ambiguous (no project? no tempo? bug?); the synthesised
default removes the ambiguity.

#### §7.4.3 BPM precision

`bpm` is a JSON number with full IEEE 754 double precision. REAPER
internally stores tempo as a float; the wire format does no rounding.
The MA3 client may round for display but should preserve full
precision when stamping CmdEvents into the Tempo Sequence.

#### Errors

`tempo` may return any framing-level error (§4.3). Verb-specific
errors:

| Code        | When                                                       |
|-------------|------------------------------------------------------------|
| `noProject` | No Reaper project is open.                                 |

#### Default timeout

2 seconds. Tempo enumeration is the fastest read in the protocol —
even projects with hundreds of tempo changes complete in tens of
milliseconds.

#### Inheritance from MArkers

`tempo` corresponds to MArkers' `tempo` verb (`cn` at MArkersServer_clean.lua:1161,
walked in SYNC_FLOW.md §7).

| MArkers field | ZealSync field    | Note                                              |
|---------------|-------------------|---------------------------------------------------|
| `a43ac778`    | `bpm`             | Renamed.                                          |
| `a7890f1e`    | `numerator`       | Renamed.                                          |
| `a1ac97d8`    | `denominator`     | Renamed.                                          |
| `a5320370`    | `startTime`       | Renamed; same field name as in `markers` and `midi` for consistency. |

Behavioural difference: MArkers' synthesised default for empty-tempo
projects defaulted denominator to 4 unconditionally
(MArkersServer_clean.lua:1175-1186). ZealSync uses
`GetProjectTimeSignature2`'s actual return — which is also 4 in
practice but tracks the project setting if the operator changed it.
Same observable behaviour in 99.9% of cases; correct in the 0.1%.

### §7.5 saveMeta

**Purpose.** Persists the MA3 client's per-DataPool sync state to disk
on the Reaper machine, so the next sync can recover that state via
`info`'s `savedMeta` field (§7.1.3).

**When called.** At the end of every successful sync operation, after
the MA3 client has finished creating and updating MA3 objects. One
call per sync.

#### Request

```json
{
  "action": "saveMeta",
  "protocolVersion": "1.0",
  "dataPool": 12345,
  "meta": {
    "schemaVersion": 1,
    "lastSyncTime": "2026-05-07T14:32:00Z",
    "buildVersion": "0.1.0",
    "markerSequences": [
      { "color": 16711680, "sequenceHandle": "Sequence 47" },
      { "color": 65280,    "sequenceHandle": "Sequence 48" }
    ],
    "midiSequences": [
      {
        "trackGUID": "c8d4f2e1a9b3c5d7e0f2a4b6c8d0e2f4",
        "channel": 0,
        "noteNumber": 36,
        "sequenceHandle": "Sequence 49"
      }
    ],
    "tempoSequence": "Sequence 50",
    "timecodeHandle": "Timecode 5",
    "preferences": {
      "deleteWarningSuppressed": ["Sequence 47"],
      "lastUsedPoolStart": 47
    }
  }
}
```

| Field             | Type    | Required | Notes                                             |
|-------------------|---------|----------|---------------------------------------------------|
| `action`          | string  | yes      | Literal `"saveMeta"`.                             |
| `protocolVersion` | string  | yes      | See §10.                                          |
| `dataPool`        | integer | yes      | The MA3 DataPool int handle. Used as a partition key for the on-disk blob. |
| `meta`            | object  | yes      | The blob to persist. Schema in §7.5.1.            |

#### Response — success

```json
{
  "status": "done",
  "bytesWritten": 1247,
  "backupCreated": true
}
```

| Field           | Type    | Notes                                                      |
|-----------------|---------|------------------------------------------------------------|
| `bytesWritten`  | integer | Byte count of the blob as written to disk. Informational.  |
| `backupCreated` | boolean | `true` if a prior blob existed and was rotated to backups/ before this write; `false` on first-ever save for this `(projectGUID, dataPool)` pair. |

#### §7.5.1 The meta schema

`meta` is the persisted blob. The MA3 client constructs it; the server
treats it opaquely except to read `schemaVersion` for forward-
compatibility and write it to disk.

| Field              | Type    | Notes                                                                              |
|--------------------|---------|------------------------------------------------------------------------------------|
| `schemaVersion`    | integer | Schema version of this blob's structure. Currently `1`. Bumped when the meta schema changes incompatibly; both halves negotiate. See §7.5.5. |
| `lastSyncTime`     | string  | ISO 8601 UTC timestamp of when this sync completed on the MA3 client. Informational; surfaced in the sync preview dialog ("last synced 2 hours ago"). |
| `buildVersion`     | string  | The MA3 plugin's build version at the time of this sync. Informational; helps diagnose "why does my old show file behave differently than the new one." |
| `markerSequences`  | array   | Color → MA3 Sequence handle index. See §7.5.2.                                     |
| `midiSequences`    | array   | (track, channel, note) → MA3 Sequence handle index. See §7.5.2.                    |
| `tempoSequence`    | string \| null | MA3 Sequence handle for the Tempo Sequence, or `null` if no tempo sync has been done. |
| `timecodeHandle`   | string \| null  | MA3 Timecode pool object handle for this project (e.g. `"Timecode 5"`). `null` if no Timecode has been created yet. The Timecode is the project-level anchor; see §8.3.1. |
| `preferences`      | object  | Cross-cutting UI state. See §7.5.3.                                                |

#### §7.5.2 Sequence handle indices

The `markerSequences` and `midiSequences` arrays are minimal lookup
tables — given a marker color or (track, channel, note) tuple, find
the MA3 Sequence handle that was created or updated for it on the
last sync.

These indices exist to make the next sync fast: instead of walking
every MA3 Note property looking for ZealData blobs, the client
loads the index from `info`'s `savedMeta` and resolves identity in
O(1).

**markerSequences entry:**

| Field            | Type    | Notes                                                                              |
|------------------|---------|------------------------------------------------------------------------------------|
| `color`          | integer | 24-bit RGB integer (same encoding as `markers` response).                          |
| `sequenceHandle` | string  | MA3 Sequence handle as a string (e.g. `"Sequence 47"`). Format is opaque to the server. |

**midiSequences entry:**

| Field            | Type    | Notes                                                                              |
|------------------|---------|------------------------------------------------------------------------------------|
| `trackGUID`      | string  | 32-char lowercase hex (same encoding as `midi` response).                          |
| `channel`        | integer | MIDI channel, 0–15. Always `0` in v1; field present for forward compatibility (§7.3, channel decision). |
| `noteNumber`     | integer | MIDI note number, 0–127.                                                           |
| `sequenceHandle` | string  | MA3 Sequence handle as a string.                                                   |

The handle format is the MA3 client's concern. The server stores and
returns the string verbatim. The MA3 client is responsible for
validating that handles still resolve to existing objects on every
read — see §7.5.6.

#### §7.5.3 The preferences object

Cross-cutting UI state that doesn't belong on any single MA3 object.
Things that are properties of the operator's workflow on this desk
for this project, not properties of the synced content.

v1 fields:

| Field                       | Type    | Notes                                                                              |
|-----------------------------|---------|------------------------------------------------------------------------------------|
| `deleteWarningSuppressed`   | array of string | MA3 Sequence handles for which the "this Sequence's source no longer exists in Reaper, delete?" prompt has been suppressed by the operator clicking "Don't show again." |
| `lastUsedPoolStart`         | integer | The pool index where the last sync started reserving Sequence slots. Used as a hint for the next sync's "next available slot" search. |

`deleteWarningSuppressed` here is a fast-path index over the per-object
`deleteWarningSuppressed` boolean stamped in each Sequence's ZealData
record (§8.4). The per-object value is authoritative on conflict; this
list exists to avoid walking every Sequence's Note property at
dialog-decision time.

Additional preference fields may be added in future schema versions.
Unknown preference keys are preserved verbatim by the server (round-
tripped) and ignored by older clients. See §7.5.5 on schema
versioning.

#### §7.5.4 On-disk format

The server writes `meta` to:

```
<projectDir>/ZealSync/<projectGUID>-<dataPool>.json
```

Where:
- `<projectDir>` is the directory containing the .rpp file.
- `<projectGUID>` is from the project's ext-state (§7.1.1).
- `<dataPool>` is the request's `dataPool` field, formatted as a
  decimal integer.

The file is JSON, UTF-8, pretty-printed (2-space indent) for
human inspection. The server creates `<projectDir>/ZealSync/` if it
doesn't exist.

**Atomic write protocol:**

1. Serialise `meta` to JSON bytes.
2. Write bytes to `<projectDir>/ZealSync/<projectGUID>-<dataPool>.json.tmp`.
3. If the canonical file `<projectGUID>-<dataPool>.json` exists, move it to `<projectDir>/ZealSync/backups/<projectGUID>-<dataPool>-<timestamp>.json` (creating `backups/` if needed). `<timestamp>` is `YYYYMMDD-HHMMSS` UTC.
4. Rename `.tmp` to the canonical filename.
5. List existing backups for this `(projectGUID, dataPool)` pair, sort by timestamp descending, delete entries beyond the cap.

If any of steps 2–4 fail, the canonical file is left untouched. The
server returns an `error` response (see Errors below) and the MA3
client may retry.

If step 5 fails (e.g. permission denied on a backup file), the write
is still considered successful; the cap-exceedance is logged but does
not propagate as an error. One extra backup is harmless.

**Backup cap:**

Default is **10** backups per `(projectGUID, dataPool)` pair.
Configurable via REAPER ext-state:

```
namespace: ZealSync
key:       backupCount
value:     <integer string>, "0" disables backups entirely
```

The server reads this value at saveMeta time. A missing or malformed
value uses the default.

**Backup directory pruning:**

Backups for projects whose canonical blob has been deleted are not
auto-pruned. Operators who want to fully clear sync state for a
project delete `<projectDir>/ZealSync/` manually.

#### §7.5.5 Schema versioning

The `schemaVersion` field on `meta` is independent of the wire-protocol
version (§10). It governs the structure of the persisted blob.

- **v1** — the schema documented above.

When a future client writes a higher `schemaVersion` than the current
client supports reading:

- The server stores the blob verbatim regardless. The server does not
  interpret `meta` beyond reading `schemaVersion` for logging.
- On the next sync, an older client receives the higher-versioned
  blob via `info`'s `savedMeta`. The client should compare
  `schemaVersion` against its supported max:
  - If equal: read normally.
  - If lower: forward-compatible read using the v1 fields the
    client knows about. Unknown fields are preserved by being
    written back unchanged on the next saveMeta.
  - If higher: log a warning, treat as if no `savedMeta` exists,
    and fall back to walking ZealData. The next saveMeta from this
    client will overwrite the higher version with a v1 blob;
    operators running mixed-version clients on the same project
    should update both halves.

In v1, the schemaVersion check is informational. The first
forward-incompatible change bumps to v2 and adds the read-path branch
above.

#### §7.5.6 Validation contract

The blob is a **hint**, not an authoritative record. Every reference
in `meta` to an MA3 object is best-effort:

- Operators can manually delete or rename MA3 Sequences between
  syncs.
- A show file imported from another desk arrives without a blob;
  the next saveMeta on the receiving desk creates a fresh one.
- The blob may be older than the MA3 show state (operator synced,
  saved show, made manual edits, didn't re-sync).

The MA3 client validates every handle reference before use:

1. Resolve `sequenceHandle` to an MA3 object.
2. If the object doesn't exist, drop the entry silently.
3. If the object exists but is no longer a Sequence (e.g. operator
   replaced it with a different object class), drop the entry.
4. If the object exists and is a Sequence but doesn't carry the
   expected ZealData blob (§8), treat as a fresh object —
   re-stamp ZealData, keep the entry.

The server performs no validation. It writes whatever `meta` it
receives and returns whatever it loaded last time. Drift between
blob and reality is the MA3 client's responsibility to detect and
heal.

This is the right division of labour: the server doesn't know the
MA3 object model and shouldn't try to. The MA3 client owns the
truth; the blob is its own performance-optimised cache.

#### §7.5.7 Empty saveMeta

A client may send `saveMeta` with an effectively empty `meta`:

```json
{
  "action": "saveMeta",
  "protocolVersion": "1.0",
  "dataPool": 12345,
  "meta": {
    "schemaVersion": 1,
    "lastSyncTime": "2026-05-07T14:32:00Z",
    "buildVersion": "0.1.0",
    "markerSequences": [],
    "midiSequences": [],
    "tempoSequence": null,
    "timecodeHandle": null,
    "preferences": {
      "deleteWarningSuppressed": [],
      "lastUsedPoolStart": 0
    }
  }
}
```

This is valid. Use cases:

- Operator runs a sync that creates nothing (project has no markers,
  no MIDI, the operator declined every diff).
- Operator runs a "reset" action that explicitly clears prior state.

The blob is written normally. The next `info` returns the empty
blob; the MA3 client treats every Reaper marker/MIDI as new on the
next sync.

#### Errors

`saveMeta` may return any framing-level error (§4.3). Verb-specific
errors:

| Code               | When                                                                |
|--------------------|---------------------------------------------------------------------|
| `noProject`        | No Reaper project is open.                                          |
| `projectUnsaved`   | The Reaper project has never been saved (no `.rpp` path on disk). The blob has nowhere to live. |
| `diskWriteFailed`  | I/O error during steps 2–4 of the atomic write protocol. `message` carries the OS error string. |
| `invalidMeta`      | `meta.schemaVersion` is missing or not an integer, or `meta` is not an object. The server does not validate any other field. |

#### Default timeout

2 seconds. Disk I/O is fast on the local filesystem; the blob is
small (single-digit KB).

#### Inheritance from MArkers

`saveMeta` corresponds to MArkers' `saveMeta` verb (`bp` at
MArkersServer_clean.lua:965, walked in SYNC_FLOW.md §6).

| MArkers behaviour                              | ZealSync behaviour                                                                             |
|------------------------------------------------|------------------------------------------------------------------------------------------------|
| MessagePack-encoded blob.                      | JSON, pretty-printed.                                                                           |
| Filename `<song_uuid>-<datapool_int>.dat`.     | Filename `<projectGUID>-<dataPool>.json`.                                                       |
| Subdirectory `MArkers/`.                       | Subdirectory `ZealSync/`.                                                                       |
| Backups in `MArkers/backups/`, no cap.         | Backups in `ZealSync/backups/`, capped at 10 (configurable via ext-state).                      |
| `MATOOLSMARKERSGUID` written to `.rpp` ext-state on every save if it differs from the previous value. | `projectGUID` is written by `info` (§7.1.1), not `saveMeta`. The two concerns are separated. |
| Full state mirror (operator overrides, pool reservations, etc. all in the blob). | Minimal index + cross-cutting UI prefs only. Per-Sequence operator state lives in ZealData (§8). Rationale in this section's prose. |
| Schema is implicit; structural changes are breaking. | Schema is explicit via `schemaVersion`; forward-compat path defined in §7.5.5.                  |

The schema-vs-protocol-version split, the validation contract, the
backup cap, and the minimal-index philosophy are all departures from
MArkers' design. Each is documented inline above.

### §7.6 transport

**Purpose.** Controls Reaper's transport — playback, recording, seek,
zoom, project navigation. The MA3 client invokes these from operator
UI affordances on the desk.

**When called.** Synchronously in response to operator input. Each
verb is a fire-and-confirm — the MA3 client waits for the response
before considering the action complete.

#### Verbs and request shapes

All transport verbs share the framing-level fields (`action`,
`protocolVersion`). None require `dataPool`. Verb-specific request
fields are listed below.

##### Playback control

| Verb          | Request fields                                | Effect                                                                       |
|---------------|-----------------------------------------------|------------------------------------------------------------------------------|
| `play`        | none                                          | `CSurf_OnPlay()`                                                             |
| `pause`       | none                                          | `CSurf_OnPause()`                                                            |
| `stop`        | none                                          | `CSurf_OnStop()` and disable repeat (`GetSetRepeat(0)`)                      |
| `record`      | none                                          | `CSurf_OnRecord()`                                                           |
| `restartSong` | none                                          | Stop, seek to 0, play from start. Equivalent to `Main_OnCommand(40044, 0)`. |

##### Position control

| Verb            | Request fields                                                              | Effect                                                                                                       |
|-----------------|-----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| `seek`          | `seconds` (number, required)                                                | `SetEditCurPos2(0, seconds, true, true)` — seeks to absolute position                                        |
| `skip`          | `seconds` (number, required), `direction` (integer, required, ±1)           | Move cursor by `direction × seconds`, clamped to `[0, projectLength]`                                        |
| `gotoCue`       | `seconds` (number, required), `backtrackBars` (integer, optional, default 1) | Seek to a cue position with a musical run-in. See §7.6.2.                                                    |
| `scrubForward`  | `frames` (integer, optional, default 10)                                    | Move cursor forward by `frames` at the project's frame rate. See §7.6.3.                                     |
| `scrubBackward` | `frames` (integer, optional, default 10)                                    | Move cursor backward by `frames` at the project's frame rate. See §7.6.3.                                    |

##### Loop, repeat, click

| Verb        | Request fields                                              | Effect                                                       |
|-------------|-------------------------------------------------------------|--------------------------------------------------------------|
| `setRepeat` | `enabled` (boolean, required)                               | `GetSetRepeat(enabled ? 1 : 0)`                              |
| `setLoop`   | `start` (number, required), `end` (number, required)        | `GetSet_LoopTimeRange2(0, true, true, start, end, false)`    |
| `setClick`  | `enabled` (boolean, required)                               | `Main_OnCommand(enabled ? 41745 : 41746, 0)` — Reaper metronome |

##### View control

| Verb      | Request fields | Effect                                                |
|-----------|----------------|-------------------------------------------------------|
| `zoomIn`  | none           | `Main_OnCommand(1011, 0)` — Reaper "View: Zoom in"   |
| `zoomOut` | none           | `Main_OnCommand(1012, 0)` — Reaper "View: Zoom out"  |

##### Project navigation

| Verb         | Request fields                                  | Effect                                                                                       |
|--------------|-------------------------------------------------|----------------------------------------------------------------------------------------------|
| `gotoSong`   | `projectName` (string, required)                | Find a `.rpp` matching `projectName` in the current project's directory and open it. See §7.6.4. |

##### Queries

| Verb                | Request fields | Response fields                                                          | Description                                              |
|---------------------|----------------|--------------------------------------------------------------------------|----------------------------------------------------------|
| `getTimeSelection`  | none           | `start` (number), `end` (number), `isEmpty` (boolean)                    | Returns the current REAPER time selection. See §7.6.5.   |

#### §7.6.1 Example requests

Seek:
```json
{
  "action": "seek",
  "protocolVersion": "1.0",
  "seconds": 42.5
}
```

Skip forward 10 seconds:
```json
{
  "action": "skip",
  "protocolVersion": "1.0",
  "seconds": 10.0,
  "direction": 1
}
```

Goto cue with default 1-bar backtrack:
```json
{
  "action": "gotoCue",
  "protocolVersion": "1.0",
  "seconds": 42.5
}
```

Scrub backward by frames:
```json
{
  "action": "scrubBackward",
  "protocolVersion": "1.0",
  "frames": 10
}
```

Goto a different song:
```json
{
  "action": "gotoSong",
  "protocolVersion": "1.0",
  "projectName": "Verse_in_Spring"
}
```

#### §7.6.2 gotoCue and the bar-based backtrack

`gotoCue` seeks to a cue position with a musical run-in — landing
*before* the cue so playback runs into it naturally rather than
snapping onto it. The run-in length is expressed in **bars** at the
cue's tempo and time signature, not in seconds.

The server computes:

1. Look up BPM at `seconds` from the project's tempo map (same
   resolution as `bpmAtPosition` in §7.2).
2. Look up time-signature numerator at `seconds`.
3. `barLengthSeconds = (60 / bpm) × numerator`.
4. `offset = backtrackBars × barLengthSeconds`.
5. Seek to `max(0, seconds - offset)`.

`backtrackBars` defaults to **1** if absent. `0` means snap-to
(seek directly to `seconds` with no run-in). Larger values are
multi-bar run-ins. Negative values are an `outOfRange` error.

**Tempo-change boundary behaviour.** When the run-in window crosses
a tempo change, the server uses the BPM and signature **at the cue
position** for the entire computation. The result is a fixed
multiple of the cue's bar length, regardless of what tempo was in
effect during the run-in itself. This is the naive approach — true
musical bar alignment across tempo changes would require walking
the tempo map backward to find the previous downbeat, which is more
implementation cost than the convenience justifies. In practice the
discrepancy is sub-second and audible only at sharp tempo changes,
which are uncommon in show material.

**Project with no tempo markers.** §7.4.2 guarantees the tempo map
always has at least one entry (synthesised at position 0 if no real
markers exist). `gotoCue` uses that synthesised default, which is
typically 120 BPM in 4/4 — yielding a 2.0-second backtrack for
`backtrackBars = 1`.

**Pre-zero clamping.** If the computed offset would seek before the
project start, the server clamps to 0. The MA3 client receives
`status: done` regardless. The clamp is silent; clients that need
to know whether clamping occurred should compute it themselves.

#### §7.6.3 scrubForward / scrubBackward

These verbs move the cursor by a frame count, where "frame" is
defined by the project's video frame rate (the `frameRate` field
returned by `info` in §7.1).

The server computes:

1. `secondsPerFrame = 1.0 / frameRate`.
2. `delta = frames × secondsPerFrame`.
3. For `scrubForward`: `SetEditCurPos2(0, current + delta, true, true)`,
   clamped to `[0, projectLength]`.
4. For `scrubBackward`: same with `current - delta`.

`frames` defaults to **10** if absent. The default matches the
common ±10-frame nudge used in editing workflows.

**Why two verbs instead of a `direction` flag.** Operator-mental-
model clarity. The MA3 plugin binds two distinct buttons; a single
verb with a direction flag would mean each button-handler builds a
slightly different request body, and the protocol would have to
spell out "frames must be positive, direction is the sign." Two
verbs is one extra row in the dispatch table for substantially
clearer call-site code.

**Why frame-based scrub instead of seconds.** Operators editing to
video think in frames; scrubbing in seconds doesn't align with cut
boundaries. The server has the project frame rate from `info`
already, so the conversion is server-side and authoritative — no
chance of the MA3 client using a stale frame rate after the
operator changes project settings.

#### §7.6.4 gotoSong and project lookup

`gotoSong` opens a different REAPER project from the same directory
as the currently-loaded one. The MA3 plugin sends a `projectName`;
the server resolves it to a path and opens the project.

**Resolution rules:**

1. Read the current project's directory from
   `EnumProjects(-1)` → project path → directory.
2. Look for files matching the request:
   - First, exact filename match: `<dir>/<projectName>.rpp`.
   - If not found, exact filename without extension, accepting
     either `.rpp` or `.RPP`.
   - No recursive search; no fuzzy matching.
3. If a single match is found, open it via
   `Main_openProject("noprompt:<absolute-path>")`.
4. If zero matches, return `error` with code `projectNotFound`.
5. If multiple matches (case-insensitive collisions on
   case-sensitive filesystems), return `error` with code
   `ambiguousProjectName` and list candidates in the message.

The `noprompt:` prefix tells REAPER not to prompt to save the
current project. **The current project's unsaved changes are
silently discarded.** This is a significant behaviour and the
MA3 client should warn the operator before invoking `gotoSong`
when `info`'s `projectPath` is non-empty (a project is loaded).

**Why current-directory only.** The lookup is a workflow
optimisation, not a search engine. Show material is typically
organised one project per song in a single directory; recursive
or root-relative search would invite path-traversal bugs and
operator confusion ("which Verse_in_Spring did it open?"). If
the operator's projects live elsewhere, they save the project
they want into the current directory, or open it manually in
REAPER.

**Restriction.** `gotoSong` will not open a path traversal — any
`projectName` containing path separators (`/`, `\`), `..`, or
absolute paths returns `invalidRequest`. The lookup is filename-
only.

#### §7.6.5 getTimeSelection

`getTimeSelection` returns the current REAPER time selection
(the highlighted time range in the arrange view).

**Response fields:**

```json
{
  "status": "done",
  "start": 12.5,
  "end": 24.0,
  "isEmpty": false
}
```

| Field     | Type    | Notes                                                              |
|-----------|---------|--------------------------------------------------------------------|
| `start`   | number  | Selection start in seconds. From `GetSet_LoopTimeRange2(0, false, false, _, _, false)`. |
| `end`     | number  | Selection end in seconds. From the same call.                      |
| `isEmpty` | boolean | `true` when `start == end` (no active selection).                  |

When `isEmpty` is true, `start` and `end` are equal but their value
is still meaningful — REAPER reports the cursor position as both.
The MA3 client should branch on `isEmpty` rather than comparing
the values.

The MA3 client typically uses this verb to populate a UserVar or
trigger a cue-fade calculation locally; the protocol does not
prescribe what the client does with the result.

#### Response — success

All transport verbs return:

```json
{ "status": "done" }
```

except `getTimeSelection`, which adds the fields described in
§7.6.5.

The MA3 client uses the response as confirmation that the action
reached Reaper. On the operator's UI, transport buttons can show
a "pending" state between request send and response receipt; on a
healthy LAN this is sub-frame and not visible to the operator.

#### Errors

Transport verbs may return any framing-level error (§4.3). Verb-
specific errors:

| Code                   | Verbs                                  | When                                                        |
|------------------------|----------------------------------------|-------------------------------------------------------------|
| `noProject`            | all except `gotoSong`                  | No Reaper project is open.                                  |
| `invalidRequest`       | seek, skip, gotoCue, setLoop, scrubForward, scrubBackward, gotoSong | Required field missing or wrong type. |
| `outOfRange`           | seek                                   | `seconds` is negative or beyond `projectLength`.            |
| `outOfRange`           | setLoop                                | `start >= end`, or either is negative or beyond `projectLength`. |
| `outOfRange`           | gotoCue                                | `seconds` is negative or beyond `projectLength`, or `backtrackBars` is negative. |
| `invalidDirection`     | skip                                   | `direction` is not exactly `1` or `-1`.                     |
| `projectNotFound`      | gotoSong                               | No `.rpp` matches `projectName` in the current project's directory. |
| `ambiguousProjectName` | gotoSong                               | Multiple matches found.                                     |

#### Default timeout

**0.2 seconds** (200 ms) for all transport verbs. Transport actions
must feel instant — a healthy LAN responds in single-digit
milliseconds. The tight timeout ensures that a disconnected or
unreachable Reaper surfaces an error to the operator within one
frame of UI latency, rather than the 2-second protocol default that
would feel like the desk had hung.

`gotoSong` may exceed 200ms because it involves opening a project
file (REAPER load time depends on project size). For `gotoSong` the
default is **3 seconds**. This is the only transport verb with a
non-200ms default.

If the operator's network is genuinely slow enough that 200ms isn't
sufficient for the rest of the verbs, the protocol's per-call
`timeout` override (§3.3) can widen it on a request-by-request
basis. Routine need for this points at a network problem, not a
protocol problem.

#### Inheritance

ZealSync's transport verbs come from two sources:

**From MArkers** (SYNC_FLOW.md §14):
- `play`, `pause`, `stop`, `record`, `seek`, `skip`, `setRepeat`,
  `setLoop`, `setClick` — direct equivalents with renamed fields.

| MArkers field | ZealSync field    | Notes                                              |
|---------------|-------------------|----------------------------------------------------|
| `a67a3ae2`    | `seconds` (seek)  | Renamed.                                           |
| `a3ebc518`    | `seconds` (skip)  | Renamed.                                           |
| `a6968c76`    | `direction`       | Renamed; same ±1 contract.                         |
| `ad2ce7f1`    | `enabled`         | Renamed; was used by setRepeat, setClick, setAutoSync. |
| `ac40ed7a`    | `start` (setLoop) | Renamed.                                           |
| `a7f91941`    | `end` (setLoop)   | Renamed.                                           |

Dropped MArkers transport verbs:
- `SetAutoSync` — auto-sync is out of scope per /CLAUDE.md.
- `startArtnetTimecode` / `stopArtnetTimecode` — Artnet TC streaming
  is out of scope.
- `saveTimecodeOffset` — ZealSync does not modify the .rpp file.
- `openProject`, `isProjectDirty`, `saveProject` — superseded by
  `gotoSong` (which opens by name) and the MA3 client's pre-flight
  check for `projectPath` presence in `info`.
- `StartOBS` / `StopOBS` — OBS integration is out of scope.

**From the existing ZealServer transport extension:**
- `restartSong` — was `PlayFromStart` over UDP.
- `zoomIn` / `zoomOut` — were UDP commands.
- `gotoCue` — was `GotoCue <seconds-2>` literal command. The
  hardcoded 2-second backtrack is replaced with the configurable
  bar-based mechanism in §7.6.2.
- `gotoSong` — was `RS_FIND_PROJECT {"projectName":"..."}`.
- `getTimeSelection` — replaces `TimeSelectionToCueFade`'s
  protocol portion. The MA3-side UserVar write (`$TimeSelection`)
  is not part of the wire protocol; the MA3 client implements it
  on top of `getTimeSelection`.

Behavioural differences:
- ZealServer used UDP fire-and-forget for several transport verbs
  (`RestartSong`, `ZoomIn`/`ZoomOut`, raw passthrough). ZealSync
  uses TCP request/response for everything. Rationale: the
  "instant feedback when disconnected" requirement requires
  knowing whether the request landed, which UDP cannot provide.
  The 200ms timeout makes TCP-per-request fast enough on a healthy
  LAN that operators don't perceive the difference.
- ZealServer had a generic raw-command passthrough (`anything else
  → UDP literal`). ZealSync drops this entirely. The closed verb
  set is the contract; commands the protocol doesn't model are
  added by extending §7.6, not by passthrough.
- ZealServer's `GotoCue` hardcoded a 2-second backtrack. ZealSync
  replaces this with `backtrackBars` at the cue's BPM/signature.
  The default of 1 bar approximates 2 seconds at 120 BPM in 4/4
  (the most common case) but adapts correctly for other tempos.
- The MA3-side macro fired 0.3s after `GotoCue` ("Off Page Hits")
  is not part of the wire protocol. The MA3 client implements
  this locally — it sends `gotoCue`, awaits response, yields
  300ms, fires the macro.

## §8 ZealData format (cross-sync identity)

The ZealData format is how ZealSync identifies its own MA3 objects
across sync runs. Every Sequence and Timecode object created or
reconciled by ZealSync carries a ZealData blob in its Note property.
On every sync, the MA3 client walks Notes to recover identity —
answering questions like "is this Sequence the one I created last
time for color X?" without trusting any external state.

The on-disk `savedMeta` blob from §7.5 is a fast lookup index. The
ZealData blob on each MA3 object is the **truth**. When they
disagree, ZealData wins.

### §8.1 Wrapping syntax

A ZealSync record in an MA3 Note property is a single line of the
form:

```
ZealData'<base64>'
```

Where `<base64>` is the standard base64 encoding (RFC 4648, no
URL-safe substitutions, padding included) of a UTF-8 JSON object —
the record body, defined in §8.2 and §8.3.

The `<base64>` capture matches the longest run of base64-alphabet
characters (A–Z, a–z, 0–9, +, /, =) up to but not including the
closing `'`. The closing `'` is not part of the capture.
Implementations must use a non-greedy or character-class-bounded
match — never greedy `.*` — to avoid spanning multiple `ZealData`
records when more than one is present in a single Note property.

The envelope `ZealData'...'` is Zeal's company convention for
machine-readable data stamped into MA3 Note properties. Multiple
Zeal tools may share this envelope in the future (e.g. a separate
ZealSync sub-product, or other Zeal MA3 plugins) — the `namespace`
field inside the JSON discriminates which tool wrote each record.
A parser walks every `ZealData'...'` block in a Note property,
decodes each, and dispatches based on `namespace`.

The base64 wrapping is intentional: it makes the blob unreadable
in the MA3 Note column, signals "machine data, do not edit," and
prevents accidental corruption from operator-typed content. There
is no encryption or obfuscation beyond base64 — anyone who needs
to inspect a blob can decode it trivially. The unreadability is
for operator UX, not for security.

A Note property may contain blobs from non-Zeal tools (notably
MArkers' `MTdata'...'` format). ZealSync's parser ignores any
envelope that is not `ZealData'...'`. Conversely, MArkers and other
foreign tools will not recognise `ZealData'...'`, so the two
co-exist cleanly without parsing each other's content.

### §8.2 Record body — common envelope

Every ZealData record JSON has the same outer envelope:

```json
{
  "namespace": "ZealSync",
  "schemaVersion": 1,
  "type": "<record-type>",
  "identity": { ... },
  "preferences": { ... }
}
```

| Field           | Type    | Required | Notes                                                                              |
|-----------------|---------|----------|------------------------------------------------------------------------------------|
| `namespace`     | string  | yes      | Always literal `"ZealSync"` for v1. Reserved for future Zeal sub-products that share the `ZealData` envelope. The parser's filter key. |
| `schemaVersion` | integer | yes      | Schema version of this record. Currently `1`. See §8.5.                            |
| `type`          | string  | yes      | One of `"timecode"`, `"markerSequence"`, `"midiSequence"`, `"tempoSequence"`. See §8.3. |
| `identity`      | object  | yes      | Recovery key for this record's MA3 object. Per-type fields in §8.3.                |
| `preferences`   | object  | optional | Per-object operator state. Per-type fields in §8.4. May be absent on first stamp; readers default to empty object. |

Records may carry additional top-level keys beyond the five above.
Readers preserve unknown top-level fields verbatim — the write path
round-trips them unchanged. This keeps forward-compatibility with
future ZealData additions cheap.

### §8.3 Record types

Four record types in v1.

#### §8.3.1 `timecode` — the project Timecode pool object

Stamped on the single Timecode pool object that drives playback for
a ZealSync-synced project. The Timecode object is created on first
sync; on subsequent syncs the client recovers it via this stamp.

```json
{
  "namespace": "ZealSync",
  "schemaVersion": 1,
  "type": "timecode",
  "identity": {
    "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7"
  },
  "preferences": {}
}
```

| identity field  | Type   | Notes                                                              |
|-----------------|--------|--------------------------------------------------------------------|
| `projectGUID`   | string | The 32-char lowercase hex GUID from §7.1.1. Recovers project↔Timecode mapping. |

The Timecode object's children (TrackGroups, Tracks, CmdEvents) are
not stamped. They are identified by name and parent — e.g. the
Markers TrackGroup is the child of the Timecode named `"Markers"`,
the Red color Track is the child of that TrackGroup whose name
matches the operator-friendly color label. This naming-based
recovery is faster than walking Notes for objects that are
deterministically named.

#### §8.3.2 `markerSequence` — per-color marker Sequence

Stamped on each MA3 Sequence created for a unique marker color in
the project.

```json
{
  "namespace": "ZealSync",
  "schemaVersion": 1,
  "type": "markerSequence",
  "identity": {
    "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7",
    "color": 16711680
  },
  "preferences": {
    "deleteWarningSuppressed": false
  }
}
```

| identity field  | Type    | Notes                                                              |
|-----------------|---------|--------------------------------------------------------------------|
| `projectGUID`   | string  | Project this Sequence belongs to.                                  |
| `color`         | integer | 24-bit RGB integer (same encoding as §7.2 marker `color`).         |

The `(projectGUID, color)` tuple is the identity key.

#### §8.3.3 `midiSequence` — per-(track, channel, note) MIDI Sequence

Stamped on each MA3 Sequence created for a named MIDI note on a
REAPER track.

```json
{
  "namespace": "ZealSync",
  "schemaVersion": 1,
  "type": "midiSequence",
  "identity": {
    "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7",
    "trackGUID": "c8d4f2e1a9b3c5d7e0f2a4b6c8d0e2f4",
    "channel": 0,
    "noteNumber": 36
  },
  "preferences": {
    "deleteWarningSuppressed": false
  }
}
```

| identity field  | Type    | Notes                                                              |
|-----------------|---------|--------------------------------------------------------------------|
| `projectGUID`   | string  | Project this Sequence belongs to.                                  |
| `trackGUID`     | string  | REAPER track GUID (same encoding as §7.3 `guid`).                  |
| `channel`       | integer | MIDI channel 0–15. Always `0` in v1; field present for forward-compat (see §7.3.6). |
| `noteNumber`    | integer | MIDI note number 0–127.                                            |

The `(projectGUID, trackGUID, channel, noteNumber)` tuple is the
identity key. All four fields are required for unique recovery.

#### §8.3.4 `tempoSequence` — the project Tempo Sequence

Stamped on the single Tempo Sequence created for a project.

```json
{
  "namespace": "ZealSync",
  "schemaVersion": 1,
  "type": "tempoSequence",
  "identity": {
    "projectGUID": "8e7c4a01b3d24f1e9b0a51f6e2c4d8a7"
  },
  "preferences": {}
}
```

| identity field  | Type    | Notes                                                              |
|-----------------|---------|--------------------------------------------------------------------|
| `projectGUID`   | string  | Project this Tempo Sequence belongs to.                            |

### §8.4 Preferences sections

The `preferences` object on each record carries per-object operator
state that doesn't have a natural other home. The rationale for
splitting per-object preferences (here) from cross-cutting
preferences (in `savedMeta`, §7.5.3) is in §7.5: per-object state
travels with the object across show-file imports; cross-cutting
state is desk-local and resets on import.

v1 preference fields are minimal:

| Record type        | Preferences field          | Type    | Default | Notes                                                              |
|--------------------|----------------------------|---------|---------|--------------------------------------------------------------------|
| `markerSequence`   | `deleteWarningSuppressed`  | boolean | `false` | Operator clicked "Don't show again" on the orphan-cue dialog for this Sequence. |
| `midiSequence`     | `deleteWarningSuppressed`  | boolean | `false` | Same.                                                              |
| `timecode`         | (none in v1)               | —       | —       | `preferences` object is empty. Reserved for future use.            |
| `tempoSequence`    | (none in v1)               | —       | —       | Same.                                                              |

Adding new preference fields to a record type is a non-breaking
change. Old clients that don't recognise a field round-trip it
unchanged on the next write. Removing a preference field is also
non-breaking from a parser perspective but loses operator state;
treat as a schema migration if it ever comes up.

### §8.5 Schema versioning

Each record's `schemaVersion` field is independent of the
wire-protocol version (§10) and the `savedMeta` blob's
`schemaVersion` (§7.5.5). It governs the structure of one ZealData
record on one MA3 object.

- **v1** — the structure documented above.

Forward-compatibility rules mirror §7.5.5:

- A reader encountering `schemaVersion` higher than its supported
  max logs a warning, reads the v1 fields it knows about, preserves
  unknown fields verbatim, and writes them back unchanged on the
  next stamp.
- A reader encountering `schemaVersion` equal to its supported max
  reads normally.
- A reader encountering `schemaVersion` lower than its supported
  max reads using the older schema's rules and upgrades on next
  stamp (the upgrade is the natural consequence of the writer
  always writing the current schema).

In v1, the version check is informational. The first
forward-incompatible change bumps to v2 and adds the read-path
branch above.

### §8.6 Adding new record types

Adding a new record type is a non-breaking change. Old clients
encountering an unknown `type` value within a `ZealData'...'` blob
treat the record as foreign — they ignore it, they do not
mis-dispatch, they do not corrupt it on round-trip if they happen
to rewrite the same Note property.

Future ZealSync versions may add record types for:
- MA3 Page reconciliation
- MA3 Appearance reconciliation
- Per-Track operator preferences
- Other MA3 object kinds we don't currently sync

New types do not require a wire-protocol version bump or an
existing-type schema bump. They land additively and old clients
remain compatible — they just don't see the new objects' identity
data.

This is the safety valve. v1 ships with four record types because
those are the four objects we create. The instinct to "add records
preemptively for parity with prior tools" should be resisted —
each record type is a parser branch, a writer branch, a test
surface, and a schema migration path forever. Add when the use
case appears.

### §8.7 Read contract

When the MA3 client needs to recover identity for a Sequence or
Timecode object, the algorithm is:

1. Read the object's Note property as a single string.
2. Find every substring matching `/ZealData'([A-Za-z0-9+/=]+)'/g`.
3. For each match:
   a. Base64-decode the captured group.
   b. Parse the result as UTF-8 JSON.
   c. If parse fails, skip silently (corrupted or foreign data).
   d. If the parsed object's `namespace` is not `"ZealSync"`,
      skip (foreign Zeal sub-product).
   e. If the parsed object's `type` is not one this client
      recognises, skip (newer schema, see §8.6).
   f. Otherwise, the record is ours — return it.
4. If no matching record is found, the object is not a ZealSync
   object (or its blob has been deleted by the operator —
   §8.9).

The parser must be tolerant of:
- Operator-typed content above, below, or alongside ZealData
  blobs in the Note property.
- Multiple ZealData blobs on the same object (§8.8).
- Foreign blobs in unrelated envelopes (notably MArkers'
  `MTdata'...'`).
- Whitespace and line breaks around the `ZealData'...'`
  envelope.

Skip-silently for unrecognised content. Errors during parse are
not fatal — they just mean "this isn't our blob, move on."

### §8.8 Write contract

When the MA3 client stamps identity onto a Sequence or Timecode
object, the algorithm is:

1. Build the JSON record per §8.2 and §8.3.
2. Base64-encode the UTF-8 JSON.
3. Wrap as `ZealData'<base64>'`.
4. Read the object's existing Note property.
5. Locate any prior ZealData blob whose `type` matches the new
   one (only one such record can exist per type per object — the
   contract is one record per type, not multiple).
6. If a prior matching blob exists, replace it in-place with the
   new envelope. The string operation is a `gsub` on the
   `ZealData'<old-base64>'` pattern.
7. If no prior matching blob exists, append the new envelope on
   its own line at the end of the Note property.
8. Write the modified Note back to the MA3 object.

Foreign blobs (other Zeal sub-products, MArkers, anything else)
are preserved unchanged. Operator-typed content is preserved
unchanged. Only the matching ZealData record is touched.

A single Note property may carry multiple ZealData records of
different types — e.g. a hypothetical future where a Sequence is
stamped with both `markerSequence` (identity) and `someOtherType`
(some new concern). v1 stamps at most one record per object
because the four types map to disjoint object kinds (a Sequence is
either marker, MIDI, or tempo — not multiple).

### §8.9 Operator interactions and edge cases

The Note property is operator-visible and operator-writable. The
parser must be defensive about operator interactions:

**Operator deletes the ZealData blob.** Next sync finds no matching
record on the object. The MA3 client treats this as "object exists
but identity is lost" — matches MArkers' orphan flow. The operator
is prompted on the next sync: "this Sequence appears to be
unmanaged. Re-stamp it as <colour>'s marker Sequence, or leave it
alone?"

**Operator copy-pastes a Sequence.** The new copy carries the
original's ZealData blob, creating two MA3 Sequences with
identical identity keys. On next sync the client detects the
duplicate (during savedMeta validation, §7.5.6, or during
walk-Notes recovery). The resolution: warn the operator, keep
the Sequence at the savedMeta-recorded handle as authoritative,
re-stamp the duplicate with a fresh identity (or, more likely,
prompt the operator to delete the duplicate). The exact UX is
the MA3 client's responsibility — but the protocol guarantees
the client will detect the collision via the duplicate-key check.

**Operator types content alongside the blob.** Preserved
unchanged on next stamp (§8.8 step 7 only touches matching
ZealData blobs).

**Operator manually edits the base64 inside a blob.** Parse fails
silently (§8.7 step 3c), record is treated as foreign and
skipped. Next stamp re-creates a valid record alongside the
broken one (the broken one isn't matched by the gsub in §8.8
step 6, so it's left alone). The MA3 client sees no record on
read, prompts re-stamp, succeeds. The broken blob remains as
operator-visible junk until they delete it manually. Acceptable;
documenting so future-us knows this is the failure mode.

**Operator drags a Sequence to a different DataPool.** Out of
scope for v1. The blob carries `projectGUID` but not `dataPool` —
moving across DataPools is undefined behaviour. Document and
move on; revisit if it becomes a real workflow.

Operator-edited fields that produce syntactically-valid but
semantically-incorrect records (e.g. an operator changes
`"color": 16711680` to `"color": 65280` in a `markerSequence`
identity block) parse normally and dispatch normally, but surface
during reconciliation as identity collisions or as Sequences without
matching Reaper sources. Detection and healing follow the same flow
as the copy-paste collision case.

### §8.10 Inheritance from MArkers

`ZealData` corresponds in concept to MArkers' `MTdata'...'` format
(SYNC_FLOW.md §9). Differences:

| MArkers behaviour                                  | ZealSync behaviour                                                                             |
|----------------------------------------------------|------------------------------------------------------------------------------------------------|
| Envelope `MTdata'<base64>'` ("MT" = MATools).      | Envelope `ZealData'<base64>'`. Different company, different envelope.                          |
| Caesar +5 byte shift before base64 encoding.       | No Caesar shift. Plain base64 of plain JSON.                                                   |
| Hash-obfuscated JSON keys (`adb67544`, `aa3d5d76`, `ac02a53d`, etc.). | Readable JSON keys (`namespace`, `type`, `identity`, etc.).                                    |
| Seven record types: `Timecode`, `PlaceholderSeq`, `MarkerSequence`, `MidiSequence`, `TempoSeq`, (unclear), `MIDITrack`. | Four record types: `timecode`, `markerSequence`, `midiSequence`, `tempoSequence`. Rationale in §8.6. |
| Schema version implicit; structural changes are breaking. | Schema version explicit per record via `schemaVersion`. Forward-compat path defined in §8.5.   |
| Records intermixed in flat JSON; no `identity`/`preferences` separation. | Structured envelope with `identity` (recovery key) and `preferences` (operator state) sections. |
| MArkers and ZealSync blobs co-exist on the same Note property without parser collision. | Same — different envelopes, ignored on each side.                                              |

The Caesar shift in MArkers was unhelpful obfuscation — it
prevented operator inspection without providing security. ZealData
drops it. The hash-named keys in MArkers were similarly
obfuscation-by-accident (artifact of the build process). ZealData
uses readable keys; the schema is the spec, not a puzzle.

### §8.11 Cross-references

- `savedMeta` blob structure: §7.5.
- `projectGUID` derivation: §7.1.1.
- `color` encoding: §7.2.3.
- `trackGUID` encoding: §7.3.
- `channel` field rationale: §7.3.6.
- Validation contract (blob-vs-ZealData reconciliation): §7.5.6.
- Schema versioning rules: §7.5.5 (this section's §8.5 mirrors).

## §9 Reserved

## §10 Versioning

ZealSync carries three independent version axes. Each governs a
different lifecycle and bumps for different reasons.

### §10.1 The three version axes

| Axis              | Where it lives                                              | What it governs                                                 | Bumped when                                                                          |
|-------------------|-------------------------------------------------------------|------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Protocol version  | `protocolVersion` on every request and response             | Wire format — framing, envelopes, verb shapes, error codes.     | An incompatible wire change ships. Both halves must match (§10.3).                   |
| Build version     | `buildVersion` on `info` response (server) and in MA3 plugin self-report (client) | Informational. Identifies the binary running on each side. Surfaced in UI for support. | Every release. Independent on each half.                                             |
| Schema version    | `schemaVersion` on each persisted blob (savedMeta records, ZealData records) | Structure of one persisted blob's body.                          | An incompatible schema change ships. Per-blob-type, not protocol-wide.              |

These axes are deliberately independent. A wire-format change does
not force a re-stamp of every persisted blob. A persisted-blob schema
change does not force a wire bump. A bugfix release of either half
bumps build version only.

### §10.2 Version format

All three axes use **semantic versioning**: `MAJOR.MINOR.PATCH` for
strings, single integer for `schemaVersion`.

For protocol and build:
- **MAJOR** bumps on incompatible changes.
- **MINOR** bumps on backward-compatible additions.
- **PATCH** bumps on bugfixes that change neither shape nor behaviour.

For `schemaVersion`:
- A single monotonically-increasing integer. There is no minor/patch
  distinction — schema changes are either compatible (handled
  internally per §7.5.5 and §8.5) or they bump the integer.

The current versions at v1 launch:

| Axis              | Current value      |
|-------------------|--------------------|
| Protocol version  | `"1.0"`            |
| Build version     | `"0.1.0"` (both halves; pre-1.0 development) |
| `savedMeta` schema version | `1`           |
| ZealData record schema version | `1`        |

### §10.3 Protocol version compatibility

The protocol version is enforced. Both halves must agree.

**On every request:** The client sends `protocolVersion`. The server
parses it, compares against its own supported protocol version, and:

- If equal, processes normally.
- If different, returns the `protocolVersionMismatch` error (§4.3)
  with both versions in the message.

**Compatibility rule:** Equal MAJOR.MINOR is compatible. PATCH
differences are tolerated (a `1.0.1` server accepts a `1.0.0` client
and vice versa). MAJOR or MINOR mismatches fail closed.

The strict major-and-minor match is intentional. Internal tools with
two halves on the show machine should never silently work in degraded
mode — if the protocol drifts, the operator sees a clear error and
updates one side. There is no negotiation, no fallback, no graceful
downgrade.

**When to bump:**

- **PATCH** (`1.0.0` → `1.0.1`): Bugfix that doesn't change any
  request or response shape. Example: server fixes a tempo-map walk
  bug that was returning slightly wrong `bpmAtPosition` values.
- **MINOR** (`1.0.0` → `1.1.0`): Backward-compatible addition.
  Example: new optional field in a request, new verb that old
  clients don't know about, additional response field that old
  clients ignore. Old clients on `1.0` still talk to a `1.1` server
  using only the v1.0 surface.
- **MAJOR** (`1.0.0` → `2.0.0`): Incompatible change. Example: a
  required field renamed, a verb's response shape restructured, a
  field type changed (integer → string). Old clients break. Both
  halves coordinate the bump.

The MINOR-as-additive rule is what makes the protocol genuinely
extensible. New verbs land on MINOR bumps. New optional fields land
on MINOR bumps. Old clients continue working unchanged. The pressure
to bump MAJOR only arises from genuine incompatibility — which
should be rare in a designed-for-extensibility protocol.

### §10.4 Build version

`buildVersion` is informational. Neither half gates on the other's
build version.

**Why it exists:** Support diagnostics. When an operator reports a
sync misbehaviour, the first question is "what versions are you
running on each side?" The build versions answer this: the MA3 plugin
displays its own and the server's (from `info`'s `buildVersion`) in
the Setup dialog.

**Why it doesn't gate:** The protocol version already gates
compatibility. Adding a build-version gate would force lock-step
deploys on bugfix releases, which is exactly what we want to avoid —
shipping a server-side bugfix as `0.1.1 → 0.1.2` should be
zero-friction for any MA3 plugin running `0.1.0` or `0.1.1`.

The MA3 plugin and the C++ extension version their build numbers
independently. Build versions can drift freely; only the protocol
version must match.

### §10.5 Persisted schema versioning

Two independent schema axes:

**`savedMeta.schemaVersion`** (§7.5.5) — governs the structure of the
on-disk per-DataPool blob.

**ZealData record `schemaVersion`** (§8.5) — governs the structure of
each individual record stamped on an MA3 object.

Both follow the same forward-compatibility pattern:

1. Reader encounters a higher `schemaVersion` than it knows how to
   parse: log a warning, read the v1 fields it recognises, preserve
   unknown fields verbatim, write them back unchanged on the next
   stamp.
2. Reader encounters its own `schemaVersion`: read normally.
3. Reader encounters a lower `schemaVersion`: read using the older
   schema's rules; the next write upgrades to current schema (the
   upgrade is the natural consequence of always writing the current
   schema).

The "preserve unknown fields verbatim" rule is what makes mixed-
version operation safe. An operator running ZealSync v1 on one show
file and ZealSync v2 on another will have v1-schema blobs and
v2-schema blobs co-existing on the same desk. Each is read by its
own writer-version and round-trips unchanged through the other.

**When to bump schemaVersion:**

- **Adding a new field**: do *not* bump. Old readers ignore the
  field; new readers populate it.
- **Removing a field**: do *not* bump. Old readers round-trip the
  field; new readers ignore it.
- **Changing a field's meaning, type, or required-ness**: bump.
  Old readers would misinterpret the field; explicit version
  negotiation needed.
- **Restructuring the record envelope** (e.g. moving fields between
  `identity` and `preferences`): bump.

The schemaVersion bump is rare in well-designed schemas. Most
evolution is additive and lives within the existing version. Bumps
are for the genuinely incompatible cases that can't be handled by
defensive parsing.

### §10.6 Coordinating bumps across axes

The three axes drift independently in normal operation. Coordination
only matters when a single change touches multiple axes:

| Change                                              | Axes affected                         |
|-----------------------------------------------------|---------------------------------------|
| Bugfix in tempo-map walk, no shape change.          | Build version only.                   |
| New optional field on `markers` response.           | Protocol MINOR (response addition).   |
| New verb (e.g. `setTimecodeOffset`).                | Protocol MINOR.                       |
| Required field renamed in `info` response.          | Protocol MAJOR.                       |
| New preference field in `markerSequence`.           | None — additive within current schema.|
| `markerSequence.identity.color` changes encoding.   | ZealData schema MAJOR (bump to v2).   |
| `savedMeta.markerSequences` becomes a dict not array. | savedMeta schema MAJOR (bump to v2). |
| All of the above in one release.                    | Protocol MAJOR + ZealData v2 + savedMeta v2 + build version. Coordinate as a single release; document migration in release notes. |

**Migration documentation.** Any MAJOR or schema bump must include
release notes describing what changed and what operators need to do.
The default migration story is "update both halves to the same
release." For schema bumps, the default is "old blobs auto-upgrade
on next sync; backups are kept per §7.5.4." If a release ever
needs operator action beyond "update both halves," the release notes
say so explicitly.

### §10.7 v1 commitments

ZealSync v1 ships with:

- **Protocol version `"1.0"`**, with the verbs and shapes documented
  in §7.
- **savedMeta schema version `1`**, with the structure in §7.5.
- **ZealData record schema version `1`** for all four record types
  in §8.3.

Within v1's lifetime (until any of the three axes bumps a major or
the schemaVersion increments), all changes are additive:

- New optional fields on existing requests, responses, savedMeta,
  and ZealData records.
- New verbs.
- New ZealData record types.
- New preference fields.

Anything that requires changing the meaning, type, required-ness,
or structure of an existing field triggers the appropriate bump.

### §10.8 Pre-1.0 development

During the M0–M7 build, both halves are at build version `0.x.y`.
The protocol version stays at `"1.0"` throughout — the protocol is
designed once and built against; we don't ship multiple protocol
versions during initial development.

The first public release (when ZealServer is retired and ZealSync
takes over transport in production) bumps build version to `1.0.0`.
This is independent of the protocol version, which has been `"1.0"`
since the spec was written.

If a protocol change becomes necessary mid-development (e.g. we
discover a fundamental flaw during M3 that requires reshaping the
markers response), we revise the spec in place — no version bump,
because nothing has been deployed. Once the first production
release ships, the protocol version is locked and any future
changes follow §10.6.

### §10.9 Inheritance from MArkers

MArkers conflated the protocol version and build version into a
single `afd0469a` field (the literal string `"2.2.0.0"` — see
SYNC_FLOW.md §5). Any release that touched the wire AND any release
that didn't both bumped this single value, forcing lock-step deploys
on bugfix patches.

ZealSync splits these axes (§10.4 rationale). MArkers also had no
explicit schema version on its persisted MTdata blobs or per-DataPool
.dat files — structural changes to either were implicitly breaking.
ZealSync makes both schema versions explicit (§10.5) so future
schema evolution doesn't require a wire bump.

The strict major-and-minor match for protocol versions (§10.3) is
the same hard-fail behaviour MArkers had — it's the right behaviour
for an internal tool with two halves on the show machine. We just
make it apply to a narrower axis (protocol only, not build).
