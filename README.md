<p align="center">
  <img src="assets/logo.png" alt="universal-modder logo" width="160">
</p>

# universal-modder for Antigravity 2.0

> **Systematic, safe game-modding toolkit for Antigravity AI agents.**
> Recon any game engine, identify community routes, reverse engineer code, generate 2D sprites/textures with native Antigravity tools, automate in-game verification on Windows, and safely backup saves.

---

## Attribution & Credits

This project is a port and adaptation of the original [**universal-modder**](https://github.com/rehan-remade/universal-modder) created by [**Rehan (@rehan-remade)**](https://github.com/rehan-remade).
Original license: MIT.

### Changes & Additions in this Antigravity 2.0 Edition:
- **Full Antigravity 2.0 Plugin Architecture**: Formatted with Antigravity plugin manifest (`plugin.json`), progressive disclosure skills, and rules (`rules/AGENTS.md`).
- **Native Windows & PowerShell Support**: Added native Windows CMD and PowerShell launchers (`bin/um.cmd`, `bin/um.ps1`), eliminating dependency on bash/WSL on Windows.
- **Native 2D Generative Pipeline**: Integrated Antigravity's built-in `generate_image` tool directly into `asset-pipeline` and `mod-any-game`, enabling sprite generation out-of-the-box without requiring external paid API keys.
- **Cross-Platform Path Normalization**: Hardened CLI tools and test suite to run seamlessly on native Windows.

---

## Features

- **Game Recon (`um scan`)**: Identifies installed games (Steam, Epic, Xbox), detects engines (Unity, Unreal, Godot, GameMaker, .NET/XNA, native C++), anti-cheat status, installed mod loaders, and save directories.
- **2D Asset Pipeline (`um sprite`)**: Complete sprite processing pipeline (background cutout, nearest-neighbor resizing, palette snapping, pixelation, spritesheet packing and slicing) paired with Antigravity's native `generate_image` tool.
- **Save Backup & Restore (`um backup`)**: Automated pre-mod save snapshots to ensure zero data loss.
- **Windows Game Automation (`um win`)**: Native PowerShell/Win32 automation for window management, GPU-safe screenshots (`um win shot`), and exact-PID process hygiene.
- **Mod Linting (`um publish`)**: Pre-release checks ensuring no copyrighted original game files, decompiled source, or secrets are inadvertently shared.

---

## Quick Start in Antigravity

### 1. Installation
Clone or copy this directory into your global Antigravity plugins directory:
```powershell
# Default global plugins directory:
~/.gemini/config/plugins/universal-modder/
```

To inspect or toggle the plugin in Antigravity:
- Type `/plugin` in the chat, or open `Settings → Plugins`.

### 2. Command Line Interface (CLI)
On Windows, `um` is accessible directly from PowerShell or Command Prompt:
```powershell
# List installed games
um scan --list

# Scan a specific game (e.g. The Binding of Isaac, Terraria)
um scan "The Binding of Isaac Rebirth"

# Process sprites
um sprite info sprite.png
um sprite cutout sprite.png out.png
um sprite fit out.png final.png --size 32x32

# Create a save backup before modding
um backup create "C:\path\to\saves" --name my-game-saves
```

---

## The Modding Loop

When you ask Antigravity to mod a game, it follows the **`mod-any-game`** systematic workflow:

1. **Intake**: Agree on the idea, scope, and single-player offline boundaries.
2. **Recon**: Run `um scan` to detect the engine, community loaders (BepInEx, tModLoader, UE4SS, SMAPI, etc.), and routes.
3. **Lab Setup**: Backup save folders with `um backup create`.
4. **Source of Truth**: Inspect game code/data via decompiler/disassembler tools.
5. **Vertical Slice**: Build the smallest working prototype first with placeholder art.
6. **Assets**: Generate art with Antigravity `generate_image`, process via `um sprite`.
7. **In-Game Verification**: Launch and verify in-game, capturing screenshots with `um win shot`.
8. **Publish**: Run `um publish check` before sharing.

---

## Skills Included

- **`mod-any-game`**: Main orchestrator skill for the complete modding lifecycle.
- **`game-recon`**: In-depth engine fingerprinting, loader detection, and route selection.
- **`reverse-engineering`**: Playbooks for .NET, IL2CPP, Unreal, Unity, Java, and native C++ binaries.
- **`asset-pipeline`**: Art conversion into exact frame sizes, palettes, and spritesheets.
- **`game-automation`**: Windows game window control, screenshots, and input driving.
- **`mashup-mods`**: Total conversions and cross-game porting patterns.
- **`publish-mod`**: Packaging and pre-release linting.

---

## Safety Rules

- Single-player & offline only.
- Never touch online multiplayer games with anti-cheat.
- Never bypass DRM or anti-cheat.
- Always backup saves before launching modded sessions.
- Maintain a `MODLOG.md` journal in the mod directory.

---

## License

MIT License. See [LICENSE](LICENSE) for details.
