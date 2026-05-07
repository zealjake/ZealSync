# MATools UI Probe Report

## 1. Probe status

- **Bridge**: `ClaudeBridge` — connected and armed.
- **MA3 version**: `2.3.2.0` (via `Version()`).
- **Probe method**: read-only via `ma3_eval`. No `ma3_cmd` dispatched. No clicks performed. No state modified.
- **Host plugin**: the visible window is owned by pool plugin **slot 10 — "MArkersLIVE"** (every interactive control reports `PluginComponent = Plugin 10.1`; the dialog chrome reports `Menu 540.2`). The plugin itself is an obfuscated MATools distribution — no installed source file was read, so **plugin version is not detectable** from the probe.
- Note: the MA3 pool contains an entry at slot 1 named **`MATools >>`**. It has no code, no filename, 712 bytes, zero children — it is a pool divider/placeholder only. The window observed here is **not** that plugin; the `>>` suffix is just a submenu-style label. Window titlebar text confirms the active plugin: `MATools - MArkersLIVE`.

## 2. UI tree

Only one modal dialog was open during the probe. It lives on **Display 2, ModalOverlay, index 3**. Scrollbars and layout rows/columns omitted.

```
BaseInput  MArkersImportWindow                  (modal dialog, 1750 × 1335)
├── ModalPlaceholder  ModalOverlay              (inner modal host)
├── PopupPlaceholder  PopupOverlay              (for dropdowns/popovers)
├── TitleBar  TitleBar 5
│   ├── TitleButton  Title                      text = "MATools - MArkersLIVE"
│   ├── Button  Button 4                        (unlabeled; titlebar-side plugin button — likely info/help)
│   └── CloseButton  CloseButton 5
└── DialogFrame  DialogFrame 6
    ├── UILayoutGrid  (top header strip)
    │   ├── UIObject                            text = "Reaper Project: Fiction_TakeCare"
    │   ├── UIObject                            (spacer, empty)
    │   └── UILayoutGrid  (legend row)
    │       ├── UILayoutGrid
    │       │   ├── UIObject                    text = "Sequences"
    │       │   ├── UIObject                    text = "Color key:"
    │       │   └── UILayoutGrid                (three color-key swatches)
    │       │       ├── UIObject                text = "New item"
    │       │       ├── UIObject                text = "Saved item"
    │       │       └── UIObject                text = "Existing item"
    │       └── UIObject                        text = "Pages"
    │
    ├── UILayoutGrid  (main body — two columns)
    │   ├── UILayoutGrid  (LEFT: Sequences panel, 1291 px wide)
    │   │   ├── UILayoutGrid  (column-header row)
    │   │   │   ├── TitleButton  Title
    │   │   │   ├── UIObject                    text = "Timecode"
    │   │   │   ├── LineEdit  LineEdit 5        content = "2"     (header-level default; purpose unlabeled)
    │   │   │   ├── LineEdit  LineEdit 6        content = "-7"    (header-level default; purpose unlabeled)
    │   │   │   └── Button    Button 7          text = "Generate Waveform"
    │   │   ├── ScrollContainer → ScrollBox → UILayoutGrid  (sequence rows — see row template below)
    │   │   └── UIObject                        text = "Sequences"
    │   │       └── SwipeButton                 text = "Filter Sequences"  (name is GUID; opens PopupOverlay)
    │   │
    │   └── ScrollContainer  (RIGHT: Pages panel, 430 px wide)
    │       └── ScrollBox → UILayoutGrid
    │           ├── row: TitleButton + UIObject "Fiction_TakeCare" + LineEdit content="1"
    │           ├── row: TitleButton + UIObject "MIDI - Track"     + LineEdit content="1"
    │           └── row: TitleButton + UIObject "MIDI - Track"     + LineEdit content="1"
    │
    ├── UIObject                                (thin separator strip, 9 px tall)
    │
    ├── UILayoutGrid  (bottom options row)
    │   ├── LineEdit  LineEdit 3                content = "1"     (purpose unlabeled)
    │   ├── LineEdit  LineEdit 4                content = ""      (purpose unlabeled)
    │   └── CheckBox  CheckBox 5                text = "Assign Sequences to Page"  (state not readable)
    │
    └── UILayoutGrid  (action button row)
        ├── Button  Button 3                    text = "Cancel"
        └── Button  Button 4                    text = "Continue"
```

### Sequence row template (repeats per Reaper track)

Every row in the Sequences scroll list shares the same schema. Columns observed, left to right:

| Column | Class | Example value | Notes |
|---|---|---|---|
| Icon | `TitleButton` `SeqIcon_N` | — | small icon/swatch; likely colour-key indicator |
| Name | `UIObject` | `3rdSnare_Fiction_TakeCare` | Reaper track name |
| (unlabeled #) | `LineEdit` | `2` | editable; values run 2,3,4,5,… across rows — reads like a sequence-number column |
| Offset | `LineEdit` (label "Offset") | `0` | editable |
| Total | `UIObject` (label "Total") | `-7 f` | computed/read-only display |
| Steps | `LineEdit` `SeqStartCue_N` (label "Steps") | `1` | **disabled** |
| Off Delay | `LineEdit` `SeqTokenTime_N` (label "Off Delay") | `0.1` | **disabled** |
| Note Type | `Button` `SeqToken_N` (label "Note Type") | `Top/Release` | enabled; likely a toggle/cycle |
| (selected) | `CheckBox` `SeqSelected_N` | — | **disabled** |

Rows observed in the current scroll viewport: **11** (SeqIcon_1 … SeqIcon_11). The scroll list may contain more below the fold; the probe did not scroll.

Tracks seen (in order):
1. 3rdSnare_Fiction_TakeCare
2. SecondSnare_Fiction_TakeCare
3. Piano2_Fiction_TakeCare
4. PianoNoise_Fiction_TakeCare
5. Mid8TomCLonks_Fiction_TakeCare
6. ChillSnare_Fiction_TakeCare
7. BigSnare_Fiction_TakeCare
8. RndTom_Fiction_TakeCare
9. SnareWithRattle_Fiction_TakeCare
10. SnareSample_Fiction_TakeCare
11. SoftKick_Fiction_TakeCare

## 3. Element inventory (interactive elements only)

Chrome and header-label `UIObject`s are omitted from this table. `PluginComponent` is `Plugin 10.1` (MArkersLIVE) for every plugin-owned control, and `Menu 540.2` for MA3-native chrome.

| # | Class | Name | Text / Content | Enabled | Location | Owner |
|---|---|---|---|---|---|---|
| 1 | `CloseButton` | CloseButton 5 | — | yes | TitleBar | Menu 540.2 |
| 2 | `Button` | Button 4 | — (unlabeled) | yes | TitleBar | Plugin 10.1 |
| 3 | `TitleButton` | Title | "MATools - MArkersLIVE" | yes | TitleBar | Menu 540.2 |
| 4 | `LineEdit` | LineEdit 5 (header) | "2" | yes | Sequences header row | Plugin 10.1 |
| 5 | `LineEdit` | LineEdit 6 (header) | "-7" | yes | Sequences header row | Plugin 10.1 |
| 6 | `Button` | Button 7 | "Generate Waveform" | yes | Sequences header row | Plugin 10.1 |
| 7 | `SwipeButton` | 76e60ef8-dd86-4723-9ff2-abe5f6035f28 | "Filter Sequences" | yes | Below sequence list (has `PopupOverlay`) | Plugin 10.1 |
| 8..N | `TitleButton` | SeqIcon_1 … SeqIcon_11 | — | yes | Per sequence row | Plugin 10.1 |
| 8..N | `LineEdit` | LineEdit {5,14,23,32,41,50,59,68,77,86,95} | "2","3","4",…,"12" | yes | Per sequence row, col "#" | Plugin 10.1 |
| 8..N | `LineEdit` | LineEdit {6,15,24,33,42,51,60,69,78,87,96} | "0" | yes | Per sequence row, col "Offset" | Plugin 10.1 |
| 8..N | `LineEdit` | SeqStartCue_1 … SeqStartCue_11 | "1" | **no** | Per sequence row, col "Steps" | Plugin 10.1 |
| 8..N | `LineEdit` | SeqTokenTime_1 … SeqTokenTime_11 | "0.1" | **no** | Per sequence row, col "Off Delay" | Plugin 10.1 |
| 8..N | `Button` | SeqToken_1 … SeqToken_11 | "Top/Release" | yes | Per sequence row, col "Note Type" | Plugin 10.1 |
| 8..N | `CheckBox` | SeqSelected_1 … SeqSelected_11 | — | **no** | Per sequence row | Plugin 10.1 |
| P1 | `TitleButton` | Title | — | yes | Pages row 1 | Plugin 10.1 |
| P1 | `LineEdit` | LineEdit 5 (Pages) | "1" | yes | Pages row 1 ("Fiction_TakeCare") | Plugin 10.1 |
| P2 | `TitleButton` | Title | — | yes | Pages row 2 | Plugin 10.1 |
| P2 | `LineEdit` | LineEdit 8 | "1" | yes | Pages row 2 ("MIDI - Track") | Plugin 10.1 |
| P3 | `TitleButton` | Title | — | yes | Pages row 3 | Plugin 10.1 |
| P3 | `LineEdit` | LineEdit 11 | "1" | yes | Pages row 3 ("MIDI - Track") | Plugin 10.1 |
| B1 | `LineEdit` | LineEdit 3 | "1" | yes | Bottom options row | Plugin 10.1 |
| B2 | `LineEdit` | LineEdit 4 | "" | yes | Bottom options row | Plugin 10.1 |
| B3 | `CheckBox` | CheckBox 5 | "Assign Sequences to Page" | yes | Bottom options row | Plugin 10.1 |
| F1 | `Button` | Button 3 | "Cancel" | yes | Action row | Plugin 10.1 |
| F2 | `Button` | Button 4 | "Continue" | yes | Action row | Plugin 10.1 |

Every `LineEdit` has a child `ShowVKButton` (on-screen keyboard affordance) — omitted from the table as it's a standard MA3-chrome child, not a distinct control.

No tooltips were returned by the probe (`Tooltip` property empty on every element checked).

## 4. Navigation map

The probe only traversed the existing tree — it did not click anything. Observed activation affordances (based on structural evidence, not triggered):

- **`CloseButton 5` (titlebar)** — standard MA3 close; would dismiss the modal.
- **`Cancel` / `Continue` (footer)** — dismiss or commit the import.
- **`Filter Sequences` (SwipeButton)** — carries its own `PopupPlaceholder` / `PopupOverlay` child, so activation opens a popup overlay (contents not captured — popup is closed).
- **Every `LineEdit`** — child `ShowVKButton` opens the MA3 virtual keyboard for text entry.
- **`SeqToken_N` "Top/Release" buttons** — labelled under "Note Type"; plural phrasing ("Top/Release") implies a two-state toggle or cycle. Not tested.
- **`SeqIcon_N` TitleButtons** — clickable per the class; colour-key legend at top ("New item / Saved item / Existing item") suggests they indicate/change per-row state. Not tested.
- **Titlebar `Button 4` (unlabeled, plugin-owned)** — sits where an info/help button typically lives. Purpose not confirmed.
- **`Generate Waveform`** — clear imperative; not triggered (side-effects unknown).

No tabs, no top-level nav menus. Only one window is open.

## 5. Unknowns & gaps

- **Plugin version** — not detectable. `MArkersLIVE` in the pool is an obfuscated XML import; no `Version` / `Author` fields set on the pool entry.
- **Scroll extent** — the Sequences list is a `ScrollBox`; the 11 rows observed fit the visible viewport but the list may extend. The probe did not scroll.
- **Popup content of `Filter Sequences`** — `PopupOverlay` child is present but its `#count` was 0 at probe time (popup closed). Would need a click to reveal.
- **Titlebar `Button 4`** — unlabelled; probably info/help, but not confirmed. Skipped per the "if in doubt, don't click" rule.
- **Bottom `LineEdit 3` ("1") and `LineEdit 4` (empty)** — no label text adjacent in the tree. Likely "Start Cue" / "Start Page" given proximity to the "Assign Sequences to Page" checkbox, but the label text was not in the structure the probe walked. Reporting as unlabelled to avoid guessing.
- **Header row `LineEdit 5` ("2") and `LineEdit 6` ("-7")** — sit above the sequence-row columns but carry no sibling `UIObject` label in the header strip. Possibly header-level defaults that the row `LineEdits` inherit. Not confirmed.
- **Checkbox states** — `CheckBox` elements expose no readable `Checked` / `State` property via the probe path used. The `Assign Sequences to Page` checkbox state is unknown.
- **Colour semantics** — the per-row `BackColor` / `SeqIcon` colour maps to the legend (`New / Saved / Existing`), but colour values weren't decoded per-row.
- **Label-to-LineEdit binding** — some rows put the label `UIObject` (e.g. "Offset", "Steps") as a **child of the LineEdit** rather than a sibling. That's how the column meaning was recovered. The two header-row `LineEdits` and the two bottom-row `LineEdits` don't use this pattern, which is why their purpose couldn't be recovered structurally.
- **Pages panel** — three rows exist; the "MIDI - Track" duplication is suspicious (could be two distinct MIDI tracks sharing a generic label, or a naming quirk). Not investigated.
- **Other displays / windows** — only Display 1 and Display 2 exist. Display 1 has no plugin overlay. No off-screen dialogs.
