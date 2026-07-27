/**
 * PRISM BREAK — standalone neon brick-breaker
 * Completely independent repo: paddle + ball + prism bricks + power-ups
 */

const canvas = document.getElementById("c");
const ctx = canvas.getContext("2d");
const W = canvas.width;
const H = canvas.height;

const $ = (id) => document.getElementById(id);
const el = {
  score: $("score"),
  level: $("level"),
  lives: $("lives"),
  best: $("best"),
  titleBest: $("title-best"),
  boot: $("boot"),
  bootBar: $("boot-bar"),
  title: $("title"),
  pause: $("pause"),
  levelup: $("levelup"),
  levelupText: $("levelup-text"),
  levelupSub: $("levelup-sub"),
  over: $("over"),
  overScore: $("over-score"),
  overNote: $("over-note"),
  msg: $("msg"),
};

const BEST_KEY = "prismBreakBest";
let best = Number(localStorage.getItem(BEST_KEY) || 0);
el.best.textContent = String(best);
el.titleBest.textContent = String(best);

// ---------- Audio ----------
let actx = null;
let muted = false;

function ensureAudio() {
  if (!actx) actx = new (window.AudioContext || window.webkitAudioContext)();
  if (actx.state === "suspended") actx.resume();
}

function tone(freq, dur = 0.07, type = "square", vol = 0.035, slide = 0) {
  if (!actx || muted) return;
  const t = actx.currentTime;
  const o = actx.createOscillator();
  const g = actx.createGain();
  o.type = type;
  o.frequency.setValueAtTime(freq, t);
  if (slide) o.frequency.exponentialRampToValueAtTime(Math.max(30, freq + slide), t + dur);
  g.gain.setValueAtTime(vol, t);
  g.gain.exponentialRampToValueAtTime(0.001, t + dur);
  o.connect(g);
  g.connect(actx.destination);
  o.start(t);
  o.stop(t + dur + 0.02);
}

const SFX = {
  bounce: () => tone(180 + Math.random() * 40, 0.05, "triangle", 0.03),
  brick: (hp) => tone(320 + hp * 80, 0.07, "square", 0.035, 100),
  power: () => tone(520, 0.12, "sine", 0.04, 280),
  launch: () => tone(240, 0.08, "triangle", 0.04, 160),
  lose: () => tone(120, 0.25, "sawtooth", 0.04, -70),
  win: () => {
    tone(400, 0.1, "sine", 0.04, 100);
    setTimeout(() => tone(560, 0.12, "sine", 0.04, 120), 80);
  },
  laser: () => tone(700, 0.04, "square", 0.025),
  wall: () => tone(140, 0.04, "triangle", 0.02),
};

// ---------- State ----------
const state = {
  mode: "boot", // boot | title | ready | play | pause | levelup | over
  score: 0,
  level: 1,
  lives: 3,
  shake: 0,
  flash: 0,
  slowT: 0,
  laserT: 0,
  wideT: 0,
  particles: [],
  floats: [],
  powers: [],
  lasers: [],
};

// ---------- Entities ----------
const paddle = {
  w: 88,
  h: 14,
  x: W / 2,
  y: H - 48,
  targetX: W / 2,
  baseW: 88,
};

/** @type {{x:number,y:number,vx:number,vy:number,r:number,stuck:boolean}[]} */
let balls = [];

/** @type {{x:number,y:number,w:number,h:number,hp:number,maxHp:number,hue:number,alive:boolean,score:number}[]} */
let bricks = [];

function resetBall(stuck = true) {
  balls = [
    {
      x: paddle.x,
      y: paddle.y - 18,
      vx: 0,
      vy: 0,
      r: 7,
      stuck,
    },
  ];
}

function launchBalls() {
  for (const b of balls) {
    if (!b.stuck) continue;
    b.stuck = false;
    const angle = -Math.PI / 2 + (Math.random() - 0.5) * 0.5;
    const speed = 320 + state.level * 12;
    b.vx = Math.cos(angle) * speed;
    b.vy = Math.sin(angle) * speed;
  }
  SFX.launch();
}

// Level layouts — rows of brick HP patterns
function buildLevel(n) {
  bricks = [];
  const cols = 10;
  const rows = Math.min(10, 4 + Math.floor(n / 2));
  const gap = 4;
  const margin = 24;
  const bw = (W - margin * 2 - gap * (cols - 1)) / cols;
  const bh = 18;
  const top = 72;

  for (let r = 0; r < rows; r++) {
    for (let c = 0; c < cols; c++) {
      // decorative gaps / patterns per level
      if (n % 3 === 1 && (c + r) % 5 === 0) continue;
      if (n % 3 === 2 && r > 1 && c > 2 && c < 7 && r < rows - 1 && Math.random() < 0.15) continue;

      let hp = 1;
      if (n >= 2 && r < 2) hp = 2;
      if (n >= 4 && r === 0) hp = 3;
      if (n >= 6 && (c === 0 || c === cols - 1)) hp = Math.min(3, hp + 1);
      // boss brick center
      if (n >= 3 && r === Math.floor(rows / 2) && c === Math.floor(cols / 2)) hp = 4;

      const hue = (r * 28 + c * 12 + n * 40) % 360;
      bricks.push({
        x: margin + c * (bw + gap),
        y: top + r * (bh + gap),
        w: bw,
        h: bh,
        hp,
        maxHp: hp,
        hue,
        alive: true,
        score: 50 * hp + n * 10,
      });
    }
  }
}

function livingBricks() {
  return bricks.filter((b) => b.alive).length;
}

// ---------- Input ----------
const keys = new Set();
let pointerX = W / 2;

window.addEventListener("keydown", (e) => {
  keys.add(e.code);
  if (["ArrowLeft", "ArrowRight", "Space"].includes(e.code)) e.preventDefault();

  if (e.code === "Space") {
    if (state.mode === "ready") {
      state.mode = "play";
      launchBalls();
      flashMsg("BREAK!", "#5ef2d0");
    } else if (state.mode === "play") {
      pauseGame();
    } else if (state.mode === "pause") {
      resumeGame();
    }
  }
  if (e.code === "KeyM") muted = !muted;
});

window.addEventListener("keyup", (e) => keys.delete(e.code));

function canvasPos(clientX) {
  const r = canvas.getBoundingClientRect();
  return ((clientX - r.left) / r.width) * W;
}

canvas.addEventListener("pointermove", (e) => {
  pointerX = canvasPos(e.clientX);
  paddle.targetX = pointerX;
});

canvas.addEventListener("pointerdown", (e) => {
  pointerX = canvasPos(e.clientX);
  paddle.targetX = pointerX;
  ensureAudio();
  if (state.mode === "ready") {
    state.mode = "play";
    launchBalls();
    flashMsg("BREAK!", "#5ef2d0");
  }
});

// ---------- FX ----------
function flashMsg(text, color = "#5ef2d0") {
  el.msg.textContent = text;
  el.msg.style.color = color;
  el.msg.classList.remove("show");
  void el.msg.offsetWidth;
  el.msg.classList.add("show");
}

function burst(x, y, color, n = 10) {
  for (let i = 0; i < n; i++) {
    const a = Math.random() * Math.PI * 2;
    const sp = 40 + Math.random() * 180;
    state.particles.push({
      x,
      y,
      vx: Math.cos(a) * sp,
      vy: Math.sin(a) * sp,
      life: 0.25 + Math.random() * 0.4,
      size: 1.5 + Math.random() * 3,
      color,
    });
  }
}

function addFloat(x, y, text, color) {
  state.floats.push({ x, y, text, color, life: 0.7, vy: -40 });
}

// ---------- Power-ups ----------
const POWER_TYPES = [
  { id: "multi", color: "#5ef2d0", label: "MULTI", chance: 0.22 },
  { id: "wide", color: "#a78bfa", label: "WIDE", chance: 0.2 },
  { id: "laser", color: "#ff6bcb", label: "LASER", chance: 0.16 },
  { id: "life", color: "#ffd166", label: "1UP", chance: 0.08 },
  { id: "slow", color: "#60a5fa", label: "SLOW", chance: 0.14 },
];

function maybeDropPower(x, y) {
  if (Math.random() > 0.28) return;
  const pool = POWER_TYPES.filter((p) => Math.random() < p.chance + 0.5);
  const type = pool[Math.floor(Math.random() * pool.length)] || POWER_TYPES[0];
  state.powers.push({
    x,
    y,
    vy: 90 + Math.random() * 40,
    type: type.id,
    color: type.color,
    label: type.label,
    r: 10,
  });
}

function applyPower(id) {
  SFX.power();
  flashMsg(POWER_TYPES.find((p) => p.id === id)?.label || id, "#ffd166");
  if (id === "multi") {
    const extras = [];
    for (const b of balls) {
      if (b.stuck) continue;
      extras.push({
        x: b.x,
        y: b.y,
        vx: -b.vy * 0.7 + (Math.random() - 0.5) * 80,
        vy: -Math.abs(b.vx) * 0.7 - 40,
        r: b.r,
        stuck: false,
      });
      extras.push({
        x: b.x,
        y: b.y,
        vx: b.vy * 0.7 + (Math.random() - 0.5) * 80,
        vy: -Math.abs(b.vx) * 0.7 - 40,
        r: b.r,
        stuck: false,
      });
    }
    balls.push(...extras);
    // cap balls
    if (balls.length > 8) balls.length = 8;
  } else if (id === "wide") {
    state.wideT = 12;
    paddle.w = 130;
  } else if (id === "laser") {
    state.laserT = 10;
  } else if (id === "life") {
    state.lives = Math.min(5, state.lives + 1);
    updateHUD();
  } else if (id === "slow") {
    state.slowT = 8;
    for (const b of balls) {
      b.vx *= 0.7;
      b.vy *= 0.7;
    }
  }
}

// ---------- Flow ----------
function updateHUD() {
  el.score.textContent = String(state.score);
  el.level.textContent = String(state.level);
  el.lives.textContent = "●".repeat(state.lives) + "○".repeat(Math.max(0, 3 - state.lives));
  if (state.lives > 3) el.lives.textContent = "●".repeat(state.lives);
  el.best.textContent = String(Math.max(best, state.score));
}

function startRun() {
  ensureAudio();
  state.mode = "ready";
  state.score = 0;
  state.level = 1;
  state.lives = 3;
  state.slowT = 0;
  state.laserT = 0;
  state.wideT = 0;
  state.powers = [];
  state.lasers = [];
  state.particles = [];
  state.floats = [];
  paddle.w = paddle.baseW;
  paddle.x = W / 2;
  paddle.targetX = W / 2;
  buildLevel(1);
  resetBall(true);
  updateHUD();
  el.title.classList.add("hidden");
  el.over.classList.add("hidden");
  el.pause.classList.add("hidden");
  el.levelup.classList.add("hidden");
  flashMsg("SPACE / TAP TO LAUNCH", "#a78bfa");
}

function nextLevel() {
  state.level++;
  state.mode = "ready";
  state.powers = [];
  state.lasers = [];
  state.slowT = Math.max(0, state.slowT);
  paddle.w = state.wideT > 0 ? 130 : paddle.baseW;
  buildLevel(state.level);
  resetBall(true);
  updateHUD();
  el.levelup.classList.add("hidden");
  flashMsg(`LEVEL ${state.level}`, "#5ef2d0");
}

function loseLife() {
  SFX.lose();
  state.lives--;
  updateHUD();
  state.powers = [];
  state.lasers = [];
  burst(paddle.x, paddle.y, "#ff5a7a", 16);
  if (state.lives <= 0) {
    gameOver();
    return;
  }
  state.mode = "ready";
  resetBall(true);
  flashMsg("BALL LOST", "#ff6bcb");
}

function gameOver() {
  state.mode = "over";
  el.overScore.textContent = String(state.score);
  if (state.score > best) {
    best = state.score;
    localStorage.setItem(BEST_KEY, String(best));
    el.best.textContent = String(best);
    el.titleBest.textContent = String(best);
    el.overNote.textContent = "★ NEW BEST SCORE ★";
  } else {
    el.overNote.textContent = `Level reached: ${state.level}`;
  }
  el.over.classList.remove("hidden");
}

function levelClear() {
  state.mode = "levelup";
  SFX.win();
  el.levelupText.textContent = "LEVEL CLEAR";
  el.levelupSub.textContent = `+${200 * state.level} clear bonus`;
  state.score += 200 * state.level;
  updateHUD();
  el.levelup.classList.remove("hidden");
}

function pauseGame() {
  if (state.mode !== "play") return;
  state.mode = "pause";
  el.pause.classList.remove("hidden");
}

function resumeGame() {
  state.mode = "play";
  el.pause.classList.add("hidden");
}

function toTitle() {
  state.mode = "title";
  el.pause.classList.add("hidden");
  el.over.classList.add("hidden");
  el.levelup.classList.add("hidden");
  el.title.classList.remove("hidden");
}

$("btn-start").addEventListener("click", startRun);
$("btn-retry").addEventListener("click", startRun);
$("btn-next").addEventListener("click", nextLevel);
$("btn-resume").addEventListener("click", resumeGame);
$("btn-quit").addEventListener("click", toTitle);
$("btn-title").addEventListener("click", toTitle);

// ---------- Physics helpers ----------
function clamp(v, a, b) {
  return Math.max(a, Math.min(b, v));
}

function circleRect(cx, cy, cr, rx, ry, rw, rh) {
  const nx = clamp(cx, rx, rx + rw);
  const ny = clamp(cy, ry, ry + rh);
  const dx = cx - nx;
  const dy = cy - ny;
  return dx * dx + dy * dy < cr * cr;
}

function bounceOffBrick(ball, brick) {
  const nearestX = clamp(ball.x, brick.x, brick.x + brick.w);
  const nearestY = clamp(ball.y, brick.y, brick.y + brick.h);
  const dx = ball.x - nearestX;
  const dy = ball.y - nearestY;

  // determine side
  const overlapL = ball.x + ball.r - brick.x;
  const overlapR = brick.x + brick.w - (ball.x - ball.r);
  const overlapT = ball.y + ball.r - brick.y;
  const overlapB = brick.y + brick.h - (ball.y - ball.r);
  const minX = Math.min(overlapL, overlapR);
  const minY = Math.min(overlapT, overlapB);

  if (minX < minY) {
    ball.vx *= -1;
    ball.x += ball.vx > 0 ? minX : -minX;
  } else {
    ball.vy *= -1;
    ball.y += ball.vy > 0 ? minY : -minY;
  }

  // nudge out if still stuck
  if (dx || dy) {
    /* already handled */
  }
}

function hitBrick(brick) {
  brick.hp--;
  SFX.brick(brick.hp);
  const color = `hsl(${brick.hue}, 85%, 60%)`;
  burst(brick.x + brick.w / 2, brick.y + brick.h / 2, color, 8);
  state.shake = Math.min(8, state.shake + 2);

  if (brick.hp <= 0) {
    brick.alive = false;
    state.score += brick.score;
    addFloat(brick.x + brick.w / 2, brick.y, `+${brick.score}`, color);
    maybeDropPower(brick.x + brick.w / 2, brick.y + brick.h / 2);
    updateHUD();
    if (livingBricks() === 0) levelClear();
  } else {
    state.score += 10;
    updateHUD();
  }
}

// ---------- Update ----------
function update(dt) {
  // paddle
  let move = 0;
  if (keys.has("ArrowLeft") || keys.has("KeyA")) move -= 1;
  if (keys.has("ArrowRight") || keys.has("KeyD")) move += 1;
  if (move !== 0) paddle.targetX += move * 520 * dt;
  paddle.targetX = clamp(paddle.targetX, paddle.w / 2 + 8, W - paddle.w / 2 - 8);
  paddle.x += (paddle.targetX - paddle.x) * Math.min(1, 18 * dt);

  if (state.wideT > 0) {
    state.wideT -= dt;
    if (state.wideT <= 0) paddle.w = paddle.baseW;
  }
  if (state.slowT > 0) state.slowT -= dt;
  if (state.laserT > 0) {
    state.laserT -= dt;
    // auto fire
    if (Math.floor(state.laserT * 8) !== Math.floor((state.laserT + dt) * 8)) {
      state.lasers.push({ x: paddle.x - 20, y: paddle.y, vy: -520 });
      state.lasers.push({ x: paddle.x + 20, y: paddle.y, vy: -520 });
      SFX.laser();
    }
  }
  if (state.shake > 0) state.shake = Math.max(0, state.shake - dt * 28);
  if (state.flash > 0) state.flash = Math.max(0, state.flash - dt);

  // stuck ball follows paddle
  for (const b of balls) {
    if (b.stuck) {
      b.x = paddle.x;
      b.y = paddle.y - 18;
    }
  }

  if (state.mode !== "play") {
    // still animate fx
    updateFX(dt);
    return;
  }

  const timeScale = state.slowT > 0 ? 0.65 : 1;
  const sdt = dt * timeScale;

  // balls
  for (const b of balls) {
    if (b.stuck) continue;
    b.x += b.vx * sdt;
    b.y += b.vy * sdt;

    // walls
    if (b.x - b.r < 8) {
      b.x = 8 + b.r;
      b.vx = Math.abs(b.vx);
      SFX.wall();
    }
    if (b.x + b.r > W - 8) {
      b.x = W - 8 - b.r;
      b.vx = -Math.abs(b.vx);
      SFX.wall();
    }
    if (b.y - b.r < 8) {
      b.y = 8 + b.r;
      b.vy = Math.abs(b.vy);
      SFX.wall();
    }

    // paddle
    if (
      b.vy > 0 &&
      b.y + b.r >= paddle.y &&
      b.y - b.r <= paddle.y + paddle.h &&
      b.x >= paddle.x - paddle.w / 2 &&
      b.x <= paddle.x + paddle.w / 2
    ) {
      b.y = paddle.y - b.r - 0.5;
      const hit = (b.x - paddle.x) / (paddle.w / 2);
      const angle = -Math.PI / 2 + hit * 1.05;
      const speed = Math.min(520, Math.hypot(b.vx, b.vy) * 1.02 + 4);
      b.vx = Math.cos(angle) * speed;
      b.vy = Math.sin(angle) * speed;
      if (b.vy > -120) b.vy = -120;
      SFX.bounce();
      burst(b.x, paddle.y, "#5ef2d0", 5);
    }

    // bricks
    for (const br of bricks) {
      if (!br.alive) continue;
      if (circleRect(b.x, b.y, b.r, br.x, br.y, br.w, br.h)) {
        bounceOffBrick(b, br);
        hitBrick(br);
        break;
      }
    }
  }

  // remove fallen balls
  balls = balls.filter((b) => b.stuck || b.y - b.r < H + 30);
  if (balls.length === 0) loseLife();

  // lasers
  for (let i = state.lasers.length - 1; i >= 0; i--) {
    const L = state.lasers[i];
    L.y += L.vy * sdt;
    let hit = false;
    for (const br of bricks) {
      if (!br.alive) continue;
      if (L.x >= br.x && L.x <= br.x + br.w && L.y >= br.y && L.y <= br.y + br.h) {
        hitBrick(br);
        hit = true;
        break;
      }
    }
    if (hit || L.y < 0) state.lasers.splice(i, 1);
  }

  // powers
  for (let i = state.powers.length - 1; i >= 0; i--) {
    const p = state.powers[i];
    p.y += p.vy * dt;
    if (
      p.y + p.r >= paddle.y &&
      p.y - p.r <= paddle.y + paddle.h &&
      p.x >= paddle.x - paddle.w / 2 &&
      p.x <= paddle.x + paddle.w / 2
    ) {
      applyPower(p.type);
      state.powers.splice(i, 1);
      continue;
    }
    if (p.y > H + 20) state.powers.splice(i, 1);
  }

  updateFX(dt);
}

function updateFX(dt) {
  for (let i = state.particles.length - 1; i >= 0; i--) {
    const p = state.particles[i];
    p.life -= dt;
    p.x += p.vx * dt;
    p.y += p.vy * dt;
    p.vy += 200 * dt;
    if (p.life <= 0) state.particles.splice(i, 1);
  }
  for (let i = state.floats.length - 1; i >= 0; i--) {
    const f = state.floats[i];
    f.life -= dt;
    f.y += f.vy * dt;
    if (f.life <= 0) state.floats.splice(i, 1);
  }
}

// ---------- Draw ----------
function drawBackground() {
  const g = ctx.createLinearGradient(0, 0, 0, H);
  g.addColorStop(0, "#0c0a1c");
  g.addColorStop(0.5, "#080714");
  g.addColorStop(1, "#05040c");
  ctx.fillStyle = g;
  ctx.fillRect(0, 0, W, H);

  // subtle grid
  ctx.strokeStyle = "rgba(94,242,208,0.04)";
  ctx.lineWidth = 1;
  for (let x = 0; x < W; x += 24) {
    ctx.beginPath();
    ctx.moveTo(x, 0);
    ctx.lineTo(x, H);
    ctx.stroke();
  }
  for (let y = 0; y < H; y += 24) {
    ctx.beginPath();
    ctx.moveTo(0, y);
    ctx.lineTo(W, y);
    ctx.stroke();
  }

  // top neon bar
  ctx.fillStyle = "rgba(94,242,208,0.08)";
  ctx.fillRect(0, 0, W, 48);
  ctx.fillStyle = "rgba(255,255,255,0.35)";
  ctx.font = "11px JetBrains Mono, monospace";
  ctx.textAlign = "left";
  ctx.fillText("PRISM BREAK", 14, 28);
  if (state.laserT > 0) {
    ctx.fillStyle = "#ff6bcb";
    ctx.fillText(`LASER ${state.laserT.toFixed(1)}s`, W - 120, 28);
  } else if (state.slowT > 0) {
    ctx.fillStyle = "#60a5fa";
    ctx.fillText(`SLOW ${state.slowT.toFixed(1)}s`, W - 110, 28);
  } else if (state.wideT > 0) {
    ctx.fillStyle = "#a78bfa";
    ctx.fillText(`WIDE ${state.wideT.toFixed(1)}s`, W - 110, 28);
  }
}

function drawBricks() {
  for (const b of bricks) {
    if (!b.alive) continue;
    const light = 45 + (b.hp / b.maxHp) * 20;
    const col = `hsl(${b.hue}, 80%, ${light}%)`;
    const edge = `hsl(${b.hue}, 90%, 75%)`;
    ctx.save();
    ctx.shadowColor = col;
    ctx.shadowBlur = 8;
    // prism shape
    const { x, y, w, h } = b;
    const g = ctx.createLinearGradient(x, y, x + w, y + h);
    g.addColorStop(0, edge);
    g.addColorStop(0.45, col);
    g.addColorStop(1, `hsl(${b.hue}, 70%, 28%)`);
    ctx.fillStyle = g;
    ctx.beginPath();
    ctx.roundRect(x, y, w, h, 4);
    ctx.fill();
    ctx.shadowBlur = 0;
    // facet
    ctx.fillStyle = "rgba(255,255,255,0.18)";
    ctx.beginPath();
    ctx.moveTo(x + 2, y + h - 2);
    ctx.lineTo(x + 2, y + 2);
    ctx.lineTo(x + w * 0.45, y + 2);
    ctx.closePath();
    ctx.fill();
    if (b.maxHp > 1) {
      ctx.fillStyle = "rgba(0,0,0,0.35)";
      ctx.font = "bold 10px JetBrains Mono, monospace";
      ctx.textAlign = "center";
      ctx.fillText(String(b.hp), x + w / 2, y + h / 2 + 3);
    }
    ctx.restore();
  }
}

function drawPaddle() {
  const x = paddle.x - paddle.w / 2;
  const y = paddle.y;
  const g = ctx.createLinearGradient(x, y, x + paddle.w, y);
  g.addColorStop(0, "#5ef2d0");
  g.addColorStop(0.5, "#a78bfa");
  g.addColorStop(1, "#ff6bcb");
  ctx.save();
  ctx.shadowColor = "#5ef2d0";
  ctx.shadowBlur = 16;
  ctx.fillStyle = g;
  ctx.beginPath();
  ctx.roundRect(x, y, paddle.w, paddle.h, 8);
  ctx.fill();
  ctx.fillStyle = "rgba(255,255,255,0.35)";
  ctx.fillRect(x + 8, y + 3, paddle.w - 16, 3);
  ctx.restore();

  if (state.laserT > 0) {
    ctx.fillStyle = "#ff6bcb";
    ctx.fillRect(paddle.x - 22, paddle.y - 6, 4, 6);
    ctx.fillRect(paddle.x + 18, paddle.y - 6, 4, 6);
  }
}

function drawBalls() {
  for (const b of balls) {
    ctx.save();
    ctx.shadowColor = "#ffffff";
    ctx.shadowBlur = 12;
    const g = ctx.createRadialGradient(b.x - 2, b.y - 2, 1, b.x, b.y, b.r);
    g.addColorStop(0, "#ffffff");
    g.addColorStop(0.4, "#5ef2d0");
    g.addColorStop(1, "#2dd4bf");
    ctx.fillStyle = g;
    ctx.beginPath();
    ctx.arc(b.x, b.y, b.r, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();
  }
}

function drawPowers() {
  for (const p of state.powers) {
    ctx.save();
    ctx.translate(p.x, p.y);
    ctx.shadowColor = p.color;
    ctx.shadowBlur = 12;
    ctx.fillStyle = p.color;
    ctx.beginPath();
    ctx.roundRect(-12, -10, 24, 20, 5);
    ctx.fill();
    ctx.fillStyle = "#0a0814";
    ctx.font = "bold 8px JetBrains Mono, monospace";
    ctx.textAlign = "center";
    ctx.fillText(p.label.slice(0, 4), 0, 3);
    ctx.restore();
  }
}

function drawLasers() {
  ctx.strokeStyle = "#ff6bcb";
  ctx.lineWidth = 2;
  ctx.shadowColor = "#ff6bcb";
  ctx.shadowBlur = 8;
  for (const L of state.lasers) {
    ctx.beginPath();
    ctx.moveTo(L.x, L.y);
    ctx.lineTo(L.x, L.y + 14);
    ctx.stroke();
  }
  ctx.shadowBlur = 0;
}

function drawFX() {
  for (const p of state.particles) {
    ctx.globalAlpha = Math.max(0, p.life * 2);
    ctx.fillStyle = p.color;
    ctx.beginPath();
    ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
    ctx.fill();
  }
  ctx.globalAlpha = 1;
  for (const f of state.floats) {
    ctx.globalAlpha = Math.max(0, f.life);
    ctx.fillStyle = f.color;
    ctx.font = "bold 12px JetBrains Mono, monospace";
    ctx.textAlign = "center";
    ctx.fillText(f.text, f.x, f.y);
  }
  ctx.globalAlpha = 1;
}

function drawReadyHint() {
  if (state.mode !== "ready") return;
  ctx.fillStyle = "rgba(255,255,255,0.5)";
  ctx.font = "13px Space Grotesk, sans-serif";
  ctx.textAlign = "center";
  ctx.fillText("Press SPACE or tap to launch", W / 2, H - 80);
  // aim line
  ctx.strokeStyle = "rgba(94,242,208,0.35)";
  ctx.setLineDash([6, 6]);
  ctx.beginPath();
  ctx.moveTo(paddle.x, paddle.y - 18);
  ctx.lineTo(paddle.x, paddle.y - 100);
  ctx.stroke();
  ctx.setLineDash([]);
}

// ---------- Loop ----------
let last = performance.now();

function frame(now) {
  const dt = Math.min(0.033, (now - last) / 1000);
  last = now;

  if (state.mode === "play" || state.mode === "ready" || state.mode === "pause") {
    if (state.mode !== "pause") update(dt);
    else updateFX(dt);
  } else {
    updateFX(dt);
  }

  ctx.save();
  if (state.shake > 0) {
    ctx.translate((Math.random() - 0.5) * state.shake, (Math.random() - 0.5) * state.shake);
  }

  drawBackground();
  if (state.mode !== "boot" && state.mode !== "title") {
    drawBricks();
    drawPowers();
    drawLasers();
    drawPaddle();
    drawBalls();
    drawFX();
    drawReadyHint();
  } else {
    // idle title animation balls
    drawDecorative();
  }

  ctx.restore();
  requestAnimationFrame(frame);
}

function drawDecorative() {
  // floating prisms for title/boot
  const t = performance.now() / 1000;
  for (let i = 0; i < 8; i++) {
    const x = 60 + i * 50 + Math.sin(t + i) * 8;
    const y = 180 + Math.cos(t * 0.8 + i) * 30;
    const hue = (i * 40 + t * 40) % 360;
    ctx.fillStyle = `hsla(${hue}, 80%, 55%, 0.7)`;
    ctx.beginPath();
    ctx.roundRect(x, y, 36, 16, 4);
    ctx.fill();
  }
  paddle.x = W / 2 + Math.sin(t) * 40;
  paddle.y = H - 80;
  drawPaddle();
  ctx.beginPath();
  ctx.fillStyle = "#5ef2d0";
  ctx.shadowColor = "#5ef2d0";
  ctx.shadowBlur = 12;
  ctx.arc(paddle.x + Math.sin(t * 2) * 20, paddle.y - 40, 7, 0, Math.PI * 2);
  ctx.fill();
  ctx.shadowBlur = 0;
}

// Polyfill roundRect if needed
if (!CanvasRenderingContext2D.prototype.roundRect) {
  CanvasRenderingContext2D.prototype.roundRect = function (x, y, w, h, r) {
    const rr = Math.min(r, w / 2, h / 2);
    this.moveTo(x + rr, y);
    this.arcTo(x + w, y, x + w, y + h, rr);
    this.arcTo(x + w, y + h, x, y + h, rr);
    this.arcTo(x, y + h, x, y, rr);
    this.arcTo(x, y, x + w, y, rr);
    this.closePath();
    return this;
  };
}

// Boot
async function boot() {
  for (let i = 0; i <= 100; i += 5) {
    el.bootBar.style.width = `${i}%`;
    await new Promise((r) => setTimeout(r, 20));
  }
  el.boot.classList.add("hidden");
  el.title.classList.remove("hidden");
  state.mode = "title";
  requestAnimationFrame(frame);
}

boot();
