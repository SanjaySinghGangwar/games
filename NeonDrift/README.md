# Neon Drift

A neon space dodge game for iPhone.

**Steer** by dragging left and right. **Avoid** jagged asteroids. **Collect** pink crystals for points and combos. Survive as long as you can — difficulty ramps up over time.

## Run on iPhone / Simulator

### Option A — Xcode (recommended)

1. Open the project:
   ```bash
   open NeonDrift.xcodeproj
   ```
2. In Xcode, select your **Team** under *Signing & Capabilities* (any Apple ID works for device installs).
3. Pick a simulator (e.g. iPhone 17 Pro) or a plugged-in iPhone (Iphonelabs / Polo / Prochonost).
4. Press **⌘R** to build and run.

To run on a **physical iPhone**: plug it in, select it as the run destination, set your Apple ID as the **Signing Team**, then ⌘R. Keep the phone unlocked the first time.

### Option B — regenerate the Xcode project

If `NeonDrift.xcodeproj` is missing:

```bash
cd NeonDrift
xcodegen generate
open NeonDrift.xcodeproj
```

## Controls

| Action | How |
|--------|-----|
| Steer | Drag finger left / right |
| Pause | Tap pause button |
| Retry / Menu | Buttons on game over |

## Requirements

- Xcode 15+ (iOS 16 deployment target)
- macOS with Xcode Command Line Tools
- Physical device: free Apple Developer signing is enough for your own phone
