# Games

A collection of small original games — three native iOS/SpriteKit projects, three browser games, and one sprite asset pack.

## iOS (Xcode / Swift)

| Project | What it is |
|---------|-----------|
| [ClanRealms](ClanRealms/) | **Aether Rift** — landscape arena brawler. Pilot a champion, summon spirit allies, defend your Spirit Well, seal the enemy Rift Core. |
| [NeonDrift](NeonDrift/) | Neon space dodger. Steer by dragging, avoid asteroids, collect crystals, survive the ramp. |
| [RooftopCricket](RooftopCricket/) | **Arena Cricket** — shot-map batting, line/length bowling, two-innings matches. Fictional teams, no licensed brands. |

Each has its own `README.md` with build and run instructions. `NeonDrift` and `RooftopCricket` include a `project.yml` for [XcodeGen](https://github.com/yonaskolb/XcodeGen).

## Web (HTML5 canvas)

| Project | What it is |
|---------|-----------|
| [PrismBreak](PrismBreak/) | Neon brick-breaker arcade game. |
| [NeonSlimeRun](NeonSlimeRun/) | Neon endless runner. |
| [SpaceSlime](SpaceSlime/) | **Void Slime** — space-themed slime game. |

Serve any of them over HTTP from its own folder:

```bash
cd PrismBreak && python3 -m http.server 8770
# then open http://localhost:8770
```

## Assets

| Folder | What it is |
|--------|-----------|
| [SpaceSlimeSprite](SpaceSlimeSprite/) | Sprite pack for the slime character — idle/hop sheets, pose and variant frames, animated previews. See its `MANIFEST.md` for frame rates and file list. |

## Third-party assets

`ClanRealms/AssetDownloads/` contains downloaded third-party asset packs. Those retain their own licenses — check each pack before reusing.
