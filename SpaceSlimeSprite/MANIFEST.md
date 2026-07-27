# Space Slime Blob — Asset Pack

Dark fantasy 2D game slime. Magenta key background ~#C832A0.

## Intended FPS
- Idle bounce: ~7 fps (140ms/frame)
- Hop cycle: ~9 fps (110ms/frame)

## Files

### Base & poses
| File | Description |
|------|-------------|
| base_idle.jpg | Neutral idle base |
| pose_attack.jpg | Tendrils out, eye blazing |
| variant_hurt.jpg | Deflated cracked damage state |
| variant_enraged.jpg | Spiky rage form |
| variant_mini.jpg | Tiny companion scale |

### Idle bounce (loop order)
1. idle_01_neutral.jpg
2. idle_02_squash.jpg
3. idle_03_stretch.jpg
4. idle_05_lean_right.jpg
5. idle_04_lean_left.jpg
6. idle_02_squash.jpg → back to 1

### Hop / walk cycle (loop order)
1. hop_01_crouch.jpg
2. idle_03_stretch.jpg (launch)
3. hop_02_airborne.jpg
4. hop_03_land.jpg
5. hop_01_crouch.jpg → loop

### Sprite sheets (cell 256×256, no dividers)
| File | Layout |
|------|--------|
| sheet_master.png | 6×3 — row0 idle, row1 hop, row2 poses/variants |
| sheet_idle.png | 6×1 idle |
| sheet_hop.png | 5×1 hop |
| sheet_poses_variants.png | 5×1 attack + variants + base |

### Previews
- preview_idle.gif
- preview_hop.gif

## Notes / defects
- Video animation pipeline unavailable (ZDR); keyframe image edits used instead.
- Soft purple rim glow on some frames — may need cleanup for hard chroma key.
- Mini slime is same identity at smaller scale with padding (still 1024 source).
- Source originals also in session images/1–12.jpg
