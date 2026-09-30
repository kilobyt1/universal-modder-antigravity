# Minecraft

## Java Edition: code mods with Fabric (or NeoForge)
- **Fabric:** a light loader and Fabric API, with Mixin for bytecode patches. It updates fast to new
  versions.
  1. Get the template from https://fabricmc.net/develop/template/, or clone `FabricMC/fabric-example-mod`.
  2. Build with `./gradlew build`. The jar goes to `mods/`. `./gradlew runClient` launches a dev client with
     your mod (the perfect agent oracle: logs in `run/logs/latest.log`).
- **NeoForge:** the successor of Forge for modern versions (MDK template), with a bigger API surface
  (capabilities, events).
- **Mappings:** Mojang publishes official obfuscation maps. Loom (Fabric) handles Yarn or Mojang mappings
  and produces readable sources: `./gradlew genSources`.
- **Content:** register items, blocks, entities and sounds through the registries. Assets go under
  `src/main/resources/assets/<modid>/` (textures 16x16 PNG, models JSON, lang JSON, sounds.json + ogg).
  Data (recipes, loot tables, tags) goes under `data/<modid>/`.
- **Server-side only:** plugins (Paper/Spigot) plus resource packs change a lot without client mods. The
  "Black Ops 2 inside vanilla Minecraft" demo was a plugin plus a resource pack.
- `minecraft-modding-mcp` gives an agent mappings, decompiled source and version diffs.

## Bedrock Edition: add-ons
Behavior packs (JSON entities/items/blocks + Script API in JavaScript/TypeScript, `@minecraft/server`) and
resource packs. Develop in `com.mojang/development_*_packs` and turn on content-log output for errors.

## Pitfalls
- Match the exact game version + loader version + API version triple; mods are version-locked.
- Multiplayer: a server needs the mod too (or use plugins). Never ship client hacks for public servers.
- Mashups: the September 2026 "Minecraft inside X" projects either reimplemented Minecraft (Rust rewrites
  matching Java worldgen) or ran it side by side and exchanged state (passthrough). Minecraft's own assets
  were downloaded from Mojang at first run and never redistributed.
