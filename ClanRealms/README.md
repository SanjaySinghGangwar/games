# Aether Rift (Clan Realms)

**Original landscape arena brawler** — not a Clash of Clans clone.

You **pilot a champion**, **summon spirit allies**, protect your **Spirit Well**, and **seal the enemy Rift Core** while waves pour out of the void.

## Gameplay (new)

| Action | How |
|--------|-----|
| Move | **Drag** anywhere on the arena |
| Summon | Bottom dock spirits (costs Energy) |
| Ultimate | Sparkles button (Boldrin / Lumen / Lyra / Borin each unique) |
| Win | Destroy the **Rift Core** |
| Lose | Spirit Well dies **or** Champion falls |
| Stars | Well HP remaining + combo bonus |

### Champions
- **Boldrin** — Bulwark (shield + knock)
- **Lumen** — Nova (AoE blast)
- **Lyra** — Rain (multi-shot)
- **Borin** — Quake (shockwave)

### Spirits
Wisp · Spirit Wolf · Stonekin · Emberling (unlock as you climb)

## Assets

- **~9,500** free Kenney (CC0) PNGs downloaded under `AssetDownloads/`
- **~1,886** imagesets wired into `Assets.xcassets`
- Packs include: game-icons, platformers, TD kit, particles, UI, nature, medals, more

## Run

```bash
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
cd /Users/vaibhav/ClanRealms
xcodebuild -project ClanRealms.xcodeproj -scheme ClanRealms \
  -destination 'generic/platform=iOS Simulator' build CODE_SIGNING_ALLOWED=NO
```

Open in Xcode → landscape simulator → **⌘R**.

## Stack

SwiftUI + SpriteKit · iOS 17+ · Landscape only
