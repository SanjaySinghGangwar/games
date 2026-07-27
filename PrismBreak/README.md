# PRISM BREAK

A standalone **neon brick-breaker** arcade game.

Completely separate from the Void Slime / Neon Slime Run projects — different genre, art style, and repository.

## Play

```bash
# from this repo root
python3 -m http.server 8770
```

Open [http://127.0.0.1:8770/](http://127.0.0.1:8770/)

Or open `index.html` via any static file server (ES modules need HTTP).

## Controls

| Input | Action |
|--------|--------|
| Mouse / touch drag | Move paddle |
| `←` `→` / `A` `D` | Move paddle |
| `Space` / tap | Launch ball · pause |
| `M` | Mute |

## Features

- Progressive levels with multi-HP prism bricks
- Power-ups: multi-ball, wide paddle, laser, extra life, slow-mo
- Score, lives, local best score
- Procedural SFX (Web Audio)
- Mobile-friendly pointer controls

## Stack

- Vanilla HTML / CSS / JS (ES module)
- Canvas 2D only — no asset pipeline, no frameworks

## Repo layout

```
prism-break/
├── index.html
├── css/style.css
├── js/main.js
└── README.md
```

## License

MIT — make it yours.
