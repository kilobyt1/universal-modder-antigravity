# universal-modder for Antigravity

This toolkit enables AI agents in Antigravity to mod games safely and systematically.
Start with the `mod-any-game` skill and follow its loop:
intake → recon → route → lab → source of truth → vertical slice → assets → verify in game → publish.

## Tools
- `bin/um.cmd` (or `bin/um.ps1` / `um` on PATH) is the CLI. Every group has `--help`:
  - `scan`: detect installed games (Steam/Epic/Xbox), engines, anti-cheat, mod loaders, save locations, routes.
  - `sprite`: 2D spritesheet packing, background cutout, fitting, pixelation, and palette snapping.
  - `win`: Windows game window management, screenshot capture, process inspection, exact-PID control.
  - `backup`: snapshot and restore save folders before launching modded sessions.
  - `publish`: lint mod folders before sharing (checks for leaked game files, decompiled source, secrets).
- Assets: Use Antigravity's native `generate_image` tool for concept art and raw 2D sprites, then process them via `um sprite`.

## Hard Safety Rules
- **Ownership & Offline:** Only mod games the user owns, strictly in single-player / offline mode.
- **Never touch anti-cheat:** Never hook into or touch online games protected by anti-cheat (EasyAntiCheat, BattlEye, Vanguard, VAC, Ricochet, ACE). Never bypass DRM or anti-cheat checks.
- **Save Backups:** Always run `um backup create` before launching modded games or modifying saves. Record restore paths in `MODLOG.md`.
- **No Redistribution:** Never commit or redistribute copyrighted game files, extracted assets, or decompiled code.
- **Process Hygiene:** Kill processes ONLY by exact PID (`um win kill <pid>`), never by wildcard name.
- **Ask Before Control:** Ask the user before driving mouse/keyboard input, installing loaders directly into game directories, or altering Windows registry settings.
- **Journal:** Maintain a `MODLOG.md` file in the mod folder documenting addresses, IDs, engine findings, and reproduction steps.
