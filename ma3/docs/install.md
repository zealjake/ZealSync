# Installing the MA3 plugin

Two install paths, pick one:

1. **Bundled XML** (recommended for desk delivery): one self-contained
   `.xml` file per plugin, drop into the MA3 plugins library folder, no
   shared modules to copy. See [Bundled XML install](#bundled-xml-install)
   below.
2. **Raw `.lua` + `ZealSync_shared/`** (used during dev when iterating
   on shared modules): copy the source files onto the desk, with
   `_G.ZEALSYNC_HOTRELOAD = true` to bypass the module cache. See the
   sections after.

## Bundled XML install

Run the bundler, which inlines all shared modules into a single Lua
chunk per plugin and wraps each as a GrandMA3 `<UserPlugin>` xml:

```sh
python3 ma3/tools/build_plugin_xml.py
```

By default it writes to `~/MALightingTechnology/gma3_library/datapools/plugins/`.
Override with `--out-dir`. After running, import each `ZealSync_*.xml`
via the MA3 Plugin Pool (right-click → Import). The bundled XMLs do
**not** require `ZealSync_shared/` on the desk — that's the whole point.

## Raw `.lua` install (dev workflow)

Plugin files go into the desk's plugins root; shared modules go into a
`ZealSync_shared/` subfolder alongside them.

## Layout on the desk

```
<MA3 plugins root>/
├── ZealSync_Discover.lua       ← from ma3/plugins/
├── ZealSync_Info.lua           ← from ma3/plugins/
├── ZealSync_Markers.lua        ← from ma3/plugins/
├── (other ZealSync_*.lua plugins as they ship)
└── ZealSync_shared/
    ├── discover.lua            ← from ma3/shared/
    ├── json.lua                ← from ma3/shared/
    ├── version.lua             ← from ma3/shared/
    └── wire.lua                ← from ma3/shared/
```

The `ZealSync_shared/` folder name matters — it's hardcoded into every
plugin's `load_shared` helper. Don't rename it. (We chose
`ZealSync_shared/` rather than reusing MA3_Tools' `zeal_shared/` because
MA3_Tools is a separate product with its own shared-module namespace;
collisions would silently override one or the other.)

## Finding the plugins root

In MA3, plugins are imported into the show file's plugin pool, but the
filesystem root is fixed per install. From any plugin, `GetPath("plugins")`
returns the path. From the command line on the desk:

```
LuaCommand "Echo(GetPath('plugins'))"
```

On macOS dev, this is typically:

```
~/MALightingTechnology/gma3_library/plugins/
```

On a console: somewhere under `/MAdata/...`. Check the desk.

## Copy procedure

From this repo's root:

```sh
PLUGINS_ROOT="<output of GetPath('plugins')>"
mkdir -p "$PLUGINS_ROOT/ZealSync_shared"
cp ma3/shared/*.lua "$PLUGINS_ROOT/ZealSync_shared/"
cp ma3/plugins/*.lua "$PLUGINS_ROOT/"
```

Then in MA3, import each plugin via the Plugin Pool: right-click the slot,
**Import Plugin**, navigate to `<plugins root>/ZealSync_*.lua`, set the
component name (the source-of-truth files use `select(n, ...)` to pick up
whatever component name the desk assigns). Repeat for every `ZealSync_*.lua`
under the plugins root:

- `ZealSync_Discover.lua` — broadcasts and persists the Reaper endpoint
  to UserVars.
- `ZealSync_Info.lua` — round-trips the `info` verb against the
  persisted endpoint.
- `ZealSync_Markers.lua` — round-trips the `markers` verb and logs the
  parsed marker list (M3).

## Why not a single folder, why not require()?

- **Single folder would mean shared modules show up in the plugin pool.**
  MA3 treats every `*.lua` directly under the plugins root as a candidate
  plugin. `wire.lua` and `json.lua` aren't plugins — they're libraries.
  The subfolder hides them from the plugin pool.
- **`require()` is unreliable on MA3.** `package.path` differs by desk
  install and by show file. `dofile(absolute_path)` with `GetPath('plugins')`
  as the anchor is the only path that works the same way on every desk.
  See the `load_shared` helper inlined at the top of every plugin file
  for the exact pattern.

## Updating

Every time you pull `ma3/shared/` or `ma3/plugins/` from the repo, re-copy
to the desk. There's no auto-sync. (For dev, the
`MA3_Tools/lua/plugins/PluginLoader.lua` workflow is faster — but that's a
separate tool, not part of ZealSync.)

## Hot-reload flag (dev only)

Each plugin's inlined `load_shared` helper caches loaded modules in
`_G.ZealSync_<name>` so successive plugin runs don't re-parse the same
file. While iterating on a shared module (e.g. `wire.lua`), set
`_G.ZEALSYNC_HOTRELOAD = true` from the MA3 command line to bypass the
cache and re-`dofile` the module on every plugin run:

```
LuaCommand "ZEALSYNC_HOTRELOAD = true"
```

Clear it (`= nil`) once you're done — the cache exists for a reason.
The flag is read inside every `load_shared` call (D12).
