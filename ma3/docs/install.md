# Installing the MA3 plugin

Two folders to copy onto the MA3 desk. Plugin files go into the desk's
plugins root; shared modules go into a `ZealSync_shared/` subfolder
alongside them.

## Layout on the desk

```
<MA3 plugins root>/
├── ZealSync_Discover.lua       ← from ma3/plugins/
├── ZealSync_Info.lua           ← from ma3/plugins/
├── (other ZealSync_*.lua plugins as they ship)
└── ZealSync_shared/
    ├── discover.lua            ← from ma3/shared/
    ├── json.lua                ← from ma3/shared/
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
under the plugins root — `ZealSync_Discover.lua` (broadcasts and persists
the Reaper endpoint to UserVars) and `ZealSync_Info.lua` (round-trips the
`info` verb against the persisted endpoint) at minimum for M2.

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
