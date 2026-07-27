# Arena Cricket

Original mobile cricket game inspired by the *genre* of apps like Real Cricket™ — **not affiliated with, endorsed by, or a clone of KRAFTON / Real Cricket™**.

## What you get (v1 “RC-style” core)

- Hub → match setup → toss
- Fictional teams (no licensed IPL/ICC brands)
- Formats: Super Over · T5 · T10
- **Shot map batting** (9 regions) + timing
- **Bowling** with line / length / power
- Full **two-innings** match + chase target
- AI opponent
- **True 3D SceneKit stadium** with free **360° orbit camera** + pinch zoom
- 3D pitch, stands, floodlights, boundary rope, stumps
- Real player billboards + leather ball in 3D space
- Wins / best score saved locally

## What Real Cricket™ has that this does **not** (yet)

Real Cricket is a ~1.6GB product with licensed teams, 700+ mocap shots, multiplayer, 40+ stadiums, commentary packs, auctions, seasons, etc. That is multi-year AAA scope — we built the **playable match core** you can iterate toward that fantasy.

## Run

```bash
cd RooftopCricket
xcodegen generate
open RooftopCricket.xcodeproj
```

⌘R on simulator or device.
