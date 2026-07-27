(() => {
  "use strict";

  const canvas = document.getElementById("game");
  const ctx = canvas.getContext("2d");
  const W = canvas.width;
  const H = canvas.height;
  const GROUND_Y = H - 92;

  const $ = (id) => document.getElementById(id);
  const ui = {
    dist: $("dist"),
    score: $("score"),
    combo: $("combo"),
    coins: $("coins"),
    loader: $("loader"),
    loadFill: $("load-fill"),
    menu: $("menu"),
    pause: $("pause"),
    over: $("over"),
    best: $("best"),
    bestScore: $("best-score"),
    finalDist: $("final-dist"),
    finalScore: $("final-score"),
    finalCoins: $("final-coins"),
    finalCombo: $("final-combo"),
    newBest: $("new-best"),
    toast: $("toast"),
    touch: $("touch"),
  };

  const SPRITES = {
    idle: ["idle_01_neutral", "idle_02_squash", "idle_03_stretch", "idle_05_lean_right", "idle_04_lean_left"],
    hop: ["hop_01_crouch", "hop_02_airborne", "hop_03_land"],
    slide: "idle_02_squash",
    hurt: "variant_hurt",
    enraged: "variant_enraged",
    attack: "pose_attack",
    mini: "variant_mini",
    enemies: {
      wraith: ["wraith_idle", "wraith_idle2", "wraith_attack"],
      shard: ["shard_idle", "shard_idle2", "shard_attack"],
      brute: ["brute_idle", "brute_idle2", "brute_attack"],
      bomber: ["bomber_idle", "bomber_idle2", "bomber_attack"],
    },
  };

  const images = {};
  let ready = false;

  function loadImg(src) {
    return new Promise((res, rej) => {
      const img = new Image();
      img.onload = () => res(img);
      img.onerror = rej;
      img.src = src;
    });
  }

  async function loadAll() {
    const list = new Set([
      ...SPRITES.idle,
      ...SPRITES.hop,
      SPRITES.slide,
      SPRITES.hurt,
      SPRITES.enraged,
      SPRITES.attack,
      SPRITES.mini,
    ]);
    Object.values(SPRITES.enemies).forEach((arr) => arr.forEach((n) => list.add(n)));

    const arr = [...list];
    for (let i = 0; i < arr.length; i++) {
      const name = arr[i];
      const isEnemy = /^(wraith|shard|brute|bomber|boss)_/.test(name);
      const path = isEnemy ? `assets/enemies/${name}.png` : `assets/${name}.png`;
      try {
        images[name] = await loadImg(path);
      } catch {
        console.warn("missing", path);
      }
      ui.loadFill.style.width = `${Math.round(((i + 1) / arr.length) * 100)}%`;
    }
    ready = true;
  }

  // Audio
  let actx = null;
  let muted = false;
  function audio() {
    if (!actx) actx = new (window.AudioContext || window.webkitAudioContext)();
    if (actx.state === "suspended") actx.resume();
  }
  function beep(freq, dur = 0.08, type = "square", gain = 0.04, slide = 0) {
    if (!actx || muted) return;
    const t = actx.currentTime;
    const o = actx.createOscillator();
    const g = actx.createGain();
    o.type = type;
    o.frequency.setValueAtTime(freq, t);
    if (slide) o.frequency.exponentialRampToValueAtTime(Math.max(40, freq + slide), t + dur);
    g.gain.setValueAtTime(gain, t);
    g.gain.exponentialRampToValueAtTime(0.001, t + dur);
    o.connect(g);
    g.connect(actx.destination);
    o.start(t);
    o.stop(t + dur + 0.02);
  }
  const SFX = {
    jump: () => beep(280, 0.1, "triangle", 0.05, 200),
    land: () => beep(120, 0.06, "sine", 0.03),
    slide: () => beep(90, 0.1, "sawtooth", 0.03, -30),
    dash: () => beep(200, 0.12, "sawtooth", 0.04, 350),
    coin: () => beep(880, 0.06, "sine", 0.035, 200),
    hit: () => beep(100, 0.18, "square", 0.05, -60),
    kill: () => beep(160, 0.1, "sawtooth", 0.04, 120),
    power: () => beep(520, 0.14, "sine", 0.045, 300),
  };

  // State
  const state = {
    mode: "load", // load | menu | play | pause | over
    t: 0,
    dist: 0,
    score: 0,
    coins: 0,
    combo: 0,
    comboT: 0,
    maxCombo: 0,
    speed: 280,
    baseSpeed: 280,
    spawnT: 0,
    coinT: 0.5,
    shake: 0,
    invuln: 0,
    bestDist: Number(localStorage.getItem("neonRunBestDist") || 0),
    bestScore: Number(localStorage.getItem("neonRunBestScore") || 0),
  };
  ui.best.textContent = `${Math.floor(state.bestDist)}m`;
  ui.bestScore.textContent = String(state.bestScore);

  const keys = new Set();
  window.addEventListener("keydown", (e) => {
    keys.add(e.code);
    if (["Space", "ArrowUp", "ArrowDown"].includes(e.code)) e.preventDefault();
    if (e.code === "KeyP") {
      if (state.mode === "play") pauseGame();
      else if (state.mode === "pause") resumeGame();
    }
    if (state.mode !== "play") return;
    if (e.code === "Space" || e.code === "ArrowUp" || e.code === "KeyW" || e.code === "KeyK") player.jump();
    if (e.code === "ArrowDown" || e.code === "KeyS") player.slide();
    if (e.code === "ShiftLeft" || e.code === "ShiftRight" || e.code === "KeyL") player.dash();
  });
  window.addEventListener("keyup", (e) => keys.delete(e.code));

  // Touch / click jump
  canvas.addEventListener("pointerdown", (e) => {
    if (state.mode !== "play") return;
    const r = canvas.getBoundingClientRect();
    const x = (e.clientX - r.left) / r.width;
    if (x < 0.33) player.slide();
    else if (x > 0.66) player.dash();
    else player.jump();
  });

  $("t-jump")?.addEventListener("touchstart", (e) => { e.preventDefault(); if (state.mode === "play") player.jump(); }, { passive: false });
  $("t-slide")?.addEventListener("touchstart", (e) => { e.preventDefault(); if (state.mode === "play") player.slide(); }, { passive: false });
  $("t-dash")?.addEventListener("touchstart", (e) => { e.preventDefault(); if (state.mode === "play") player.dash(); }, { passive: false });

  if (window.matchMedia("(pointer: coarse)").matches || window.innerWidth < 700) {
    ui.touch.classList.remove("hidden");
  }

  // World objects
  const obstacles = [];
  const coins = [];
  const particles = [];
  const floats = [];
  const starsBg = Array.from({ length: 70 }, () => ({
    x: Math.random() * W,
    y: Math.random() * H * 0.75,
    s: 0.6 + Math.random() * 2,
    z: 0.3 + Math.random() * 1.5,
  }));
  const buildings = Array.from({ length: 12 }, (_, i) => ({
    x: i * 140 + Math.random() * 40,
    w: 60 + Math.random() * 80,
    h: 40 + Math.random() * 120,
    hue: 160 + Math.random() * 80,
  }));

  function toast(text, color = "#5dffd0") {
    ui.toast.textContent = text;
    ui.toast.style.color = color;
    ui.toast.classList.remove("show");
    void ui.toast.offsetWidth;
    ui.toast.classList.add("show");
  }

  function burst(x, y, color, n = 10) {
    for (let i = 0; i < n; i++) {
      const a = Math.random() * Math.PI * 2;
      const sp = 60 + Math.random() * 180;
      particles.push({
        x, y,
        vx: Math.cos(a) * sp,
        vy: Math.sin(a) * sp - 40,
        life: 0.3 + Math.random() * 0.4,
        size: 2 + Math.random() * 4,
        color,
      });
    }
  }

  function addFloat(x, y, text, color = "#ffe566") {
    floats.push({ x, y, text, color, life: 0.8, vy: -50 });
  }

  const player = {
    x: 170,
    y: GROUND_Y,
    vy: 0,
    w: 56,
    h: 56,
    onGround: true,
    jumps: 0,
    maxJumps: 2,
    slideT: 0,
    dashT: 0,
    dashCool: 0,
    hurtT: 0,
    frame: 0,
    frameT: 0,
    dead: false,

    reset() {
      this.x = 170;
      this.y = GROUND_Y;
      this.vy = 0;
      this.onGround = true;
      this.jumps = 0;
      this.slideT = 0;
      this.dashT = 0;
      this.dashCool = 0;
      this.hurtT = 0;
      this.frame = 0;
      this.dead = false;
    },

    jump() {
      if (this.dead || this.slideT > 0.1) return;
      if (this.jumps < this.maxJumps) {
        this.vy = this.jumps === 0 ? -520 : -430;
        this.jumps++;
        this.onGround = false;
        this.slideT = 0;
        SFX.jump();
        burst(this.x, this.y, "#5dffd0", 6);
      }
    },

    slide() {
      if (this.dead || !this.onGround || this.dashT > 0) return;
      this.slideT = 0.55;
      SFX.slide();
    },

    dash() {
      if (this.dead || this.dashCool > 0) return;
      this.dashT = 0.22;
      this.dashCool = 1.1;
      this.slideT = 0;
      state.invuln = Math.max(state.invuln, 0.22);
      SFX.dash();
      state.shake = 6;
      toast("DASH", "#ffe566");
      // destroy obstacles in front
      for (const o of obstacles) {
        if (o.dead) continue;
        if (o.x > this.x - 20 && o.x < this.x + 160 && Math.abs(o.y - this.y) < 70) {
          destroyObstacle(o, true);
        }
      }
      burst(this.x + 40, this.y - 20, "#ffe566", 14);
    },

    hitbox() {
      if (this.slideT > 0) {
        return { x: this.x - 28, y: this.y - 28, w: 60, h: 30 };
      }
      return { x: this.x - 22, y: this.y - 52, w: 44, h: 52 };
    },

    update(dt) {
      // gravity
      this.vy += 1600 * dt;
      this.y += this.vy * dt;

      if (this.y >= GROUND_Y) {
        if (!this.onGround && this.vy > 100) {
          SFX.land();
          burst(this.x, GROUND_Y, "rgba(93,255,208,0.5)", 5);
        }
        this.y = GROUND_Y;
        this.vy = 0;
        this.onGround = true;
        this.jumps = 0;
      }

      if (this.slideT > 0) this.slideT -= dt;
      if (this.dashT > 0) this.dashT -= dt;
      if (this.dashCool > 0) this.dashCool -= dt;
      if (this.hurtT > 0) this.hurtT -= dt;

      // hold down to keep sliding feel
      if ((keys.has("ArrowDown") || keys.has("KeyS")) && this.onGround && this.slideT <= 0) {
        this.slideT = 0.2;
      }

      this.frameT += dt;
      if (this.frameT > 0.1) {
        this.frameT = 0;
        this.frame++;
      }
    },

    sprite() {
      if (this.hurtT > 0) return images[SPRITES.hurt];
      if (this.dashT > 0) return images[SPRITES.attack] || images[SPRITES.enraged];
      if (this.slideT > 0) return images[SPRITES.slide];
      if (!this.onGround) {
        if (this.vy < -80) return images[SPRITES.hop[1]];
        if (this.vy > 120) return images[SPRITES.hop[2]];
        return images[SPRITES.hop[1]];
      }
      // run cycle using idle squash/stretch
      const seq = SPRITES.idle;
      return images[seq[this.frame % seq.length]];
    },

    draw() {
      const img = this.sprite();
      const blink = state.invuln > 0 && Math.floor(state.invuln * 16) % 2 === 0;
      if (blink) return;

      // shadow
      ctx.save();
      ctx.globalAlpha = 0.25;
      ctx.fillStyle = "#000";
      ctx.beginPath();
      ctx.ellipse(this.x, GROUND_Y + 6, this.slideT > 0 ? 34 : 26, 8, 0, 0, Math.PI * 2);
      ctx.fill();
      ctx.restore();

      const size = this.slideT > 0 ? 70 : this.dashT > 0 ? 78 : 72;
      const drawY = this.slideT > 0 ? this.y - 20 : this.y - size * 0.55;

      ctx.save();
      ctx.translate(this.x, drawY);
      if (this.dashT > 0) {
        ctx.shadowColor = "#ffe566";
        ctx.shadowBlur = 24;
      } else {
        ctx.shadowColor = "#5dffd0";
        ctx.shadowBlur = 14;
      }
      if (img) {
        ctx.drawImage(img, -size / 2, -size / 2, size, size);
      } else {
        ctx.fillStyle = "#5dffd0";
        ctx.beginPath();
        ctx.arc(0, 0, 28, 0, Math.PI * 2);
        ctx.fill();
      }
      // dash trail ghost
      if (this.dashT > 0) {
        ctx.globalAlpha = 0.35;
        if (img) ctx.drawImage(img, -size / 2 - 30, -size / 2, size * 0.9, size * 0.9);
        ctx.globalAlpha = 0.2;
        if (img) ctx.drawImage(img, -size / 2 - 55, -size / 2, size * 0.8, size * 0.8);
      }
      ctx.restore();
    },
  };

  function destroyObstacle(o, fromDash = false) {
    if (o.dead) return;
    o.dead = true;
    state.combo++;
    state.comboT = 2.2;
    state.maxCombo = Math.max(state.maxCombo, state.combo);
    const pts = Math.floor((o.type === "enemy" ? 40 : 15) * (1 + state.combo * 0.15));
    state.score += pts;
    addFloat(o.x, o.y - 30, `+${pts}`, "#ff5ec8");
    burst(o.x, o.y, o.color || "#a78bfa", 14);
    SFX.kill();
    if (fromDash && state.combo >= 3 && state.combo % 3 === 0) {
      toast(`${state.combo}x COMBO`, "#ff5ec8");
    }
  }

  function spawnObstacle() {
    const roll = Math.random();
    const distFactor = Math.min(1, state.dist / 2000);

    // ground spike / low barrier
    if (roll < 0.28) {
      obstacles.push({
        kind: "spike",
        type: "hazard",
        x: W + 40,
        y: GROUND_Y,
        w: 36,
        h: 40,
        dead: false,
        color: "#ff4d6d",
      });
    } else if (roll < 0.48) {
      // high beam — must slide
      obstacles.push({
        kind: "beam",
        type: "hazard",
        x: W + 40,
        y: GROUND_Y - 70,
        w: 70,
        h: 28,
        dead: false,
        color: "#ff5ec8",
      });
    } else if (roll < 0.62) {
      // floating block — jump
      obstacles.push({
        kind: "block",
        type: "hazard",
        x: W + 40,
        y: GROUND_Y - 20 - Math.random() * 30,
        w: 44,
        h: 44,
        dead: false,
        color: "#a78bfa",
      });
    } else {
      // enemy runner
      const kinds = ["wraith", "shard", "bomber", "brute"];
      const k = kinds[Math.floor(Math.random() * (2 + Math.floor(distFactor * 2)))];
      obstacles.push({
        kind: "enemy",
        type: "enemy",
        enemy: k,
        x: W + 50,
        y: GROUND_Y,
        w: 50,
        h: 50,
        dead: false,
        color: k === "shard" ? "#67e8f9" : k === "bomber" ? "#fb923c" : k === "brute" ? "#ef4444" : "#a855f7",
        frame: 0,
        frameT: 0,
        bob: Math.random() * 10,
      });
    }

    // occasional double pack at higher distance
    if (state.dist > 400 && Math.random() < 0.2 + distFactor * 0.2) {
      obstacles.push({
        kind: "spike",
        type: "hazard",
        x: W + 140,
        y: GROUND_Y,
        w: 36,
        h: 40,
        dead: false,
        color: "#ff4d6d",
      });
    }
  }

  function spawnCoinPattern() {
    const baseY = GROUND_Y - 40 - Math.random() * 100;
    const n = 4 + Math.floor(Math.random() * 4);
    const arc = Math.random() < 0.5;
    for (let i = 0; i < n; i++) {
      coins.push({
        x: W + 30 + i * 36,
        y: arc ? baseY - Math.sin((i / (n - 1)) * Math.PI) * 50 : baseY,
        r: 12,
        got: false,
        spin: Math.random() * 5,
      });
    }
    // rare mini slime power
    if (Math.random() < 0.12) {
      coins.push({
        x: W + 80 + n * 20,
        y: GROUND_Y - 90,
        r: 18,
        got: false,
        spin: 0,
        power: true,
      });
    }
  }

  function rectsOverlap(a, b) {
    return a.x < b.x + b.w && a.x + a.w > b.x && a.y < b.y + b.h && a.y + a.h > b.y;
  }

  function playerHurt() {
    if (state.invuln > 0 || player.dashT > 0) return;
    player.hurtT = 0.4;
    state.invuln = 1.0;
    state.combo = 0;
    state.comboT = 0;
    state.shake = 12;
    state.speed = Math.max(state.baseSpeed, state.speed * 0.92);
    SFX.hit();
    burst(player.x, player.y - 30, "#ff4d6d", 16);
    toast("OUCH", "#ff4d6d");

    // second hit soon = death via "lives" as invuln end then any hit kills if we use one-hit after grace
    // Use simple: 3 hearts via hits counter
    state.hits = (state.hits || 0) + 1;
    if (state.hits >= 3) {
      die();
    } else {
      addFloat(player.x, player.y - 60, `${3 - state.hits} LEFT`, "#ff4d6d");
    }
  }

  function die() {
    if (state.mode !== "play") return;
    player.dead = true;
    state.mode = "over";
    SFX.hit();
    burst(player.x, player.y - 20, "#ff4d6d", 30);
    toast("SPLAT!", "#ff4d6d");

    ui.finalDist.textContent = `${Math.floor(state.dist)}m`;
    ui.finalScore.textContent = String(state.score);
    ui.finalCoins.textContent = String(state.coins);
    ui.finalCombo.textContent = `x${state.maxCombo}`;

    let nb = false;
    if (state.dist > state.bestDist) {
      state.bestDist = state.dist;
      localStorage.setItem("neonRunBestDist", String(Math.floor(state.bestDist)));
      ui.best.textContent = `${Math.floor(state.bestDist)}m`;
      nb = true;
    }
    if (state.score > state.bestScore) {
      state.bestScore = state.score;
      localStorage.setItem("neonRunBestScore", String(state.bestScore));
      ui.bestScore.textContent = String(state.bestScore);
      nb = true;
    }
    ui.newBest.classList.toggle("hidden", !nb);
    ui.over.classList.remove("hidden");
  }

  function startGame() {
    audio();
    state.mode = "play";
    state.t = 0;
    state.dist = 0;
    state.score = 0;
    state.coins = 0;
    state.combo = 0;
    state.comboT = 0;
    state.maxCombo = 0;
    state.speed = 280;
    state.baseSpeed = 280;
    state.spawnT = 1.2;
    state.coinT = 0.8;
    state.shake = 0;
    state.invuln = 1.2;
    state.hits = 0;
    obstacles.length = 0;
    coins.length = 0;
    particles.length = 0;
    floats.length = 0;
    player.reset();
    ui.menu.classList.add("hidden");
    ui.over.classList.add("hidden");
    ui.pause.classList.add("hidden");
    toast("GO!", "#5dffd0");
  }

  function pauseGame() {
    state.mode = "pause";
    ui.pause.classList.remove("hidden");
  }
  function resumeGame() {
    state.mode = "play";
    ui.pause.classList.add("hidden");
  }
  function toMenu() {
    state.mode = "menu";
    ui.pause.classList.add("hidden");
    ui.over.classList.add("hidden");
    ui.menu.classList.remove("hidden");
  }

  $("btn-play").addEventListener("click", startGame);
  $("btn-retry").addEventListener("click", startGame);
  $("btn-resume").addEventListener("click", resumeGame);
  $("btn-quit").addEventListener("click", toMenu);
  $("btn-menu").addEventListener("click", toMenu);

  function update(dt) {
    state.t += dt;
    if (state.shake > 0) state.shake = Math.max(0, state.shake - dt * 30);
    if (state.invuln > 0) state.invuln -= dt;
    if (state.comboT > 0) {
      state.comboT -= dt;
      if (state.comboT <= 0) state.combo = 0;
    }

    // accelerate over distance
    state.baseSpeed = 280 + Math.min(220, state.dist * 0.08);
    state.speed = state.baseSpeed + (player.dashT > 0 ? 200 : 0);

    state.dist += (state.speed * dt) / 10;
    state.score += Math.floor(state.speed * dt * 0.15 * (1 + state.combo * 0.05));

    player.update(dt);

    // spawn
    state.spawnT -= dt;
    const spawnRate = Math.max(0.55, 1.5 - state.dist * 0.0004);
    if (state.spawnT <= 0) {
      spawnObstacle();
      state.spawnT = spawnRate + Math.random() * 0.35;
    }
    state.coinT -= dt;
    if (state.coinT <= 0) {
      spawnCoinPattern();
      state.coinT = 1.2 + Math.random() * 1.1;
    }

    // move world
    const scroll = state.speed * dt;
    for (const o of obstacles) {
      o.x -= scroll;
      if (o.kind === "enemy") {
        o.bob += dt * 5;
        o.frameT += dt;
        if (o.frameT > 0.12) {
          o.frameT = 0;
          o.frame++;
        }
      }
    }
    for (const c of coins) {
      c.x -= scroll;
      c.spin += dt * 6;
    }
    for (const b of buildings) {
      b.x -= scroll * 0.35;
      if (b.x + b.w < 0) {
        b.x += 12 * 140;
        b.h = 40 + Math.random() * 120;
      }
    }
    for (const s of starsBg) {
      s.x -= s.z * scroll * 0.15;
      if (s.x < 0) {
        s.x = W;
        s.y = Math.random() * H * 0.7;
      }
    }

    // collisions
    const pb = player.hitbox();
    for (const o of obstacles) {
      if (o.dead || o.x < -80) continue;
      const ob = {
        x: o.x - o.w / 2,
        y: o.kind === "beam" ? o.y - o.h / 2 : o.y - o.h,
        w: o.w,
        h: o.h,
      };
      // enemy slightly taller sprite
      if (o.kind === "enemy") {
        ob.y = o.y - 55;
        ob.h = 55;
        ob.w = 48;
        ob.x = o.x - 24;
      }
      if (rectsOverlap(pb, ob)) {
        if (player.dashT > 0 && o.type === "enemy") {
          destroyObstacle(o, true);
        } else if (player.dashT > 0 && o.kind === "block") {
          destroyObstacle(o, true);
        } else {
          // slide under beam
          if (o.kind === "beam" && player.slideT > 0) continue;
          // jump over spike/block
          playerHurt();
          o.dead = true; // remove so no multi-hit
          burst(o.x, o.y, o.color, 8);
        }
      }
    }

    // coins
    for (const c of coins) {
      if (c.got) continue;
      const dx = c.x - player.x;
      const dy = c.y - (player.y - 30);
      if (Math.hypot(dx, dy) < 36 + c.r) {
        c.got = true;
        if (c.power) {
          state.invuln = Math.max(state.invuln, 3);
          state.score += 100;
          SFX.power();
          toast("SHIELD!", "#a78bfa");
          burst(c.x, c.y, "#a78bfa", 16);
        } else {
          state.coins++;
          state.score += 10 * (1 + Math.floor(state.combo / 3));
          state.combo = Math.min(99, state.combo + 1);
          state.comboT = 2;
          state.maxCombo = Math.max(state.maxCombo, state.combo);
          SFX.coin();
          addFloat(c.x, c.y, "+STAR", "#ffe566");
          burst(c.x, c.y, "#ffe566", 6);
        }
      }
    }

    // cleanup
    for (let i = obstacles.length - 1; i >= 0; i--) {
      if (obstacles[i].x < -100 || obstacles[i].dead) obstacles.splice(i, 1);
    }
    for (let i = coins.length - 1; i >= 0; i--) {
      if (coins[i].x < -40 || coins[i].got) coins.splice(i, 1);
    }

    // particles / floats
    for (let i = particles.length - 1; i >= 0; i--) {
      const p = particles[i];
      p.life -= dt;
      p.x += p.vx * dt;
      p.y += p.vy * dt;
      p.vy += 300 * dt;
      if (p.life <= 0) particles.splice(i, 1);
    }
    for (let i = floats.length - 1; i >= 0; i--) {
      const f = floats[i];
      f.life -= dt;
      f.y += f.vy * dt;
      if (f.life <= 0) floats.splice(i, 1);
    }

    // HUD
    ui.dist.textContent = `${Math.floor(state.dist)}m`;
    ui.score.textContent = String(state.score);
    ui.combo.textContent = state.combo > 0 ? `x${state.combo}` : "x1";
    ui.coins.textContent = String(state.coins);
  }

  function drawBg() {
    const g = ctx.createLinearGradient(0, 0, 0, H);
    g.addColorStop(0, "#0a0620");
    g.addColorStop(0.55, "#0c1028");
    g.addColorStop(1, "#061018");
    ctx.fillStyle = g;
    ctx.fillRect(0, 0, W, H);

    // nebula
    ctx.globalAlpha = 0.12;
    ctx.fillStyle = "#5b21b6";
    ctx.beginPath();
    ctx.ellipse(W * 0.7, H * 0.25, 220, 100, 0.2, 0, Math.PI * 2);
    ctx.fill();
    ctx.fillStyle = "#0f766e";
    ctx.beginPath();
    ctx.ellipse(W * 0.2, H * 0.4, 180, 90, -0.3, 0, Math.PI * 2);
    ctx.fill();
    ctx.globalAlpha = 1;

    for (const s of starsBg) {
      ctx.globalAlpha = 0.35 + s.z * 0.3;
      ctx.fillStyle = "#c4f1f9";
      ctx.fillRect(s.x, s.y, s.s, s.s);
    }
    ctx.globalAlpha = 1;

    // skyline
    for (const b of buildings) {
      ctx.fillStyle = `hsla(${b.hue}, 40%, 12%, 0.85)`;
      ctx.fillRect(b.x, GROUND_Y - b.h, b.w, b.h);
      ctx.fillStyle = `hsla(${b.hue}, 80%, 55%, 0.25)`;
      for (let yy = 10; yy < b.h - 10; yy += 14) {
        for (let xx = 8; xx < b.w - 8; xx += 12) {
          if (Math.random() > 0.3) ctx.fillRect(b.x + xx, GROUND_Y - b.h + yy, 5, 7);
        }
      }
    }

    // ground
    const gg = ctx.createLinearGradient(0, GROUND_Y, 0, H);
    gg.addColorStop(0, "#12203a");
    gg.addColorStop(1, "#050810");
    ctx.fillStyle = gg;
    ctx.fillRect(0, GROUND_Y, W, H - GROUND_Y);

    // neon rail line
    ctx.strokeStyle = "rgba(93,255,208,0.55)";
    ctx.lineWidth = 3;
    ctx.beginPath();
    ctx.moveTo(0, GROUND_Y + 2);
    ctx.lineTo(W, GROUND_Y + 2);
    ctx.stroke();
    ctx.strokeStyle = "rgba(255,94,200,0.25)";
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.moveTo(0, GROUND_Y + 10);
    ctx.lineTo(W, GROUND_Y + 10);
    ctx.stroke();

    // scrolling dashes
    const dashOff = (state.t * state.speed * 0.4) % 50;
    ctx.strokeStyle = "rgba(93,255,208,0.35)";
    ctx.lineWidth = 2;
    ctx.setLineDash([18, 32]);
    ctx.lineDashOffset = -dashOff;
    ctx.beginPath();
    ctx.moveTo(0, GROUND_Y + 22);
    ctx.lineTo(W, GROUND_Y + 22);
    ctx.stroke();
    ctx.setLineDash([]);
  }

  function drawObstacle(o) {
    if (o.dead) return;
    if (o.kind === "spike") {
      ctx.fillStyle = o.color;
      ctx.shadowColor = o.color;
      ctx.shadowBlur = 12;
      ctx.beginPath();
      ctx.moveTo(o.x - 18, GROUND_Y);
      ctx.lineTo(o.x, GROUND_Y - 42);
      ctx.lineTo(o.x + 18, GROUND_Y);
      ctx.closePath();
      ctx.fill();
      ctx.shadowBlur = 0;
    } else if (o.kind === "beam") {
      ctx.save();
      ctx.shadowColor = o.color;
      ctx.shadowBlur = 16;
      const grd = ctx.createLinearGradient(o.x - 40, 0, o.x + 40, 0);
      grd.addColorStop(0, "transparent");
      grd.addColorStop(0.2, o.color);
      grd.addColorStop(0.8, o.color);
      grd.addColorStop(1, "transparent");
      ctx.fillStyle = grd;
      ctx.fillRect(o.x - 40, o.y - 14, 80, 28);
      ctx.fillStyle = "#fff";
      ctx.globalAlpha = 0.5;
      ctx.fillRect(o.x - 30, o.y - 3, 60, 6);
      ctx.restore();
      // slide cue
      ctx.fillStyle = "rgba(255,94,200,0.5)";
      ctx.font = "10px Orbitron";
      ctx.textAlign = "center";
      ctx.fillText("SLIDE", o.x, o.y - 22);
    } else if (o.kind === "block") {
      ctx.save();
      ctx.translate(o.x, o.y - 22);
      ctx.rotate(state.t * 2);
      ctx.fillStyle = o.color;
      ctx.shadowColor = o.color;
      ctx.shadowBlur = 12;
      ctx.fillRect(-20, -20, 40, 40);
      ctx.strokeStyle = "#e9d5ff";
      ctx.lineWidth = 2;
      ctx.strokeRect(-20, -20, 40, 40);
      ctx.restore();
    } else if (o.kind === "enemy") {
      const names = SPRITES.enemies[o.enemy] || SPRITES.enemies.wraith;
      const img = images[names[o.frame % names.length]];
      const lift = o.enemy === "wraith" || o.enemy === "shard" ? Math.sin(o.bob) * 6 : 0;
      const size = o.enemy === "brute" ? 78 : 68;
      ctx.save();
      ctx.shadowColor = o.color;
      ctx.shadowBlur = 14;
      if (img) {
        ctx.drawImage(img, o.x - size / 2, o.y - size + 8 - lift, size, size);
      } else {
        ctx.fillStyle = o.color;
        ctx.beginPath();
        ctx.arc(o.x, o.y - 28, 24, 0, Math.PI * 2);
        ctx.fill();
      }
      ctx.restore();
    }
  }

  function drawCoins() {
    for (const c of coins) {
      if (c.got) continue;
      if (c.power && images[SPRITES.mini]) {
        const s = 40;
        ctx.save();
        ctx.translate(c.x, c.y);
        ctx.rotate(Math.sin(c.spin) * 0.2);
        ctx.drawImage(images[SPRITES.mini], -s / 2, -s / 2, s, s);
        ctx.restore();
        continue;
      }
      ctx.save();
      ctx.translate(c.x, c.y);
      ctx.rotate(c.spin);
      ctx.shadowColor = "#ffe566";
      ctx.shadowBlur = 12;
      ctx.fillStyle = "#ffe566";
      ctx.beginPath();
      for (let i = 0; i < 5; i++) {
        const a = (i * 4 * Math.PI) / 5 - Math.PI / 2;
        const r = i % 2 === 0 ? 11 : 5;
        const px = Math.cos(a) * r;
        const py = Math.sin(a) * r;
        if (i === 0) ctx.moveTo(px, py);
        else ctx.lineTo(px, py);
      }
      ctx.closePath();
      ctx.fill();
      ctx.restore();
    }
  }

  function drawFX() {
    for (const p of particles) {
      ctx.globalAlpha = Math.max(0, p.life * 2);
      ctx.fillStyle = p.color;
      ctx.beginPath();
      ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
      ctx.fill();
    }
    ctx.globalAlpha = 1;
    for (const f of floats) {
      ctx.globalAlpha = Math.max(0, f.life);
      ctx.fillStyle = f.color;
      ctx.font = "bold 14px Orbitron";
      ctx.textAlign = "center";
      ctx.fillText(f.text, f.x, f.y);
    }
    ctx.globalAlpha = 1;
  }

  function drawHUDOverlay() {
    // lives
    const lives = 3 - (state.hits || 0);
    for (let i = 0; i < 3; i++) {
      ctx.globalAlpha = i < lives ? 1 : 0.2;
      const img = images[SPRITES.mini] || images[SPRITES.idle[0]];
      if (img) ctx.drawImage(img, 24 + i * 36, 16, 32, 32);
    }
    ctx.globalAlpha = 1;

    // dash cooldown
    ctx.fillStyle = "rgba(0,0,0,0.35)";
    ctx.fillRect(W - 130, 18, 100, 10);
    const cd = 1 - Math.max(0, player.dashCool) / 1.1;
    ctx.fillStyle = cd >= 1 ? "#ffe566" : "#5dffd0";
    ctx.fillRect(W - 130, 18, 100 * Math.max(0, cd), 10);
    ctx.fillStyle = "rgba(255,255,255,0.6)";
    ctx.font = "10px Orbitron";
    ctx.textAlign = "right";
    ctx.fillText(cd >= 1 ? "DASH READY" : "DASH", W - 28, 14);

    // shield
    if (state.invuln > 1.2) {
      ctx.strokeStyle = "rgba(167,139,250,0.55)";
      ctx.lineWidth = 3;
      ctx.beginPath();
      ctx.arc(player.x, player.y - 30, 42, 0, Math.PI * 2);
      ctx.stroke();
    }
  }

  let last = performance.now();
  function loop(now) {
    const dt = Math.min(0.033, (now - last) / 1000);
    last = now;

    if (state.mode === "play") update(dt);
    else if (state.mode === "menu" || state.mode === "load") {
      // ambient scroll feel
      for (const s of starsBg) {
        s.x -= s.z * 20 * dt;
        if (s.x < 0) s.x = W;
      }
    }

    ctx.save();
    if (state.shake > 0) {
      ctx.translate((Math.random() - 0.5) * state.shake, (Math.random() - 0.5) * state.shake);
    }

    drawBg();

    if (state.mode === "play" || state.mode === "pause" || state.mode === "over") {
      drawCoins();
      for (const o of obstacles) drawObstacle(o);
      player.draw();
      drawFX();
      if (state.mode === "play" || state.mode === "pause") drawHUDOverlay();
    } else {
      // menu preview idle slime
      player.x = W * 0.5;
      player.y = GROUND_Y;
      player.onGround = true;
      player.frameT += dt;
      if (player.frameT > 0.12) {
        player.frameT = 0;
        player.frame++;
      }
      player.draw();
      ctx.fillStyle = "rgba(238,248,255,0.35)";
      ctx.font = "16px Rajdhani";
      ctx.textAlign = "center";
      ctx.fillText("Press RUN to hit the neon rails", W / 2, H - 40);
    }

    ctx.restore();
    requestAnimationFrame(loop);
  }

  loadAll()
    .then(() => {
      ui.loader.classList.add("hidden");
      ui.menu.classList.remove("hidden");
      state.mode = "menu";
      requestAnimationFrame(loop);
    })
    .catch((err) => {
      console.error(err);
      ui.loadFill.style.width = "100%";
      alert("Asset load failed — check assets folder");
    });
})();
