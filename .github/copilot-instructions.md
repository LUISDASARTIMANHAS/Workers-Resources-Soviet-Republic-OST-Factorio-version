# Copilot instructions for this repository

## Project overview

This repository is a Factorio mod that injects the Workers & Resources Soviet Republic soundtrack into the game as ambient and menu music. The mod is intentionally small and asset-heavy: the root metadata, gameplay configuration, and music registration live in a few files rather than a large app framework.

- `info.json` is the source of truth for the mod identity: mod name, version, author, dependency list, Factorio version, and release metadata.
- `data.lua` is the main registration point. It defines startup settings and calls `LDAUtils.CreateInterludeAmbientSound(...)` / `CreateMenuAmbientSound(...)` from the `LDA-LIB` dependency to register the music tracks.
- `settings.lua` exposes the startup toggles for ambient/menu music.
- `audio/` contains the `.ogg` soundtrack files and the loader script used to wire them in.
- `locale/en` and `locale/pt-BR` hold the user-facing strings for the mod settings.
- `docs/factorio-LDA-LIB/` contains the dependency documentation for the shared Factorio library this mod relies on; follow those conventions when adding/updating audio or prototype registration logic.

Do not treat the generated ZIP archives in the repo root as source input. They are release artifacts, not canonical design files.

## Build, test, and validation commands

This repo does not include a Node/npm, Python, or dedicated Lua test/lint pipeline. The project is validated mainly by packaging and by loading the mod in Factorio.

Primary local packaging command:

- `autoupdate.cmd`

What that script does:

- reads the mod version and name from `info.json`
- loads `.env` values, including `API_KEY`
- creates a ZIP release for the current mod directory
- copies the ZIP into the Steam Factorio mods folder (`Z:\SteamLibrary\steamapps\common\Factorio\mods`)
- exits early if `.env` is missing or if the version/name metadata is malformed

Important prerequisites:

- `.env` must exist and contain `API_KEY` before the script is useful.
- The script expects a Windows environment and the Steam Factorio mod path to be available.
- The script is release-oriented; it is not a general-purpose unit test runner.

Useful quick syntax checks for Lua edits when you need a fast validation pass:

- `lua -e "assert(loadfile([[data.lua]]))"`
- `lua -e "assert(loadfile([[audio\muisc-loader.lua]]))"`

For full game validation, load the mod in Factorio and verify that the menu music and ambient tracks work as expected.

## Key conventions and repo-specific patterns

- Keep `info.json` and the actual mod behavior aligned. If the mod version changes, update the root metadata first, before packaging or releasing.
- Follow the existing `LDA-LIB` integration pattern:

  ```lua
  local LDA = require("__LDA-LIB__/init")
  local PATH = LDA.setBasePath("Workers-And-Resources-Soviet-Republic-OST")
  ```

- Asset paths are part of the contract: file names in `audio/` are referenced explicitly in `data.lua` via `folderMusic .. "..."`. If you rename a track, update both the file and the matching registration entry.
- The mod uses stable startup setting IDs and names:
  - `Workers-And-Resources-Soviet-Republic-OST_ambient_music_config`
  - `Workers-And-Resources-Soviet-Republic-OST_music_menu_config`
- Keep both locale files in sync with the setting names and descriptions:
  - `locale/en/*.cfg`
  - `locale/pt-BR/*.cfg`
- The current dependency baseline is Factorio 2.1 and `LDA-LIB >= 0.0.17` as declared in `info.json`; preserve compatibility with that API surface unless the project intentionally bumps the dependency.
- This repository is intentionally minimal: prefer small, direct edits in the root mod files and the existing `audio/` and `locale/` structure instead of adding new framework layers.

## Working rules for changes

- Prefer editing the mod source files directly (`data.lua`, `settings.lua`, `audio/*`, `locale/*`, `info.json`) rather than packaging ZIP files as the primary source of truth.
- When adding or changing music entries, keep the naming and folder conventions consistent with the existing asset names so `LDAUtils.CreateInterludeAmbientSound(...)` resolves correctly.
- If a change affects the user-visible mod settings, update both language files to keep wording consistent across locales.
- Use the existing Windows packaging workflow for release validation; do not invent other build systems or package managers for this repo.
