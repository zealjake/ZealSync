# Vendored WDL — sources & layout

- **Upstream:** https://github.com/justinfrankel/WDL
- **Commit:** `0676ce949c470d9cd82b720e82baa5e10f9aae98`
- **Date copied:** 2026-05-08
- **Principle:** minimum surface required for `reaper_plugin.h` and
  `reaper_plugin_functions.h` (in `../sdk/`) to compile on macOS.

## What's vendored

```
WDL/swell/swell.h
WDL/swell/swell-types.h
WDL/swell/swell-functions.h
```

That's it. Three headers. No `.cpp`, no other WDL components, no `eel2`,
no audio DSP, no GUI. swell-types and swell-functions only include
system headers (`stdlib`, `stdio`, `string`, `unistd`, `pthread`, etc.) —
no transitive WDL dependencies.

## Why this layout (sibling of `sdk/`)

`sdk/reaper_plugin.h` contains, on non-Windows:

```c
#include "../WDL/swell/swell.h"
```

That `..` is a literal path component evaluated relative to the
including file's directory. It only resolves if `WDL/` is a sibling of
`sdk/`. We mirror REAPER's own source-tree layout so the SDK headers'
own includes resolve without patching vendored code or adding shim
files.

If a future milestone needs more of WDL (swell `.cpp` for cross-platform
UI, `eel2`, etc.), pull only the specific files needed and update this
note. Don't import WDL wholesale — most of it is unused by ZealSync.
