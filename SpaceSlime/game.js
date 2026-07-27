(() => {
  "use strict";

  const canvas = document.getElementById("game");
  const ctx = canvas.getContext("2d");
  const W = canvas.width;
  const H = canvas.height;

  const el = {
    score: document.getElementById("score"),
    wave: document.getElementById("wave"),
    combo: document.getElementById("combo"),
    hpFill: document.getElementById("hp-fill"),
    rageFill: document.getElementById("rage-fill"),
    superFill: document.getElementById("super-fill"),
    buffs: document.getElementById("buffs"),
    overlay: document.getElementById("overlay"),
    pause: document.getElementById("pause"),
    gameover: document.getElementById("gameover"),
    finalScore: document.getElementById("final-score"),
    finalWave: document.getElementById("final-wave"),
    finalCombo: document.getElementById("final-combo"),
    finalKills: document.getElementById("final-kills"),
    finalTime: document.getElementById("final-time"),
    newBest: document.getElementById("new-best"),
    best: document.getElementById("best-score"),
    touch: document.getElementById("touch"),
    stickKnob: document.getElementById("stick-knob"),
    announcer: document.getElementById("announcer"),
    flash: document.getElementById("fx-flash"),
    loader: document.getElementById("loader"),
    loaderFill: document.getElementById("loader-fill"),
    loaderText: document.getElementById("loader-text"),
    hud: document.getElementById("hud"),
    abilityRow: document.getElementById("ability-row"),
    canvasWrap: document.getElementById("canvas-wrap"),
    tip: document.getElementById("tip"),
    vignette: document.getElementById("vignette"),
    waveBanner: document.getElementById("wave-banner"),
    cdDash: document.getElementById("cd-dash"),
    cdHop: document.getElementById("cd-hop"),
    cdAtk: document.getElementById("cd-atk"),
    cdSuper: document.getElementById("cd-super"),
    abDash: document.getElementById("ab-dash"),
    abHop: document.getElementById("ab-hop"),
    abAtk: document.getElementById("ab-atk"),
    abSuper: document.getElementById("ab-super"),
  };

  let muted = localStorage.getItem("voidSlimeMute") === "1";
  let difficulty = localStorage.getItem("voidSlimeDiff") || "normal";
  let musicNodes = null;
  let tipTimer = 0;
  let tipQueue = [];

  const ASSET_NAMES = {
    idle: [
      "idle_01_neutral",
      "idle_02_squash",
      "idle_03_stretch",
      "idle_05_lean_right",
      "idle_04_lean_left",
      "idle_02_squash",
    ],
    hop: ["hop_01_crouch", "idle_03_stretch", "hop_02_airborne", "hop_03_land"],
    attack: "pose_attack",
    hurt: "variant_hurt",
    enraged: "variant_enraged",
    mini: "variant_mini",
  };

  const ENEMY_KINDS = ["wraith", "shard", "brute", "bomber", "boss"];
  const ENEMY_POSES = ["idle", "idle2", "attack", "hurt"];

  const images = {};
  const enemyImages = {}; // enemyImages[kind][pose]
  let assetsReady = false;

  function loadImage(src) {
    return new Promise((resolve, reject) => {
      const img = new Image();
      img.onload = () => resolve(img);
      img.onerror = reject;
      img.src = src;
    });
  }

  async function loadAssets() {
    const playerNames = [
      ...ASSET_NAMES.idle,
      ...ASSET_NAMES.hop,
      ASSET_NAMES.attack,
      ASSET_NAMES.hurt,
      ASSET_NAMES.enraged,
      ASSET_NAMES.mini,
    ];
    const enemyJobs = ENEMY_KINDS.flatMap((kind) =>
      ENEMY_POSES.map((pose) => ({ kind, pose, src: `assets/enemies/${kind}_${pose}.png` }))
    );
    const total = playerNames.length + enemyJobs.length;
    let done = 0;
    const tick = (label) => {
      done++;
      const p = Math.round((done / total) * 100);
      if (el.loaderFill) el.loaderFill.style.width = `${Math.max(8, p)}%`;
      if (el.loaderText) el.loaderText.textContent = label || `Loading ${p}%`;
    };

    for (const name of playerNames) {
      images[name] = await loadImage(`assets/${name}.png`);
      tick(`Slime · ${name}`);
    }
    for (const job of enemyJobs) {
      if (!enemyImages[job.kind]) enemyImages[job.kind] = {};
      try {
        enemyImages[job.kind][job.pose] = await loadImage(job.src);
      } catch {
        console.warn("missing enemy frame", job.kind, job.pose);
      }
      tick(`${job.kind} · ${job.pose}`);
    }
    assetsReady = true;
  }

  function showTip(text, seconds = 3.2) {
    tipQueue.push({ text, seconds });
  }

  function updateTip(dt) {
    if (!el.tip) return;
    if (tipTimer > 0) {
      tipTimer -= dt;
      if (tipTimer <= 0) {
        el.tip.classList.add("hidden");
        el.tip.textContent = "";
      }
      return;
    }
    if (tipQueue.length) {
      const t = tipQueue.shift();
      el.tip.textContent = t.text;
      el.tip.classList.remove("hidden");
      tipTimer = t.seconds;
    }
  }

  function showWaveBanner(text) {
    if (!el.waveBanner) return;
    el.waveBanner.textContent = text;
    el.waveBanner.classList.remove("hidden", "show");
    void el.waveBanner.offsetWidth;
    el.waveBanner.classList.add("show");
    setTimeout(() => el.waveBanner.classList.add("hidden"), 1500);
  }

  function enemySprite(e) {
    const pack = enemyImages[e.spriteKind] || enemyImages[e.kind];
    if (!pack) return null;
    if (e.anim === "hurt" && pack.hurt) return pack.hurt;
    if (e.anim === "attack" && pack.attack) return pack.attack;
    // idle bob
    if (e.frame % 2 === 0 && pack.idle) return pack.idle;
    return pack.idle2 || pack.idle || null;
  }

  // --- Audio ---
  let audioCtx = null;
  function ensureAudio() {
    if (!audioCtx) audioCtx = new (window.AudioContext || window.webkitAudioContext)();
    if (audioCtx.state === "suspended") audioCtx.resume();
  }

  function beep({ freq = 440, dur = 0.08, type = "square", gain = 0.04, slide = 0 }) {
    if (!audioCtx || muted) return;
    const t = audioCtx.currentTime;
    const o = audioCtx.createOscillator();
    const g = audioCtx.createGain();
    o.type = type;
    o.frequency.setValueAtTime(freq, t);
    if (slide) o.frequency.exponentialRampToValueAtTime(Math.max(40, freq + slide), t + dur);
    g.gain.setValueAtTime(gain * 0.85, t);
    g.gain.exponentialRampToValueAtTime(0.001, t + dur);
    o.connect(g);
    g.connect(audioCtx.destination);
    o.start(t);
    o.stop(t + dur + 0.02);
  }

  function startMusic() {
    if (!audioCtx || muted || musicNodes) return;
    const master = audioCtx.createGain();
    master.gain.value = 0.035;
    master.connect(audioCtx.destination);
    const notes = [55, 65.41, 82.41, 98];
    const oscs = notes.map((f, i) => {
      const o = audioCtx.createOscillator();
      const g = audioCtx.createGain();
      o.type = i % 2 ? "triangle" : "sine";
      o.frequency.value = f;
      g.gain.value = 0.2;
      o.connect(g);
      g.connect(master);
      o.start();
      return { o, g };
    });
    // slow pulse
    const lfo = audioCtx.createOscillator();
    const lfoG = audioCtx.createGain();
    lfo.frequency.value = 0.12;
    lfoG.gain.value = 0.012;
    lfo.connect(lfoG);
    lfoG.connect(master.gain);
    lfo.start();
    musicNodes = { master, oscs, lfo };
  }

  function stopMusic() {
    if (!musicNodes) return;
    try {
      musicNodes.oscs.forEach(({ o }) => o.stop());
      musicNodes.lfo.stop();
    } catch (_) { /* ignore */ }
    musicNodes = null;
  }

  function setMuted(v) {
    muted = v;
    localStorage.setItem("voidSlimeMute", muted ? "1" : "0");
    if (muted) stopMusic();
    else if (state.mode === "play") startMusic();
  }

  function noiseBurst(dur = 0.08, gain = 0.03) {
    if (!audioCtx || muted) return;
    const t = audioCtx.currentTime;
    const bufferSize = Math.floor(audioCtx.sampleRate * dur);
    const buffer = audioCtx.createBuffer(1, bufferSize, audioCtx.sampleRate);
    const data = buffer.getChannelData(0);
    for (let i = 0; i < bufferSize; i++) data[i] = (Math.random() * 2 - 1) * (1 - i / bufferSize);
    const src = audioCtx.createBufferSource();
    const g = audioCtx.createGain();
    src.buffer = buffer;
    g.gain.value = gain;
    src.connect(g);
    g.connect(audioCtx.destination);
    src.start(t);
  }

  const SFX = {
    hop: () => beep({ freq: 240, dur: 0.09, type: "triangle", gain: 0.05, slide: 220 }),
    dash: () => {
      beep({ freq: 180, dur: 0.12, type: "sawtooth", gain: 0.04, slide: 400 });
      noiseBurst(0.06, 0.025);
    },
    attack: () => {
      beep({ freq: 100, dur: 0.1, type: "sawtooth", gain: 0.05, slide: -30 });
      beep({ freq: 420, dur: 0.07, type: "square", gain: 0.03 });
    },
    super: () => {
      noiseBurst(0.2, 0.05);
      beep({ freq: 60, dur: 0.4, type: "sawtooth", gain: 0.08, slide: 500 });
      beep({ freq: 300, dur: 0.3, type: "square", gain: 0.04, slide: 600 });
    },
    hit: () => beep({ freq: 90, dur: 0.12, type: "sawtooth", gain: 0.055, slide: -40 }),
    collect: () => beep({ freq: 700, dur: 0.07, type: "sine", gain: 0.04, slide: 300 }),
    hurt: () => beep({ freq: 140, dur: 0.22, type: "square", gain: 0.05, slide: -90 }),
    rage: () => {
      beep({ freq: 70, dur: 0.35, type: "sawtooth", gain: 0.08, slide: 280 });
      beep({ freq: 280, dur: 0.28, type: "triangle", gain: 0.045, slide: 400 });
    },
    wave: () => beep({ freq: 440, dur: 0.14, type: "sine", gain: 0.04, slide: 280 }),
    die: () => {
      noiseBurst(0.35, 0.06);
      beep({ freq: 100, dur: 0.55, type: "sawtooth", gain: 0.07, slide: -70 });
    },
    combo: (n) => beep({ freq: 300 + n * 40, dur: 0.06, type: "square", gain: 0.03, slide: 100 }),
    power: () => {
      beep({ freq: 500, dur: 0.15, type: "sine", gain: 0.05, slide: 400 });
      beep({ freq: 800, dur: 0.12, type: "triangle", gain: 0.03 });
    },
    boss: () => {
      beep({ freq: 55, dur: 0.5, type: "sawtooth", gain: 0.09, slide: 40 });
      noiseBurst(0.25, 0.05);
    },
  };

  // --- Input ---
  const keys = new Set();
  const mouse = { x: W / 2, y: H / 2 };
  const stick = { x: 0, y: 0, active: false };

  window.addEventListener("keydown", (e) => {
    keys.add(e.code);
    if (["Space", "ArrowUp", "ArrowDown", "ArrowLeft", "ArrowRight", "ShiftLeft", "ShiftRight"].includes(e.code)) {
      e.preventDefault();
    }
    if (e.code === "KeyM") setMuted(!muted);
    if (e.code === "KeyP" && state.mode === "play") togglePause();
    if (e.code === "KeyP" && state.mode === "pause") togglePause();
    if (state.mode !== "play") return;
    if (e.code === "KeyJ" || e.code === "KeyZ") player.tryAttack();
    if (e.code === "Space" || e.code === "KeyK") player.tryHop();
    if (e.code === "ShiftLeft" || e.code === "ShiftRight" || e.code === "KeyL") player.tryDash();
    if (e.code === "KeyX" || e.code === "KeyE") player.trySuper();
  });
  window.addEventListener("keyup", (e) => keys.delete(e.code));

  canvas.addEventListener("mousemove", (e) => {
    const r = canvas.getBoundingClientRect();
    mouse.x = ((e.clientX - r.left) / r.width) * W;
    mouse.y = ((e.clientY - r.top) / r.height) * H;
  });
  canvas.addEventListener("mousedown", () => {
    if (state.mode === "play") player.tryAttack();
  });

  const stickBase = document.getElementById("stick-base");
  function setStickFromEvent(e, end = false) {
    if (!stickBase) return;
    const t = e.changedTouches ? e.changedTouches[0] : e;
    const r = stickBase.getBoundingClientRect();
    const cx = r.left + r.width / 2;
    const cy = r.top + r.height / 2;
    if (end) {
      stick.x = 0;
      stick.y = 0;
      stick.active = false;
      el.stickKnob.style.transform = "translate(-50%, -50%)";
      return;
    }
    let dx = t.clientX - cx;
    let dy = t.clientY - cy;
    const max = r.width * 0.35;
    const len = Math.hypot(dx, dy) || 1;
    if (len > max) {
      dx = (dx / len) * max;
      dy = (dy / len) * max;
    }
    stick.x = dx / max;
    stick.y = dy / max;
    stick.active = true;
    el.stickKnob.style.transform = `translate(calc(-50% + ${dx}px), calc(-50% + ${dy}px))`;
  }
  stickBase?.addEventListener("touchstart", (e) => { e.preventDefault(); setStickFromEvent(e); }, { passive: false });
  stickBase?.addEventListener("touchmove", (e) => { e.preventDefault(); setStickFromEvent(e); }, { passive: false });
  stickBase?.addEventListener("touchend", (e) => { e.preventDefault(); setStickFromEvent(e, true); }, { passive: false });

  document.getElementById("btn-hop")?.addEventListener("touchstart", (e) => {
    e.preventDefault();
    if (state.mode === "play") player.tryHop();
  }, { passive: false });
  document.getElementById("btn-atk")?.addEventListener("touchstart", (e) => {
    e.preventDefault();
    if (state.mode === "play") player.tryAttack();
  }, { passive: false });
  document.getElementById("btn-dash")?.addEventListener("touchstart", (e) => {
    e.preventDefault();
    if (state.mode === "play") player.tryDash();
  }, { passive: false });
  document.getElementById("btn-super")?.addEventListener("touchstart", (e) => {
    e.preventDefault();
    if (state.mode === "play") player.trySuper();
  }, { passive: false });

  if (window.matchMedia("(pointer: coarse)").matches || window.innerWidth < 720) {
    el.touch.classList.remove("hidden");
  }

  // --- FX helpers ---
  const particles = [];
  const trails = [];
  const beams = [];
  const floatTexts = [];
  const shocks = [];
  const meteors = [];
  const minions = [];

  function flashScreen(color = "#fff") {
    el.flash.style.background = color;
    el.flash.classList.remove("bang");
    void el.flash.offsetWidth;
    el.flash.classList.add("bang");
  }

  function announce(text, color = "#b8ff3d") {
    el.announcer.textContent = text;
    el.announcer.style.color = color;
    el.announcer.classList.remove("show");
    void el.announcer.offsetWidth;
    el.announcer.classList.add("show");
  }

  function addFloat(x, y, text, color = "#b8ff3d", size = 16) {
    floatTexts.push({ x, y, text, color, size, life: 1, vy: -55 - Math.random() * 30 });
  }

  function burst(x, y, color, n = 12, speed = 180) {
    for (let i = 0; i < n; i++) {
      const a = Math.random() * Math.PI * 2;
      const sp = speed * (0.4 + Math.random());
      particles.push({
        x, y,
        vx: Math.cos(a) * sp,
        vy: Math.sin(a) * sp,
        life: 0.3 + Math.random() * 0.5,
        size: 2 + Math.random() * 5,
        color,
        gravity: Math.random() < 0.3 ? 120 : 0,
      });
    }
  }

  function ringShock(x, y, color, maxR = 120) {
    shocks.push({ x, y, r: 8, maxR, color, life: 0.4 });
  }

  // --- State ---
  const state = {
    mode: "menu",
    score: 0,
    wave: 1,
    best: Number(localStorage.getItem("voidSlimeBest") || 0),
    time: 0,
    shake: 0,
    zoom: 1,
    zoomTarget: 1,
    chromatic: 0,
    spawnTimer: 0,
    waveKills: 0,
    waveGoal: 8,
    combo: 0,
    comboTimer: 0,
    maxCombo: 0,
    killStreak: 0,
    eventTimer: 8,
    slowMo: 0,
    magnet: 0,
    giant: 0,
    multishot: 0,
    frenzy: 0,
    bossAlive: false,
    hitstop: 0,
    waveRest: 0,
    totalKills: 0,
    displayScore: 0,
    graceSpawn: 0,
  };
  el.best.textContent = String(state.best);

  function diffMul() {
    return difficulty === "chaos" ? 1.35 : 1;
  }

  function nearestEnemy(fromX, fromY, maxDist = 260) {
    let best = null;
    let bestD = maxDist;
    for (const e of enemies) {
      if (e.dead) continue;
      const d = Math.hypot(e.x - fromX, e.y - fromY);
      if (d < bestD) {
        bestD = d;
        best = e;
      }
    }
    return best;
  }

  function hitstop(frames = 0.045) {
    state.hitstop = Math.max(state.hitstop, frames);
  }

  const COMBO_LINES = [
    [5, "NICE!", "#b8ff3d"],
    [10, "COMBO CRAZY!", "#00f0ff"],
    [15, "VOID MADNESS!", "#ff6bcb"],
    [25, "UNHINGED!!!", "#ff9a1f"],
    [40, "GOD SLIME", "#ff4d6d"],
    [60, "REALITY BROKE", "#fff"],
  ];

  const stars = Array.from({ length: 120 }, () => ({
    x: Math.random() * W,
    y: Math.random() * H,
    z: 0.4 + Math.random() * 2,
    s: 0.5 + Math.random() * 2.2,
    hue: Math.random() * 60,
  }));

  const enemies = [];
  const pickups = [];

  const player = {
    x: W / 2,
    y: H / 2,
    vx: 0,
    vy: 0,
    r: 36,
    hp: 100,
    maxHp: 100,
    rage: 0,
    maxRage: 100,
    superMeter: 0,
    maxSuper: 100,
    enraged: false,
    enrageTimer: 0,
    invuln: 0,
    anim: "idle",
    frame: 0,
    frameTimer: 0,
    hopT: 0,
    hopCool: 0,
    atkT: 0,
    atkCool: 0,
    dashT: 0,
    dashCool: 0,
    hurtT: 0,
    facing: 1,
    spinAtk: false,

    reset() {
      Object.assign(this, {
        x: W / 2, y: H / 2, vx: 0, vy: 0,
        hp: 100, maxHp: 100, rage: 0, superMeter: 0,
        enraged: false, enrageTimer: 0, invuln: 0,
        anim: "idle", frame: 0, frameTimer: 0,
        hopT: 0, hopCool: 0, atkT: 0, atkCool: 0,
        dashT: 0, dashCool: 0, hurtT: 0, facing: 1, spinAtk: false,
      });
    },

    sizeMul() {
      let m = this.enraged ? 1.2 : 1;
      if (state.giant > 0) m *= 1.45;
      return m;
    },

    moveDir() {
      let x = 0, y = 0;
      if (keys.has("KeyA") || keys.has("ArrowLeft")) x -= 1;
      if (keys.has("KeyD") || keys.has("ArrowRight")) x += 1;
      if (keys.has("KeyW") || keys.has("ArrowUp")) y -= 1;
      if (keys.has("KeyS") || keys.has("ArrowDown")) y += 1;
      if (stick.active) { x += stick.x; y += stick.y; }
      const len = Math.hypot(x, y);
      if (len > 1) { x /= len; y /= len; }
      else if (len < 0.05) { x = 0; y = 0; }
      return { x, y };
    },

    tryHop() {
      if (this.hopCool > 0 || this.dashT > 0) return;
      this.hopT = 0.38;
      this.hopCool = 0.42;
      this.anim = "hop";
      this.frame = 0;
      const dir = this.moveDir();
      const boost = this.enraged ? 580 : 440;
      this.vx += dir.x * boost * 0.4;
      this.vy += dir.y * boost * 0.4 - 100;
      this.spinAtk = true;
      SFX.hop();
      burst(this.x, this.y + 20, "#a855f7", 8, 100);
    },

    tryDash() {
      if (this.dashCool > 0) return;
      const dir = this.moveDir();
      let dx = dir.x, dy = dir.y;
      if (Math.abs(dx) + Math.abs(dy) < 0.05) {
        dx = this.facing;
        dy = 0;
      }
      const len = Math.hypot(dx, dy) || 1;
      dx /= len; dy /= len;
      const power = this.enraged ? 720 : 560;
      this.vx = dx * power;
      this.vy = dy * power;
      this.dashT = 0.16;
      this.dashCool = 0.55;
      this.invuln = Math.max(this.invuln, 0.18);
      SFX.dash();
      flashScreen("rgba(0,240,255,0.5)");
      state.shake = Math.max(state.shake, 8);
      // dash damages through enemies
      for (const e of enemies) {
        if (e.dead) continue;
        // will check during dash via continuous hit
      }
      for (let i = 0; i < 6; i++) {
        trails.push({
          x: this.x - dx * i * 12,
          y: this.y - dy * i * 12,
          life: 0.25 - i * 0.03,
          size: 90 - i * 8,
          facing: this.facing,
          sprite: this.currentSpriteName(),
        });
      }
    },

    tryAttack() {
      if (this.atkCool > 0) return;
      const multi = state.multishot > 0 || this.enraged;
      this.atkT = multi ? 0.32 : 0.24;
      this.atkCool = this.enraged ? 0.26 : 0.34;
      this.anim = "attack";
      this.frame = 0;
      SFX.attack();
      state.shake = Math.max(state.shake, 5);
      state.zoomTarget = 1.03;

      const range = (this.enraged ? 125 : 90) * this.sizeMul();
      let damage = this.enraged ? 44 : 30;
      if (state.frenzy > 0) damage *= 1.45;
      if (state.giant > 0) damage *= 1.3;
      if (difficulty === "normal") damage *= 1.12;

      // soft auto-aim: face nearest threat if mouse is far from anyone
      const near = nearestEnemy(this.x, this.y, range + 40);
      let aimX = mouse.x;
      let aimY = mouse.y;
      if (near) {
        const mouseNear = nearestEnemy(mouse.x, mouse.y, 100);
        if (!mouseNear) {
          aimX = near.x;
          aimY = near.y;
        }
        if (near.x >= this.x) this.facing = 1;
        else this.facing = -1;
      }

      let hits = this.aoeHit(this.x, this.y, range, damage);

      if (multi) {
        const ang = Math.atan2(aimY - this.y, aimX - this.x);
        for (let i = -1; i <= 1; i++) {
          const a = ang + i * 0.55;
          const tx = this.x + Math.cos(a) * range * 0.85;
          const ty = this.y + Math.sin(a) * range * 0.85;
          beams.push({ x1: this.x, y1: this.y, x2: tx, y2: ty, life: 0.18, color: "#b8ff3d" });
          hits += this.aoeHit(tx, ty, range * 0.55, damage * 0.7);
        }
      }

      ringShock(this.x, this.y, this.enraged ? "#ff9a1f" : "#b8ff3d", range);
      if (hits) {
        SFX.hit();
        hitstop(hits >= 3 ? 0.06 : 0.035);
        this.superMeter = Math.min(this.maxSuper, this.superMeter + hits * 5);
        state.zoomTarget = 1.05;
      }
    },

    trySuper() {
      if (this.superMeter < this.maxSuper && !this.enraged) return;
      if (this.superMeter < 40 && this.enraged) return;
      const cost = this.enraged ? 40 : this.maxSuper;
      this.superMeter = Math.max(0, this.superMeter - cost);
      this.atkT = 0.45;
      this.anim = "attack";
      this.invuln = Math.max(this.invuln, 0.4);
      SFX.super();
      flashScreen("#00f0ff");
      state.shake = 22;
      state.zoomTarget = 1.12;
      state.chromatic = 0.5;
      announce("VOID NOVA!!!", "#00f0ff");

      // massive nova
      const range = 220 * this.sizeMul();
      let kills = 0;
      for (const e of enemies) {
        if (e.dead) continue;
        const d = Math.hypot(e.x - this.x, e.y - this.y);
        if (d < range + e.r) {
          e.hp -= 120;
          e.flash = 0.2;
          const ang = Math.atan2(e.y - this.y, e.x - this.x);
          e.vx += Math.cos(ang) * 400;
          e.vy += Math.sin(ang) * 400;
          if (e.hp <= 0) {
            killEnemy(e, true);
            kills++;
          }
        }
      }
      // chain lightning leftovers
      chainLightning(this.x, this.y, 5);
      burst(this.x, this.y, "#00f0ff", 50, 320);
      burst(this.x, this.y, "#ff6bcb", 30, 260);
      ringShock(this.x, this.y, "#00f0ff", range);
      ringShock(this.x, this.y, "#ff6bcb", range * 0.6);
      // summon mini army
      for (let i = 0; i < 4; i++) {
        const a = (i / 4) * Math.PI * 2 + Math.random();
        minions.push({
          x: this.x + Math.cos(a) * 40,
          y: this.y + Math.sin(a) * 40,
          life: 6,
          atkCool: 0.3 + i * 0.1,
          angle: a,
        });
      }
      if (kills >= 5) announce("MULTI-VOID!", "#ff4d6d");
    },

    aoeHit(x, y, range, damage) {
      let hits = 0;
      for (const e of enemies) {
        if (e.dead) continue;
        if (Math.hypot(e.x - x, e.y - y) < range + e.r) {
          e.hp -= damage;
          e.flash = 0.12;
          const ang = Math.atan2(e.y - y, e.x - x);
          e.vx += Math.cos(ang) * 240;
          e.vy += Math.sin(ang) * 240;
          hits++;
          burst(e.x, e.y, "#b8ff3d", 6, 140);
          if (e.hp <= 0) killEnemy(e);
        }
      }
      return hits;
    },

    takeDamage(amt) {
      if (this.invuln > 0 || this.dashT > 0) return;
      if (this.enraged) amt *= 0.35;
      this.hp -= amt;
      this.hurtT = 0.3;
      this.invuln = difficulty === "normal" ? 0.7 : 0.55;
      this.anim = "hurt";
      this.rage = Math.min(this.maxRage, this.rage + 12);
      state.shake = 10;
      state.chromatic = 0.2;
      state.combo = 0;
      state.comboTimer = 0;
      state.killStreak = 0;
      SFX.hurt();
      hitstop(0.05);
      burst(this.x, this.y, "#ff4d6d", 18, 200);
      flashScreen("rgba(255,40,60,0.35)");
      if (this.hp > 0 && this.hp / this.maxHp < 0.3) {
        showTip("Low HP! Collect green orbs · Dash out · Pop SUPER", 2.5);
      }
      if (this.hp <= 0) {
        this.hp = 0;
        endGame();
      }
    },

    addRage(n) {
      if (this.enraged) return;
      this.rage = Math.min(this.maxRage, this.rage + n);
      if (this.rage >= this.maxRage) {
        this.enraged = true;
        this.enrageTimer = 7.5;
        this.rage = this.maxRage;
        this.invuln = 0.5;
        this.superMeter = Math.min(this.maxSuper, this.superMeter + 40);
        SFX.rage();
        state.shake = 18;
        state.zoomTarget = 1.1;
        flashScreen("#ff9a1f");
        announce("🔥 ENRAGED 🔥", "#ff9a1f");
        burst(this.x, this.y, "#ff9a1f", 40, 280);
      }
    },

    currentSpriteName() {
      if (this.anim === "hurt") return ASSET_NAMES.hurt;
      if (this.anim === "attack") return ASSET_NAMES.attack;
      if (this.anim === "enraged") return ASSET_NAMES.enraged;
      if (this.anim === "hop") {
        const seq = ASSET_NAMES.hop;
        const t = 1 - Math.max(0, this.hopT) / 0.38;
        return seq[Math.min(seq.length - 1, Math.floor(t * seq.length))];
      }
      return ASSET_NAMES.idle[this.frame % ASSET_NAMES.idle.length];
    },

    currentSprite() {
      return images[this.currentSpriteName()];
    },

    hopLift() {
      if (this.hopT <= 0) return 0;
      return Math.sin((1 - this.hopT / 0.38) * Math.PI) * 34;
    },

    update(dt) {
      const dir = this.moveDir();
      let speed = this.enraged ? 300 : 230;
      if (state.frenzy > 0) speed *= 1.35;
      if (this.dashT > 0) speed = 0; // velocity driven

      if (this.dashT <= 0) {
        const targetVx = dir.x * speed;
        const targetVy = dir.y * speed;
        this.vx += (targetVx - this.vx) * Math.min(1, 12 * dt);
        this.vy += (targetVy - this.vy) * Math.min(1, 12 * dt);
        if (Math.abs(dir.x) < 0.05 && Math.abs(dir.y) < 0.05) {
          this.vx *= Math.pow(0.015, dt);
          this.vy *= Math.pow(0.015, dt);
        }
      } else {
        this.dashT -= dt;
        // dash trail + pierce
        trails.push({
          x: this.x, y: this.y, life: 0.2, size: 85 * this.sizeMul(),
          facing: this.facing, sprite: this.currentSpriteName(),
        });
        for (const e of enemies) {
          if (e.dead) continue;
          if (Math.hypot(e.x - this.x, e.y - this.y) < this.r * this.sizeMul() + e.r) {
            e.hp -= 35;
            e.flash = 0.1;
            if (e.hp <= 0) killEnemy(e);
            else burst(e.x, e.y, "#00f0ff", 5, 100);
          }
        }
      }

      // hop land smash
      if (this.hopT > 0) {
        this.hopT -= dt;
        if (this.hopT <= 0 && this.spinAtk) {
          this.spinAtk = false;
          this.aoeHit(this.x, this.y, 70 * this.sizeMul(), 18);
          ringShock(this.x, this.y, "#c084fc", 70);
          burst(this.x, this.y, "#c084fc", 12, 140);
          state.shake = Math.max(state.shake, 5);
        }
      }

      if (this.hopCool > 0) this.hopCool -= dt;
      if (this.atkCool > 0) this.atkCool -= dt;
      if (this.dashCool > 0) this.dashCool -= dt;
      if (this.atkT > 0) this.atkT -= dt;
      if (this.hurtT > 0) this.hurtT -= dt;
      if (this.invuln > 0) this.invuln -= dt;

      if (this.enraged) {
        this.enrageTimer -= dt;
        this.rage = (this.enrageTimer / 7.5) * this.maxRage;
        // enraged auto drip damage aura
        if (Math.floor(state.time * 8) !== Math.floor((state.time - dt) * 8)) {
          this.aoeHit(this.x, this.y, 55 * this.sizeMul(), 6);
        }
        if (this.enrageTimer <= 0) {
          this.enraged = false;
          this.rage = 0;
        }
      }

      this.x += this.vx * dt;
      this.y += this.vy * dt;
      const pad = 36;
      this.x = Math.max(pad, Math.min(W - pad, this.x));
      this.y = Math.max(pad + 16, Math.min(H - pad, this.y));

      if (dir.x > 0.1) this.facing = 1;
      if (dir.x < -0.1) this.facing = -1;

      // motion trail when fast
      if (Math.hypot(this.vx, this.vy) > 220 && Math.random() < 0.5) {
        trails.push({
          x: this.x, y: this.y, life: 0.15, size: 70 * this.sizeMul(),
          facing: this.facing, sprite: this.currentSpriteName(),
        });
      }

      if (this.hurtT > 0) this.anim = "hurt";
      else if (this.atkT > 0) this.anim = "attack";
      else if (this.hopT > 0) this.anim = "hop";
      else if (this.enraged) this.anim = "enraged";
      else this.anim = "idle";

      this.frameTimer += dt;
      if (this.frameTimer > 1 / (state.frenzy > 0 ? 12 : 8)) {
        this.frameTimer = 0;
        this.frame++;
      }
    },

    draw() {
      const img = this.currentSprite();
      if (!img) return;
      const lift = this.hopLift();
      const size = 100 * this.sizeMul();
      const blink = this.invuln > 0 && Math.floor(this.invuln * 20) % 2 === 0;

      ctx.save();
      ctx.globalAlpha = 0.28;
      ctx.fillStyle = "#000";
      ctx.beginPath();
      ctx.ellipse(this.x, this.y + size * 0.3, size * 0.28, 11, 0, 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();

      if (blink) return;

      ctx.save();
      ctx.translate(this.x, this.y - lift);
      ctx.scale(this.facing, 1);
      if (this.enraged) { ctx.shadowColor = "#ff9a1f"; ctx.shadowBlur = 36; }
      else if (this.dashT > 0) { ctx.shadowColor = "#00f0ff"; ctx.shadowBlur = 30; }
      else if (this.atkT > 0) { ctx.shadowColor = "#b8ff3d"; ctx.shadowBlur = 22; }
      else { ctx.shadowColor = "#7c3aed"; ctx.shadowBlur = 14; }
      ctx.drawImage(img, -size / 2, -size / 2, size, size);
      ctx.restore();

      if (this.atkT > 0) {
        const p = 1 - this.atkT / 0.32;
        ctx.save();
        ctx.globalAlpha = 0.5 * (1 - p);
        ctx.strokeStyle = this.enraged ? "#ff9a1f" : "#b8ff3d";
        ctx.lineWidth = 4;
        ctx.beginPath();
        ctx.arc(this.x, this.y, (this.enraged ? 120 : 82) * this.sizeMul() * (0.45 + p * 0.7), 0, Math.PI * 2);
        ctx.stroke();
        ctx.restore();
      }
    },
  };

  function addCombo() {
    state.combo++;
    state.comboTimer = 2.4;
    state.killStreak++;
    state.maxCombo = Math.max(state.maxCombo, state.combo);
    SFX.combo(Math.min(state.combo, 20));
    for (const [n, text, color] of COMBO_LINES) {
      if (state.combo === n) {
        announce(text, color);
        flashScreen(color);
        state.shake = 10 + n * 0.3;
      }
    }
  }

  function scorePoints(base, x, y) {
    const mult = 1 + Math.floor(state.combo / 5) * 0.35 + (player.enraged ? 0.5 : 0);
    const pts = Math.floor(base * mult * (state.frenzy > 0 ? 1.5 : 1));
    state.score += pts;
    addFloat(x, y - 10, `+${pts}${mult > 1.2 ? "!" : ""}`, mult > 2 ? "#ff6bcb" : "#b8ff3d", 14 + Math.min(12, state.combo));
    return pts;
  }

  function chainLightning(x, y, hops) {
    let cx = x, cy = y;
    let remaining = [...enemies.filter((e) => !e.dead)];
    for (let h = 0; h < hops && remaining.length; h++) {
      remaining.sort((a, b) => Math.hypot(a.x - cx, a.y - cy) - Math.hypot(b.x - cx, b.y - cy));
      const target = remaining.shift();
      if (Math.hypot(target.x - cx, target.y - cy) > 220) break;
      beams.push({ x1: cx, y1: cy, x2: target.x, y2: target.y, life: 0.15, color: "#e0f2fe" });
      target.hp -= 22;
      target.flash = 0.12;
      burst(target.x, target.y, "#e0f2fe", 6, 80);
      cx = target.x;
      cy = target.y;
      if (target.hp <= 0) killEnemy(target);
    }
  }

  function killEnemy(e, fromSuper = false) {
    if (e.dead) return;
    e.dead = true;
    addCombo();
    const base = e.boss ? 250 : e.kind === "brute" ? 45 : e.kind === "bomber" ? 35 : e.kind === "shard" ? 22 : 15;
    scorePoints(base, e.x, e.y);
    state.waveKills++;
    state.totalKills++;
    hitstop(e.boss ? 0.1 : 0.04);
    player.addRage(e.boss ? 35 : e.kind === "brute" ? 16 : 9);
    player.superMeter = Math.min(player.maxSuper, player.superMeter + (e.boss ? 30 : 8));
    // small heal chip on kill in normal — keeps flow friendly
    if (difficulty === "normal" && Math.random() < 0.18) {
      player.hp = Math.min(player.maxHp, player.hp + 4);
    }

    burst(e.x, e.y, e.boss ? "#ff4d6d" : e.kind === "shard" ? "#67e8f9" : "#c084fc", e.boss ? 40 : 14, e.boss ? 300 : 160);
    if (e.boss) {
      state.bossAlive = false;
      announce("BOSS DOWN!!!", "#ff4d6d");
      flashScreen("#ff4d6d");
      state.shake = 28;
      // jackpot pickups
      for (let i = 0; i < 6; i++) {
        pickups.push({
          x: e.x + (Math.random() - 0.5) * 80,
          y: e.y + (Math.random() - 0.5) * 80,
          t: 0, life: 12,
          kind: ["mini", "heal", "power"][i % 3],
          power: ["frenzy", "giant", "multishot", "magnet", "slow"][Math.floor(Math.random() * 5)],
        });
      }
    }

    // bomber splits
    if (e.kind === "bomber" && !fromSuper) {
      ringShock(e.x, e.y, "#fb923c", 90);
      for (const o of enemies) {
        if (!o.dead && Math.hypot(o.x - e.x, o.y - e.y) < 90) {
          o.hp -= 25;
          if (o.hp <= 0) killEnemy(o);
        }
      }
      if (Math.hypot(player.x - e.x, player.y - e.y) < 90) player.takeDamage(14);
      // spawn 2 shards
      for (let i = 0; i < 2; i++) spawnEnemyAt(e.x, e.y, "shard");
    }

    if (Math.random() < (e.boss ? 1 : 0.32)) {
      const roll = Math.random();
      let kind = "mini";
      let power = null;
      if (roll < 0.25) kind = "heal";
      else if (roll < 0.55) {
        kind = "power";
        power = ["frenzy", "giant", "multishot", "magnet", "slow"][Math.floor(Math.random() * 5)];
      }
      pickups.push({ x: e.x, y: e.y, t: 0, life: 9, kind, power });
    }

    // chance chain on big combos
    if (state.combo > 0 && state.combo % 7 === 0) {
      chainLightning(e.x, e.y, 3);
    }

    if (state.waveKills >= state.waveGoal && !state.bossAlive) nextWave();
  }

  function applyPower(power) {
    SFX.power();
    flashScreen("#ffe566");
    if (power === "frenzy") {
      state.frenzy = 8;
      announce("FRENZY!!!", "#ff4d6d");
    } else if (power === "giant") {
      state.giant = 9;
      announce("GIGA SLIME", "#b8ff3d");
    } else if (power === "multishot") {
      state.multishot = 10;
      announce("TRIPLE TENDRILS", "#00f0ff");
    } else if (power === "magnet") {
      state.magnet = 12;
      announce("VOID MAGNET", "#c084fc");
    } else if (power === "slow") {
      state.slowMo = 5;
      announce("BULLET TIME", "#67e8f9");
    }
    updateBuffChips();
  }

  function updateBuffChips() {
    const chips = [];
    if (state.frenzy > 0) chips.push(["FRENZY", "#ff4d6d", state.frenzy]);
    if (state.giant > 0) chips.push(["GIGA", "#b8ff3d", state.giant]);
    if (state.multishot > 0) chips.push(["x3 ATK", "#00f0ff", state.multishot]);
    if (state.magnet > 0) chips.push(["MAGNET", "#c084fc", state.magnet]);
    if (state.slowMo > 0) chips.push(["SLOW-MO", "#67e8f9", state.slowMo]);
    if (player.enraged) chips.push(["ENRAGED", "#ff9a1f", player.enrageTimer]);
    el.buffs.innerHTML = chips
      .map(([n, c, t]) => `<span class="buff-chip" style="border-color:${c};color:${c}">${n} ${t.toFixed(0)}s</span>`)
      .join("");
  }

  function spawnEnemyAt(x, y, forceKind) {
    const tier = Math.min(4, Math.floor((state.wave - 1) / 2));
    const kinds = ["wraith", "shard", "brute", "bomber"];
    const kind = forceKind || kinds[Math.min(kinds.length - 1, Math.floor(Math.random() * (1 + tier)))];
    const waveScale = 1 + state.wave * 0.08;

    const defs = {
      wraith: { r: 28, hp: 26, speed: 85, color: "#a855f7", size: 78 },
      shard: { r: 22, hp: 14, speed: 145, color: "#67e8f9", size: 72 },
      brute: { r: 34, hp: 60, speed: 50, color: "#ef4444", size: 96 },
      bomber: { r: 26, hp: 30, speed: 70, color: "#fb923c", size: 80 },
    };
    const d = defs[kind];
    enemies.push({
      kind, spriteKind: kind, x, y, vx: 0, vy: 0, r: d.r,
      hp: d.hp * waveScale, maxHp: d.hp * waveScale,
      speed: d.speed + state.wave * 4,
      flash: 0, dead: false, spin: Math.random() * 10,
      boss: false, color: d.color, size: d.size,
      anim: "idle", frame: Math.floor(Math.random() * 4), frameTimer: Math.random() * 0.2,
      atkAnimT: 0, facing: 1, bob: Math.random() * Math.PI * 2,
    });
  }

  function spawnEnemy() {
    const edge = Math.floor(Math.random() * 4);
    let x, y;
    if (edge === 0) { x = -30; y = Math.random() * H; }
    else if (edge === 1) { x = W + 30; y = Math.random() * H; }
    else if (edge === 2) { x = Math.random() * W; y = -30; }
    else { x = Math.random() * W; y = H + 30; }
    spawnEnemyAt(x, y);
  }

  function spawnBoss() {
    state.bossAlive = true;
    SFX.boss();
    announce("⚠ BOSS INCOMING ⚠", "#ff4d6d");
    flashScreen("#7f1d1d");
    state.shake = 20;
    enemies.push({
      kind: "brute",
      spriteKind: "boss",
      x: W / 2,
      y: -60,
      vx: 0, vy: 0,
      r: 52,
      hp: 280 + state.wave * 60,
      maxHp: 280 + state.wave * 60,
      speed: 55 + state.wave * 2,
      flash: 0, dead: false, spin: 0,
      boss: true, color: "#ff0033",
      size: 140,
      shootTimer: 1.5,
      anim: "idle", frame: 0, frameTimer: 0,
      atkAnimT: 0, facing: 1, bob: 0,
    });
  }

  function nextWave() {
    state.wave++;
    state.waveKills = 0;
    state.waveGoal = difficulty === "chaos"
      ? 8 + state.wave * 3
      : 6 + state.wave * 2;
    state.spawnTimer = 1.1;
    state.waveRest = 1.35;
    state.graceSpawn = 1.1;
    SFX.wave();
    showWaveBanner(`WAVE ${state.wave}`);
    announce(state.wave % 5 === 0 ? "BOSS WAVE" : `WAVE ${state.wave}`, "#d8b4ff");
    state.zoomTarget = 1.05;
    player.superMeter = Math.min(player.maxSuper, player.superMeter + 18);
    player.hp = Math.min(player.maxHp, player.hp + (difficulty === "normal" ? 14 : 8));
    // clear leftover meteors for readability
    meteors.length = 0;

    if (state.wave % 5 === 0) {
      setTimeout(() => {
        if (state.mode === "play") spawnBoss();
      }, 900);
    }
    // events less spammy in normal
    const chance = difficulty === "chaos" ? 0.45 : 0.22;
    if (state.wave > 2 && Math.random() < chance) {
      setTimeout(() => {
        if (state.mode === "play") triggerEvent();
      }, 1400);
    }

    if (state.wave === 2) showTip("Dash (Shift) pierces enemies — use it to escape and score");
    if (state.wave === 3) showTip("Yellow stars = power-ups · Mini slimes join your army");
    if (state.wave === 5) showTip("Boss time — dodge red shots, save SUPER for big damage");
  }

  function triggerEvent() {
    const events = ["meteors", "swarm", "healrain", "hyper"];
    const ev = events[Math.floor(Math.random() * events.length)];
    if (ev === "meteors") {
      announce("METEOR STORM!", "#fb923c");
      for (let i = 0; i < 10; i++) {
        meteors.push({
          x: Math.random() * W,
          y: -40 - Math.random() * 200,
          vx: (Math.random() - 0.5) * 80,
          vy: 220 + Math.random() * 160,
          r: 10 + Math.random() * 10,
          life: 4,
        });
      }
    } else if (ev === "swarm") {
      announce("SWARM!!!", "#c084fc");
      for (let i = 0; i < 8; i++) spawnEnemy();
    } else if (ev === "healrain") {
      announce("SLIME RAIN", "#5dffb0");
      for (let i = 0; i < 5; i++) {
        pickups.push({
          x: 80 + Math.random() * (W - 160),
          y: 80 + Math.random() * (H - 160),
          t: 0, life: 10, kind: Math.random() < 0.5 ? "heal" : "mini",
        });
      }
    } else {
      announce("HYPER MODE", "#ff6bcb");
      applyPower("frenzy");
      state.multishot = Math.max(state.multishot, 6);
    }
  }

  function updateEnemies(dt) {
    const slow = state.slowMo > 0 ? 0.4 : 1;
    for (const e of enemies) {
      if (e.dead) continue;
      e.spin += dt * 3;
      e.bob += dt * (e.kind === "wraith" ? 4 : e.kind === "shard" ? 6 : 3);
      if (e.flash > 0) e.flash -= dt;
      if (e.atkAnimT > 0) e.atkAnimT -= dt;

      const dx = player.x - e.x;
      const dy = player.y - e.y;
      const d = Math.hypot(dx, dy) || 1;
      const speed = e.speed * slow;
      e.vx += ((dx / d) * speed - e.vx) * 3 * dt;
      e.vy += ((dy / d) * speed - e.vy) * 3 * dt;
      e.vx += Math.sin(e.spin * 2) * 20 * dt;
      e.vy += Math.cos(e.spin * 1.7) * 20 * dt;
      e.x += e.vx * dt;
      e.y += e.vy * dt;

      if (e.vx > 20) e.facing = 1;
      else if (e.vx < -20) e.facing = -1;

      // animation state
      e.frameTimer += dt;
      const fps = e.kind === "shard" ? 10 : e.kind === "wraith" ? 7 : 6;
      if (e.frameTimer > 1 / fps) {
        e.frameTimer = 0;
        e.frame++;
      }
      if (e.flash > 0.05) e.anim = "hurt";
      else if (e.atkAnimT > 0) e.anim = "attack";
      else e.anim = "idle";

      // attack when close
      if (d < 90 && e.atkAnimT <= 0 && e.flash <= 0 && Math.random() < 0.02) {
        e.atkAnimT = 0.35;
      }

      if (e.boss) {
        e.shootTimer -= dt;
        if (e.shootTimer <= 0) {
          e.shootTimer = 1.2;
          e.atkAnimT = 0.5;
          for (let i = 0; i < 6; i++) {
            const a = (i / 6) * Math.PI * 2 + e.spin;
            meteors.push({
              x: e.x, y: e.y,
              vx: Math.cos(a) * 180,
              vy: Math.sin(a) * 180,
              r: 8, life: 2.5, hostile: true,
            });
          }
          ringShock(e.x, e.y, "#ff4d6d", 60);
        }
      }

      const hitR = player.r * 0.48 * player.sizeMul() + e.r * 0.9;
      if (Math.hypot(e.x - player.x, e.y - player.y) < hitR) {
        e.atkAnimT = Math.max(e.atkAnimT, 0.25);
        let dmg = e.boss ? 20 : e.kind === "brute" ? 14 : e.kind === "bomber" ? 11 : e.kind === "shard" ? 8 : 10;
        if (difficulty === "normal") dmg = Math.ceil(dmg * 0.8);
        player.takeDamage(dmg);
        const ang = Math.atan2(player.y - e.y, player.x - e.x);
        player.vx += Math.cos(ang) * 220;
        player.vy += Math.sin(ang) * 220;
        e.vx -= Math.cos(ang) * 180;
        e.vy -= Math.sin(ang) * 180;
      }
    }
    for (let i = enemies.length - 1; i >= 0; i--) {
      if (enemies[i].dead) enemies.splice(i, 1);
    }
  }

  function drawEnemy(e) {
    const img = enemySprite(e);
    const size = e.size || 80;
    // soft float bob for floaters
    let lift = 0;
    if (e.kind === "wraith" || e.kind === "shard" || e.boss) {
      lift = Math.sin(e.bob) * (e.boss ? 6 : 5);
    } else if (e.kind === "bomber") {
      lift = Math.sin(e.bob * 1.4) * 3;
    }

    // shadow
    ctx.save();
    ctx.globalAlpha = 0.28;
    ctx.fillStyle = "#000";
    ctx.beginPath();
    ctx.ellipse(e.x, e.y + size * 0.32, size * 0.22, 9, 0, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();

    if (img) {
      ctx.save();
      ctx.translate(e.x, e.y - lift);
      ctx.scale(e.facing || 1, 1);
      // glow aura
      ctx.shadowColor = e.color || "#a855f7";
      ctx.shadowBlur = e.boss ? 28 : e.anim === "attack" ? 22 : 12;
      if (e.flash > 0) {
        ctx.globalAlpha = 0.85 + 0.15 * Math.sin(state.time * 40);
        ctx.filter = "brightness(1.8) saturate(0.5)";
      }
      // bomber pulse when near death / attack
      let drawSize = size;
      if (e.kind === "bomber" && (e.anim === "attack" || e.hp < e.maxHp * 0.4)) {
        drawSize *= 1 + 0.06 * Math.sin(state.time * 18);
      }
      if (e.anim === "attack") drawSize *= 1.08;
      ctx.drawImage(img, -drawSize / 2, -drawSize / 2, drawSize, drawSize);
      ctx.filter = "none";
      ctx.restore();
    } else {
      // fallback blob if sprite missing
      ctx.save();
      ctx.translate(e.x, e.y);
      ctx.fillStyle = e.color || "#a855f7";
      ctx.beginPath();
      ctx.arc(0, 0, e.r, 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();
    }

    // HP bar
    if (e.hp < e.maxHp) {
      const bw = e.boss ? 70 : 40;
      ctx.fillStyle = "rgba(0,0,0,0.55)";
      ctx.fillRect(e.x - bw / 2, e.y - size * 0.52 - lift, bw, 5);
      ctx.fillStyle = e.boss ? "#ff4d6d" : "#f43f5e";
      ctx.fillRect(e.x - bw / 2, e.y - size * 0.52 - lift, bw * (e.hp / e.maxHp), 5);
    }
    if (e.boss) {
      ctx.fillStyle = "#fff";
      ctx.font = "bold 11px Orbitron, sans-serif";
      ctx.textAlign = "center";
      ctx.shadowColor = "#ff0033";
      ctx.shadowBlur = 8;
      ctx.fillText("VOID OVERLORD", e.x, e.y - size * 0.55 - lift - 8);
      ctx.shadowBlur = 0;
    }
  }

  function updatePickups(dt) {
    for (let i = pickups.length - 1; i >= 0; i--) {
      const p = pickups[i];
      p.t += dt;
      p.life -= dt;
      if (p.life <= 0) { pickups.splice(i, 1); continue; }

      // magnet power + soft always-on pull when close
      {
        const dx = player.x - p.x;
        const dy = player.y - p.y;
        const d = Math.hypot(dx, dy) || 1;
        if (state.magnet > 0) {
          p.x += (dx / d) * 300 * dt;
          p.y += (dy / d) * 300 * dt;
        } else if (d < 120) {
          p.x += (dx / d) * 90 * dt;
          p.y += (dy / d) * 90 * dt;
        }
      }

      if (Math.hypot(p.x - player.x, p.y - player.y) < 56 * player.sizeMul()) {
        if (p.kind === "heal") {
          player.hp = Math.min(player.maxHp, player.hp + 28);
          addFloat(p.x, p.y, "+HP", "#5dffb0");
        } else if (p.kind === "power") {
          applyPower(p.power);
        } else {
          scorePoints(60, p.x, p.y);
          player.addRage(14);
          player.superMeter = Math.min(player.maxSuper, player.superMeter + 12);
          // spawn friendly mini
          minions.push({
            x: p.x, y: p.y, life: 8, atkCool: 0.2, angle: Math.random() * Math.PI * 2,
          });
          addFloat(p.x, p.y, "MINI ARMY!", "#b8ff3d");
        }
        SFX.collect();
        burst(p.x, p.y, "#b8ff3d", 12, 120);
        pickups.splice(i, 1);
      }
    }
  }

  function drawPickups() {
    for (const p of pickups) {
      const bob = Math.sin(p.t * 6) * 7;
      const fade = p.life < 2 ? 0.4 + 0.6 * Math.abs(Math.sin(p.t * 14)) : 1;
      ctx.save();
      ctx.globalAlpha = fade;
      if (p.kind === "mini" && images[ASSET_NAMES.mini]) {
        const s = 54;
        ctx.drawImage(images[ASSET_NAMES.mini], p.x - s / 2, p.y - s / 2 + bob, s, s);
      } else if (p.kind === "power") {
        ctx.fillStyle = "#ffe566";
        ctx.shadowColor = "#ffe566";
        ctx.shadowBlur = 16;
        ctx.beginPath();
        for (let i = 0; i < 5; i++) {
          const a = -Math.PI / 2 + (i * 2 * Math.PI) / 5;
          const r = i === 0 ? 14 : 14;
          // star
        }
        // simple glowing diamond
        ctx.translate(p.x, p.y + bob);
        ctx.rotate(p.t * 3);
        ctx.fillRect(-10, -10, 20, 20);
        ctx.fillStyle = "#fff";
        ctx.font = "bold 10px Orbitron";
        ctx.textAlign = "center";
        ctx.rotate(-p.t * 3);
        ctx.fillText("PWR", 0, 4);
      } else {
        ctx.fillStyle = "#5dffb0";
        ctx.shadowColor = "#5dffb0";
        ctx.shadowBlur = 14;
        ctx.beginPath();
        ctx.arc(p.x, p.y + bob, 11, 0, Math.PI * 2);
        ctx.fill();
        ctx.fillStyle = "#fff";
        ctx.font = "bold 12px Orbitron";
        ctx.textAlign = "center";
        ctx.fillText("+", p.x, p.y + bob + 4);
      }
      ctx.restore();
    }
  }

  function updateMinions(dt) {
    for (let i = minions.length - 1; i >= 0; i--) {
      const m = minions[i];
      m.life -= dt;
      m.angle += dt * 2.5;
      // orbit player loosely and chase nearest enemy
      let tx = player.x + Math.cos(m.angle) * 70;
      let ty = player.y + Math.sin(m.angle) * 70;
      let nearest = null;
      let nd = 9999;
      for (const e of enemies) {
        if (e.dead) continue;
        const d = Math.hypot(e.x - m.x, e.y - m.y);
        if (d < nd) { nd = d; nearest = e; }
      }
      if (nearest && nd < 200) {
        tx = nearest.x;
        ty = nearest.y;
      }
      m.x += (tx - m.x) * 4 * dt;
      m.y += (ty - m.y) * 4 * dt;
      m.atkCool -= dt;
      if (m.atkCool <= 0 && nearest && nd < 36) {
        m.atkCool = 0.35;
        nearest.hp -= 12;
        nearest.flash = 0.08;
        burst(nearest.x, nearest.y, "#b8ff3d", 4, 60);
        if (nearest.hp <= 0) killEnemy(nearest);
      }
      if (m.life <= 0) minions.splice(i, 1);
    }
  }

  function drawMinions() {
    const img = images[ASSET_NAMES.mini];
    for (const m of minions) {
      const s = 40;
      if (img) ctx.drawImage(img, m.x - s / 2, m.y - s / 2, s, s);
      else {
        ctx.fillStyle = "#b8ff3d";
        ctx.beginPath();
        ctx.arc(m.x, m.y, 12, 0, Math.PI * 2);
        ctx.fill();
      }
    }
  }

  function updateMeteors(dt) {
    for (let i = meteors.length - 1; i >= 0; i--) {
      const m = meteors[i];
      m.life -= dt;
      m.x += m.vx * dt;
      m.y += m.vy * dt;
      particles.push({
        x: m.x, y: m.y, vx: -m.vx * 0.1, vy: -m.vy * 0.1,
        life: 0.2, size: 3, color: m.hostile ? "#ff4d6d" : "#fb923c", gravity: 0,
      });
      if (Math.hypot(m.x - player.x, m.y - player.y) < m.r + player.r * 0.45 * player.sizeMul()) {
        player.takeDamage(m.hostile ? 12 : 10);
        burst(m.x, m.y, "#fb923c", 10, 120);
        meteors.splice(i, 1);
        continue;
      }
      // player can destroy meteors while attacking
      if (player.atkT > 0 && Math.hypot(m.x - player.x, m.y - player.y) < 90 * player.sizeMul()) {
        scorePoints(5, m.x, m.y);
        burst(m.x, m.y, "#b8ff3d", 8, 100);
        meteors.splice(i, 1);
        continue;
      }
      if (m.life <= 0 || m.y > H + 40 || m.x < -40 || m.x > W + 40) meteors.splice(i, 1);
    }
  }

  function drawMeteors() {
    for (const m of meteors) {
      ctx.save();
      ctx.translate(m.x, m.y);
      ctx.fillStyle = m.hostile ? "#ff4d6d" : "#fb923c";
      ctx.shadowColor = m.hostile ? "#ff4d6d" : "#fb923c";
      ctx.shadowBlur = 16;
      ctx.beginPath();
      ctx.arc(0, 0, m.r, 0, Math.PI * 2);
      ctx.fill();
      ctx.fillStyle = "#fff7ed";
      ctx.beginPath();
      ctx.arc(-2, -2, m.r * 0.4, 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();
    }
  }

  function updateFX(dt) {
    for (let i = particles.length - 1; i >= 0; i--) {
      const p = particles[i];
      p.life -= dt;
      p.x += p.vx * dt;
      p.y += p.vy * dt;
      if (p.gravity) p.vy += p.gravity * dt;
      p.vx *= 0.97;
      p.vy *= 0.97;
      if (p.life <= 0) particles.splice(i, 1);
    }
    for (let i = trails.length - 1; i >= 0; i--) {
      trails[i].life -= dt;
      if (trails[i].life <= 0) trails.splice(i, 1);
    }
    for (let i = beams.length - 1; i >= 0; i--) {
      beams[i].life -= dt;
      if (beams[i].life <= 0) beams.splice(i, 1);
    }
    for (let i = shocks.length - 1; i >= 0; i--) {
      const s = shocks[i];
      s.life -= dt;
      s.r += (s.maxR - s.r) * 10 * dt;
      if (s.life <= 0) shocks.splice(i, 1);
    }
    for (let i = floatTexts.length - 1; i >= 0; i--) {
      const f = floatTexts[i];
      f.life -= dt;
      f.y += f.vy * dt;
      if (f.life <= 0) floatTexts.splice(i, 1);
    }
  }

  function drawFX() {
    // trails
    for (const t of trails) {
      const img = images[t.sprite];
      if (!img) continue;
      ctx.save();
      ctx.globalAlpha = Math.max(0, t.life * 2) * 0.35;
      ctx.translate(t.x, t.y);
      ctx.scale(t.facing, 1);
      ctx.drawImage(img, -t.size / 2, -t.size / 2, t.size, t.size);
      ctx.restore();
    }
    // beams
    for (const b of beams) {
      ctx.save();
      ctx.globalAlpha = Math.max(0, b.life * 5);
      ctx.strokeStyle = b.color;
      ctx.lineWidth = 3;
      ctx.shadowColor = b.color;
      ctx.shadowBlur = 12;
      ctx.beginPath();
      ctx.moveTo(b.x1, b.y1);
      // jagged lightning
      const midx = (b.x1 + b.x2) / 2 + (Math.random() - 0.5) * 20;
      const midy = (b.y1 + b.y2) / 2 + (Math.random() - 0.5) * 20;
      ctx.lineTo(midx, midy);
      ctx.lineTo(b.x2, b.y2);
      ctx.stroke();
      ctx.restore();
    }
    for (const s of shocks) {
      ctx.save();
      ctx.globalAlpha = Math.max(0, s.life * 2);
      ctx.strokeStyle = s.color;
      ctx.lineWidth = 3;
      ctx.beginPath();
      ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
      ctx.stroke();
      ctx.restore();
    }
    for (const p of particles) {
      ctx.globalAlpha = Math.max(0, p.life / 0.5);
      ctx.fillStyle = p.color;
      ctx.beginPath();
      ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
      ctx.fill();
    }
    ctx.globalAlpha = 1;
    for (const f of floatTexts) {
      ctx.globalAlpha = Math.max(0, f.life);
      ctx.fillStyle = f.color;
      ctx.font = `bold ${f.size}px Orbitron, sans-serif`;
      ctx.textAlign = "center";
      ctx.strokeStyle = "rgba(0,0,0,0.6)";
      ctx.lineWidth = 3;
      ctx.strokeText(f.text, f.x, f.y);
      ctx.fillText(f.text, f.x, f.y);
    }
    ctx.globalAlpha = 1;
  }

  function drawBackground(dt) {
    const g = ctx.createRadialGradient(W * 0.5, H * 0.4, 20, W * 0.5, H * 0.5, H * 0.8);
    g.addColorStop(0, player.enraged ? "#3b1010" : "#1a0b2e");
    g.addColorStop(0.5, "#0b0618");
    g.addColorStop(1, "#05030c");
    ctx.fillStyle = g;
    ctx.fillRect(0, 0, W, H);

    ctx.save();
    ctx.globalAlpha = 0.14;
    ctx.fillStyle = player.enraged ? "#ef4444" : "#7c3aed";
    ctx.beginPath();
    ctx.ellipse(W * 0.2 + Math.sin(state.time) * 30, H * 0.3, 200, 110, 0.4, 0, Math.PI * 2);
    ctx.fill();
    ctx.fillStyle = "#166534";
    ctx.beginPath();
    ctx.ellipse(W * 0.8, H * 0.7 + Math.cos(state.time * 0.7) * 20, 220, 130, -0.3, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();

    const starSpeed = state.frenzy > 0 ? 2.2 : 1;
    for (const s of stars) {
      s.x -= s.z * 22 * starSpeed * (dt || 0.016);
      if (s.x < 0) { s.x = W; s.y = Math.random() * H; }
      ctx.globalAlpha = 0.3 + s.z * 0.35;
      ctx.fillStyle = `hsl(${280 + s.hue}, 90%, 80%)`;
      ctx.fillRect(s.x, s.y, s.s, s.s);
    }
    ctx.globalAlpha = 1;

    // pulsing arena
    const pulse = 0.12 + 0.08 * Math.sin(state.time * 3);
    ctx.strokeStyle = `rgba(168, 85, 247, ${pulse + 0.1})`;
    ctx.lineWidth = 2;
    ctx.strokeRect(20, 20, W - 40, H - 40);
    ctx.strokeStyle = `rgba(184, 255, 61, ${pulse})`;
    ctx.strokeRect(36, 36, W - 72, H - 72);

    // combo border heat
    if (state.combo >= 10) {
      ctx.save();
      ctx.globalAlpha = 0.15 + 0.1 * Math.sin(state.time * 12);
      ctx.strokeStyle = state.combo >= 25 ? "#ff4d6d" : "#ff6bcb";
      ctx.lineWidth = 8;
      ctx.strokeRect(8, 8, W - 16, H - 16);
      ctx.restore();
    }
  }

  function updateHUD() {
    // smooth score count-up
    state.displayScore += (state.score - state.displayScore) * 0.18;
    if (Math.abs(state.score - state.displayScore) < 1) state.displayScore = state.score;
    el.score.textContent = String(Math.floor(state.displayScore));
    el.wave.textContent = String(state.wave);
    el.combo.textContent = state.combo > 0 ? `x${state.combo}` : "x1";
    el.combo.style.transform = state.combo >= 10 ? `scale(${1 + Math.min(0.4, state.combo * 0.01)})` : "scale(1)";
    el.hpFill.style.width = `${Math.max(0, (player.hp / player.maxHp) * 100)}%`;
    el.rageFill.style.width = `${Math.max(0, (player.rage / player.maxRage) * 100)}%`;
    el.superFill.style.width = `${Math.max(0, (player.superMeter / player.maxSuper) * 100)}%`;

    // ability cooldowns
    const dashR = 1 - Math.max(0, player.dashCool) / 0.55;
    const hopR = 1 - Math.max(0, player.hopCool) / 0.42;
    const atkR = 1 - Math.max(0, player.atkCool) / 0.34;
    const superR = player.superMeter / player.maxSuper;
    if (el.cdDash) el.cdDash.style.width = `${Math.max(0, Math.min(1, dashR)) * 100}%`;
    if (el.cdHop) el.cdHop.style.width = `${Math.max(0, Math.min(1, hopR)) * 100}%`;
    if (el.cdAtk) el.cdAtk.style.width = `${Math.max(0, Math.min(1, atkR)) * 100}%`;
    if (el.cdSuper) el.cdSuper.style.width = `${Math.max(0, Math.min(1, superR)) * 100}%`;
    el.abDash?.classList.toggle("ready", dashR >= 1);
    el.abHop?.classList.toggle("ready", hopR >= 1);
    el.abAtk?.classList.toggle("ready", atkR >= 1);
    el.abSuper?.classList.toggle("ready-super", superR >= 1);
    el.abSuper?.classList.toggle("ready", superR >= 1);

    // low HP vignette
    if (el.vignette) {
      el.vignette.classList.toggle("danger", player.hp > 0 && player.hp / player.maxHp < 0.3);
    }
  }

  function tickBuffs(dt) {
    let dirty = false;
    for (const k of ["frenzy", "giant", "multishot", "magnet", "slowMo"]) {
      if (state[k] > 0) {
        state[k] = Math.max(0, state[k] - dt);
        dirty = true;
      }
    }
    if (state.comboTimer > 0) {
      state.comboTimer -= dt;
      if (state.comboTimer <= 0) {
        state.combo = 0;
        state.killStreak = 0;
      }
    }
    if (dirty || player.enraged) updateBuffChips();
  }

  function startGame() {
    ensureAudio();
    startMusic();
    state.mode = "play";
    state.score = 0;
    state.displayScore = 0;
    state.wave = 1;
    state.waveKills = 0;
    state.waveGoal = difficulty === "chaos" ? 8 : 6;
    state.spawnTimer = 0.8;
    state.time = 0;
    state.shake = 0;
    state.zoom = 1;
    state.zoomTarget = 1;
    state.chromatic = 0;
    state.combo = 0;
    state.comboTimer = 0;
    state.maxCombo = 0;
    state.killStreak = 0;
    state.eventTimer = difficulty === "chaos" ? 8 : 16;
    state.frenzy = state.giant = state.multishot = state.magnet = state.slowMo = 0;
    state.bossAlive = false;
    state.hitstop = 0;
    state.waveRest = 0.6;
    state.graceSpawn = 1.2;
    state.totalKills = 0;
    enemies.length = 0;
    pickups.length = 0;
    particles.length = 0;
    floatTexts.length = 0;
    trails.length = 0;
    beams.length = 0;
    shocks.length = 0;
    meteors.length = 0;
    minions.length = 0;
    tipQueue = [];
    tipTimer = 0;
    player.reset();
    if (difficulty === "normal") {
      player.hp = player.maxHp = 120;
      player.hp = 120;
    } else {
      player.maxHp = 100;
      player.hp = 100;
    }
    el.buffs.innerHTML = "";
    el.overlay.classList.add("hidden");
    el.gameover.classList.add("hidden");
    el.pause.classList.add("hidden");
    el.hud?.classList.remove("hidden");
    el.abilityRow?.classList.remove("hidden");
    el.canvasWrap?.classList.remove("hidden");
    el.newBest?.classList.add("hidden");
    showWaveBanner("WAVE 1");
    announce(difficulty === "chaos" ? "CHAOS MODE" : "FIGHT!", "#b8ff3d");
    showTip("WASD move · J/Click attack · Shift dash · Space hop · X super", 4);
    setTimeout(() => {
      if (state.mode === "play") showTip("Stay moving — combos multiply score. Don't get surrounded.");
    }, 4200);
    if (window.matchMedia("(pointer: coarse)").matches || window.innerWidth < 720) {
      el.touch.classList.remove("hidden");
    }
  }

  function togglePause() {
    if (state.mode === "play") {
      state.mode = "pause";
      el.pause.classList.remove("hidden");
    } else if (state.mode === "pause") {
      state.mode = "play";
      el.pause.classList.add("hidden");
    }
  }

  function endGame() {
    state.mode = "over";
    SFX.die();
    flashScreen("#ff4d6d");
    announce("RUN OVER", "#ff4d6d");
    el.finalScore.textContent = String(state.score);
    el.finalWave.textContent = String(state.wave);
    el.finalCombo.textContent = `x${state.maxCombo}`;
    if (el.finalKills) el.finalKills.textContent = String(state.totalKills);
    if (el.finalTime) el.finalTime.textContent = `${Math.floor(state.time)}s`;
    const isBest = state.score > state.best;
    if (isBest) {
      state.best = state.score;
      localStorage.setItem("voidSlimeBest", String(state.best));
      el.best.textContent = String(state.best);
      el.newBest?.classList.remove("hidden");
    } else {
      el.newBest?.classList.add("hidden");
    }
    el.gameover.classList.remove("hidden");
    el.vignette?.classList.remove("danger");
  }

  function quitToMenu() {
    state.mode = "menu";
    el.pause.classList.add("hidden");
    el.gameover.classList.add("hidden");
    el.overlay.classList.remove("hidden");
    el.buffs.innerHTML = "";
    el.touch?.classList.add("hidden");
    el.tip?.classList.add("hidden");
    el.vignette?.classList.remove("danger");
    stopMusic();
  }

  function showMainMenu() {
    el.loader?.classList.add("hidden");
    el.overlay.classList.remove("hidden");
    el.hud?.classList.remove("hidden");
    el.abilityRow?.classList.remove("hidden");
    el.canvasWrap?.classList.remove("hidden");
    state.mode = "menu";
  }

  document.getElementById("btn-start").addEventListener("click", startGame);
  document.getElementById("btn-retry").addEventListener("click", startGame);
  document.getElementById("btn-resume").addEventListener("click", togglePause);
  document.getElementById("btn-quit").addEventListener("click", quitToMenu);
  document.getElementById("btn-menu").addEventListener("click", quitToMenu);
  document.getElementById("btn-mute")?.addEventListener("click", () => setMuted(!muted));

  document.querySelectorAll(".diff").forEach((btn) => {
    btn.classList.toggle("active", btn.dataset.diff === difficulty);
    btn.addEventListener("click", () => {
      difficulty = btn.dataset.diff;
      localStorage.setItem("voidSlimeDiff", difficulty);
      document.querySelectorAll(".diff").forEach((b) => b.classList.toggle("active", b === btn));
    });
  });

  const titleImg = document.getElementById("title-slime");
  let titleFrame = 0;
  const titleSeq = [...ASSET_NAMES.idle, ASSET_NAMES.attack, ASSET_NAMES.enraged, ASSET_NAMES.hop[2]];
  setInterval(() => {
    if (!assetsReady) return;
    titleFrame = (titleFrame + 1) % titleSeq.length;
    titleImg.src = `assets/${titleSeq[titleFrame]}.png`;
  }, 120);

  let last = performance.now();
  function loop(now) {
    const rawDt = Math.min(0.033, (now - last) / 1000);
    last = now;
    let dt = rawDt;

    // hitstop freezes gameplay briefly for punchier hits
    if (state.mode === "play" && state.hitstop > 0) {
      state.hitstop -= rawDt;
      dt = rawDt * 0.08;
    }

    updateTip(rawDt);

    if (state.mode === "play") {
      state.time += rawDt;
      if (state.shake > 0) state.shake = Math.max(0, state.shake - rawDt * 40);
      // clamp shake so it stays readable
      state.shake = Math.min(state.shake, 18);
      if (state.chromatic > 0) state.chromatic = Math.max(0, state.chromatic - rawDt * 1.4);
      state.zoom += (state.zoomTarget - state.zoom) * 8 * rawDt;
      state.zoomTarget += (1 - state.zoomTarget) * 3.5 * rawDt;

      if (state.waveRest > 0) state.waveRest -= rawDt;
      if (state.graceSpawn > 0) state.graceSpawn -= rawDt;

      player.update(dt);
      updateEnemies(dt);
      updatePickups(dt);
      updateMinions(dt);
      updateMeteors(dt);
      updateFX(dt);
      tickBuffs(dt);

      // spawn pacing — gentler early, rest between waves
      if (state.graceSpawn <= 0 && state.waveRest <= 0) {
        state.spawnTimer -= dt;
        const baseMax = difficulty === "chaos" ? 5 : 3.5;
        const maxEnemies = Math.floor(baseMax + state.wave * (difficulty === "chaos" ? 1.5 : 1.0));
        if (state.spawnTimer <= 0 && enemies.length < maxEnemies) {
          spawnEnemy();
          if ((state.frenzy > 0 || (difficulty === "chaos" && state.wave > 2)) && enemies.length < maxEnemies) {
            spawnEnemy();
          }
          const baseInterval = difficulty === "chaos" ? 1.1 : 1.45;
          state.spawnTimer = Math.max(0.35, baseInterval - state.wave * 0.05);
        }
      }

      state.eventTimer -= rawDt;
      if (state.eventTimer <= 0) {
        state.eventTimer = (difficulty === "chaos" ? 10 : 18) + Math.random() * 8;
        if (state.wave >= 3 && Math.random() < (difficulty === "chaos" ? 0.5 : 0.28)) {
          triggerEvent();
        }
      }

      // enemy speed scale by difficulty (once per frame via soft nudge)
      if (difficulty === "chaos") {
        for (const e of enemies) {
          if (!e.dead && !e._buffed) {
            e.speed *= diffMul() * 0.85;
            e._buffed = true;
          }
        }
      }

      updateHUD();
    } else {
      updateFX(rawDt * 0.5);
    }

    // DRAW
    ctx.save();
    // zoom + shake
    const z = state.mode === "play" ? state.zoom : 1;
    ctx.translate(W / 2, H / 2);
    ctx.scale(z, z);
    ctx.translate(-W / 2, -H / 2);
    if (state.shake > 0) {
      ctx.translate((Math.random() - 0.5) * state.shake, (Math.random() - 0.5) * state.shake);
    }

    // fake chromatic via offset draw layers is expensive; color flash instead
    if (state.chromatic > 0) {
      ctx.save();
      ctx.globalAlpha = state.chromatic * 0.25;
      ctx.fillStyle = "#ff0040";
      ctx.fillRect(-2, 0, W, H);
      ctx.fillStyle = "#00ffff";
      ctx.fillRect(2, 0, W, H);
      ctx.restore();
    }

    drawBackground(dt);

    if (state.mode === "play" || state.mode === "pause" || state.mode === "over") {
      drawPickups();
      drawMeteors();
      drawMinions();
      for (const e of enemies) drawEnemy(e);
      player.draw();
      drawFX();

      // bottom info bar
      ctx.fillStyle = "rgba(0,0,0,0.35)";
      ctx.fillRect(24, H - 52, 220, 28);
      ctx.fillStyle = "rgba(255,255,255,0.7)";
      ctx.font = "12px Orbitron, sans-serif";
      ctx.textAlign = "left";
      ctx.fillText(`WAVE PROGRESS  ${state.waveKills}/${state.waveGoal}`, 36, H - 34);
      // progress pip
      ctx.fillStyle = "rgba(255,255,255,0.12)";
      ctx.fillRect(36, H - 28, 180, 4);
      ctx.fillStyle = "#b8ff3d";
      ctx.fillRect(36, H - 28, 180 * Math.min(1, state.waveKills / Math.max(1, state.waveGoal)), 4);

      if (player.superMeter >= player.maxSuper) {
        ctx.fillStyle = "#00f0ff";
        ctx.font = "bold 13px Orbitron, sans-serif";
        ctx.textAlign = "right";
        const pulse = 0.75 + 0.25 * Math.sin(state.time * 8);
        ctx.globalAlpha = pulse;
        ctx.fillText("SUPER READY  [X]", W - 36, H - 34);
        ctx.globalAlpha = 1;
      } else if (player.dashCool <= 0) {
        ctx.fillStyle = "rgba(0,240,255,0.45)";
        ctx.font = "11px Orbitron, sans-serif";
        ctx.textAlign = "right";
        ctx.fillText("DASH READY", W - 36, H - 34);
      }

      // aim assist reticle on nearest
      const aim = nearestEnemy(player.x, player.y, 200);
      if (aim && player.atkCool <= 0) {
        ctx.strokeStyle = "rgba(184,255,61,0.35)";
        ctx.lineWidth = 1.5;
        ctx.beginPath();
        ctx.arc(aim.x, aim.y, (aim.size || 60) * 0.42, 0, Math.PI * 2);
        ctx.stroke();
      }

      if (player.enraged) {
        ctx.save();
        ctx.globalAlpha = 0.12 + 0.1 * Math.sin(state.time * 14);
        ctx.fillStyle = "#ff4d00";
        ctx.fillRect(0, 0, W, H);
        ctx.restore();
      }
      if (state.frenzy > 0) {
        ctx.save();
        ctx.globalAlpha = 0.08 + 0.06 * Math.sin(state.time * 20);
        ctx.fillStyle = "#ff0066";
        ctx.fillRect(0, 0, W, H);
        ctx.restore();
      }
    } else {
      ctx.fillStyle = "rgba(243,233,255,0.3)";
      ctx.font = "15px Rajdhani, sans-serif";
      ctx.textAlign = "center";
      ctx.fillText("Chaos awaits. Smash START.", W / 2, H - 40);
      // floating menu particles
      if (Math.random() < 0.3) {
        burst(Math.random() * W, Math.random() * H, `hsl(${Math.random() * 360},90%,60%)`, 2, 40);
      }
      drawFX();
    }

    ctx.restore();
    requestAnimationFrame(loop);
  }

  loadAssets()
    .then(() => {
      if (el.loaderFill) el.loaderFill.style.width = "100%";
      if (el.loaderText) el.loaderText.textContent = "Ready!";
      setTimeout(() => {
        showMainMenu();
        requestAnimationFrame(loop);
      }, 280);
    })
    .catch((err) => {
      console.error(err);
      if (el.loaderText) el.loaderText.textContent = "Failed to load assets";
      alert("Failed to load sprites. Keep assets/ next to index.html");
    });
})();
