# reaper_zealsync

REAPER C++ extension half of ZealSync.

## Build

```sh
cmake -B build && cmake --build build
```

Produces `build/reaper_zealsync.dylib`. Copy it to:

```
~/Library/Application Support/REAPER/UserPlugins/
```

Then restart REAPER. The extension binds TCP port 29882 on load.

### Standalone test build

For wire-protocol testing without REAPER:

```sh
cmake -B build-stdal -DZEALSYNC_STANDALONE=ON && cmake --build build-stdal
./build-stdal/reaper_zealsync           # binds 29882
./build-stdal/reaper_zealsync 29883     # bind a different port
```

## M1 carve-out: REAPER SDK headers

The upstream REAPER SDK at `third_party/reaper-sdk/sdk/reaper_plugin.h`
transitively includes `WDL/swell/swell.h` on macOS, which lives in a
separate `justinfrankel/WDL` repo (~12 MB) that M1 does not need. Rather
than vendor WDL just for M1, `include/reaper_plugin_compat.h`
forward-declares the four-field `reaper_plugin_info_t` and the
`ShowConsoleMsg` function pointer signature we actually use.

M2 vendors WDL and switches `src/main.cpp` to include the upstream
`reaper_plugin.h` and `reaper_plugin_functions.h` directly. The
upstream SDK is already vendored at the spec'd path; the carve-out is
additive, not a replacement.
