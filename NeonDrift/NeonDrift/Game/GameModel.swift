import Foundation
import CoreGraphics
import UIKit

enum GamePhase: Equatable {
    case menu
    case playing
    case paused
    case gameOver
}

enum PowerUpKind: Int, CaseIterable {
    case shield, magnet, slowmo, multiplier, nitro, rapid, drones, chaos, blackhole

    var title: String {
        switch self {
        case .shield: return "SHIELD"
        case .magnet: return "MAGNET"
        case .slowmo: return "SLOW-MO"
        case .multiplier: return "×2 SCORE"
        case .nitro: return "NITRO"
        case .rapid: return "RAPID FIRE"
        case .drones: return "DRONE SWARM"
        case .chaos: return "CHAOS MODE"
        case .blackhole: return "BLACK HOLE"
        }
    }

    var color: SIMD3<Float> {
        switch self {
        case .shield: return SIMD3(0.35, 0.85, 1.0)
        case .magnet: return SIMD3(1.0, 0.45, 0.95)
        case .slowmo: return SIMD3(0.55, 0.75, 1.0)
        case .multiplier: return SIMD3(1.0, 0.85, 0.25)
        case .nitro: return SIMD3(0.3, 1.0, 0.55)
        case .rapid: return SIMD3(1.0, 0.55, 0.2)
        case .drones: return SIMD3(0.6, 0.4, 1.0)
        case .chaos: return SIMD3(1.0, 0.2, 0.6)
        case .blackhole: return SIMD3(0.5, 0.2, 0.9)
        }
    }
}

struct Ship {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat = 0
    let radius: CGFloat = 18
    let visualRadius: CGFloat = 42
}

struct Asteroid {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat
    var radius: CGFloat
    var speed: CGFloat
    var rotation: CGFloat
    var spin: CGFloat
    var spriteIndex: Int
    var nearMissAwarded: Bool = false
    var isBoss: Bool = false
    var hp: Int = 1
    var maxHp: Int = 1
    var coreTimer: CGFloat = 0
}

struct Crystal {
    var x: CGFloat
    var y: CGFloat
    var radius: CGFloat
    var speed: CGFloat
    var pulse: CGFloat
    var isGold: Bool
    var damagesBoss: Bool = false
}

struct PowerUp {
    var x: CGFloat
    var y: CGFloat
    var radius: CGFloat
    var speed: CGFloat
    var kind: PowerUpKind
    var pulse: CGFloat
}

struct Particle {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat
    var vy: CGFloat
    var life: CGFloat
    var maxLife: CGFloat
    var size: CGFloat
    var color: SIMD3<Float>
}

struct Star {
    var x: CGFloat
    var y: CGFloat
    var speed: CGFloat
    var size: CGFloat
    var brightness: CGFloat
}

struct Floater {
    var x: CGFloat
    var y: CGFloat
    var text: String
    var life: CGFloat
    var maxLife: CGFloat
    var color: SIMD3<Float>
    var rise: CGFloat
}

struct Bullet {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat
    var vy: CGFloat
    var radius: CGFloat
    var damage: Int
    /// Visual style: 0 = cyan plasma, 1 = gold power, 2 = mayhem rainbow, 3 = drone
    var style: Int
}

struct Missile {
    var x: CGFloat
    var y: CGFloat
    var vx: CGFloat
    var vy: CGFloat
    var life: CGFloat
    var turn: CGFloat
}

struct CombatDrone {
    var angle: CGFloat
    var orbit: CGFloat
    var fireCD: CGFloat
}

struct LightningBolt {
    var x1: CGFloat
    var y1: CGFloat
    var x2: CGFloat
    var y2: CGFloat
    var life: CGFloat
    var maxLife: CGFloat
}

struct BlackHoleFX {
    var x: CGFloat
    var y: CGFloat
    var life: CGFloat
    var maxLife: CGFloat
    var radius: CGFloat
}

final class GameModel: ObservableObject {
    // MARK: - UI state
    /// Structural phase drives menu/play/game-over swaps.
    @Published var phase: GamePhase = .menu
    /// Shop bank (needs explicit publish when buying outside the game loop).
    @Published var bankedCrystals: Int = UserDefaults.standard.integer(forKey: "NeonDriftBank")

    // Gameplay/HUD fields — refreshed once per frame via `objectWillChange` (not per-field @Published).
    private(set) var score: Int = 0
    private(set) var highScore: Int = UserDefaults.standard.integer(forKey: "NeonDriftHighScore")
    private(set) var combo: Int = 0
    private(set) var maxCombo: Int = 0
    private(set) var shields: Int = 3
    private(set) var maxShieldsDisplay: Int = 3
    private(set) var sector: Int = 1
    private(set) var distance: Int = 0
    private(set) var crystalsCollected: Int = 0
    private(set) var nearMisses: Int = 0
    private(set) var totalRuns: Int = UserDefaults.standard.integer(forKey: "NeonDriftRuns")
    private(set) var isNewBest: Bool = false
    private(set) var isDailyRun: Bool = false
    private(set) var bossesDefeated: Int = 0
    private(set) var dailyRewardEarned: Int = 0
    private(set) var bossHP: Int = 0
    private(set) var bossMaxHP: Int = 0
    private(set) var bossActive: Bool = false

    private(set) var magnetTime: CGFloat = 0
    private(set) var slowMoTime: CGFloat = 0
    private(set) var multiplierTime: CGFloat = 0
    private(set) var nitroTime: CGFloat = 0
    private(set) var invulnTime: CGFloat = 0
    private(set) var toast: String = ""
    private(set) var toastLife: CGFloat = 0
    private(set) var asteroidsDestroyed: Int = 0
    private(set) var rapidTime: CGFloat = 0
    private(set) var droneTime: CGFloat = 0
    private(set) var chaosTime: CGFloat = 0
    private(set) var novaCharge: CGFloat = 0 // 0...1
    private(set) var mayhemActive: Bool = false
    private(set) var chainCount: Int = 0
    private(set) var novasFired: Int = 0

    let upgrades = UpgradeStore.shared
    let dailyStore = DailyChallengeStore.shared

    // MARK: - World
    private(set) var ship = Ship(x: 0, y: 0)
    private(set) var asteroids: [Asteroid] = []
    private(set) var crystals: [Crystal] = []
    private(set) var powerUps: [PowerUp] = []
    private(set) var bullets: [Bullet] = []
    private(set) var missiles: [Missile] = []
    private(set) var drones: [CombatDrone] = []
    private(set) var bolts: [LightningBolt] = []
    private(set) var blackHoles: [BlackHoleFX] = []
    private(set) var particles: [Particle] = []
    private(set) var stars: [Star] = []
    private(set) var floaters: [Floater] = []
    private(set) var backgroundOffset: CGFloat = 0
    private(set) var shake: CGFloat = 0
    private(set) var difficulty: CGFloat = 1
    private(set) var elapsed: TimeInterval = 0
    private(set) var flashWhite: CGFloat = 0
    private(set) var hueShift: CGFloat = 0

    private var size: CGSize = .zero
    private var touchX: CGFloat?
    private var fireCooldown: CGFloat = 0
    private var missileCooldown: CGFloat = 0
    private var spawnTimer: TimeInterval = 0
    private var crystalTimer: TimeInterval = 0
    private var powerUpTimer: TimeInterval = 0
    private var trailTimer: TimeInterval = 0
    private var bossTimer: TimeInterval = 0
    private var bossMinionTimer: CGFloat = 0
    private var scoreAcc: CGFloat = 0
    private var distanceAcc: CGFloat = 0
    private var lastTick: TimeInterval?
    private var comboDecay: CGFloat = 0
    private var baseMaxShields: Int = 3
    private var scoreMulPerm: CGFloat = 1
    private var thrusterMul: CGFloat = 1
    private var lucky: Double = 1
    private var extraBankChance: Double = 0
    private var dailyMod: DailyModifier?
    private var sound = SoundManager.shared
    private var killsSinceMissile: Int = 0
    private var chainDepthGuard: Int = 0

    // MARK: - Lifecycle

    func configure(size: CGSize) {
        guard size.width > 0, size.height > 0 else { return }
        let first = self.size == .zero
        self.size = size
        if first {
            dailyStore.refreshIfNeeded()
            resetWorld()
            spawnStars(count: 70)
            sound.startMusic()
        }
    }

    func startGame(daily: Bool = false) {
        // Always enter playing first so UI never looks "stuck" if audio/haptics hiccup.
        dailyStore.refreshIfNeeded()
        applyUpgradeStats()
        isDailyRun = daily
        dailyMod = daily ? dailyStore.challenge.modifier : nil
        dailyRewardEarned = 0

        resetWorld()
        score = 0
        combo = 0
        maxCombo = 0
        bossesDefeated = 0
        bossActive = false
        bossHP = 0
        bossMaxHP = 0
        asteroidsDestroyed = 0
        rapidTime = 0
        droneTime = 0
        chaosTime = 0
        novaCharge = 0
        mayhemActive = false
        chainCount = 0
        novasFired = 0
        fireCooldown = 0
        missileCooldown = 0
        killsSinceMissile = 0
        flashWhite = 0
        hueShift = 0
        bullets.removeAll(keepingCapacity: true)
        missiles.removeAll(keepingCapacity: true)
        drones.removeAll(keepingCapacity: true)
        bolts.removeAll(keepingCapacity: true)
        blackHoles.removeAll(keepingCapacity: true)

        var startShields = max(1, baseMaxShields)
        if dailyMod == .glassCannon { startShields = 1 }
        shields = startShields
        maxShieldsDisplay = startShields

        sector = 1
        distance = 0
        crystalsCollected = 0
        nearMisses = 0
        isNewBest = false
        // Starting free magnet only if upgraded (no long free ride).
        magnetTime = min(upgrades.startMagnetSeconds, 2.0)
        slowMoTime = 0
        multiplierTime = 0
        nitroTime = 0
        rapidTime = 0
        droneTime = 0
        chaosTime = 0
        invulnTime = 0.55
        lastTick = nil
        touchX = nil

        if dailyMod == .magnetOnly {
            magnetTime = max(magnetTime, 6)
        }

        toast = daily ? "DAILY · \(dailyStore.challenge.modifier.title.uppercased())" : "SECTOR 1"
        toastLife = 1.8
        difficulty = dailyMod == .overdrive ? 1.55 : 1.15
        elapsed = 0
        spawnTimer = 0.22
        crystalTimer = 0.55
        powerUpTimer = 5.5
        bossTimer = dailyMod == .bossHunt ? 14 : 24
        bossMinionTimer = 1.1
        scoreAcc = 0
        distanceAcc = 0
        invulnTime = 0.7
        totalRuns += 1
        UserDefaults.standard.set(totalRuns, forKey: "NeonDriftRuns")

        // Publish phase last so HUD swaps after world is ready.
        phase = .playing
        objectWillChange.send()

        // Non-critical feedback — never block transition.
        DispatchQueue.main.async { [weak self] in
            self?.sound.play("start")
            self?.haptic(.medium)
        }
    }

    func togglePause() {
        if phase == .playing {
            phase = .paused
            lastTick = nil
            objectWillChange.send()
            sound.play("ui", volume: 0.3)
        } else if phase == .paused {
            phase = .playing
            objectWillChange.send()
            sound.play("ui", volume: 0.3)
        }
    }

    func returnToMenu() {
        phase = .menu
        lastTick = nil
        isDailyRun = false
        dailyMod = nil
        resetWorld()
        objectWillChange.send()
        sound.play("ui", volume: 0.3)
    }

    func setTouch(x: CGFloat?) { touchX = x }

    func refreshBankFromDefaults() {
        bankedCrystals = UserDefaults.standard.integer(forKey: "NeonDriftBank")
    }

    @discardableResult
    func purchase(_ id: UpgradeID) -> Bool {
        var bank = bankedCrystals
        guard upgrades.buy(id, bank: &bank) else { return false }
        bankedCrystals = bank
        sound.play("buy")
        haptic(.medium)
        objectWillChange.send()
        return true
    }

    func toggleMute() {
        sound.isMuted.toggle()
        objectWillChange.send()
        if !sound.isMuted { sound.startMusic() }
    }

    var isMuted: Bool { sound.isMuted }

    func notifyUI() {
        objectWillChange.send()
    }

    // MARK: - Update

    func update(now: TimeInterval) {
        guard phase == .playing, size.width > 0 else {
            lastTick = now
            return
        }

        var dt = deltaTime(now: now)
        // Slow-mo is a slight edge, not a free freeze.
        if slowMoTime > 0 { dt *= 0.78 }

        elapsed += TimeInterval(dt)
        let overdrive = dailyMod == .overdrive ? 1.45 : 1.0
        // Steeper ramp — game used to stay too soft for too long.
        difficulty = (1.2 + CGFloat(elapsed) * 0.07 + CGFloat(sector - 1) * 0.24) * overdrive

        let nextSector = Int(elapsed / 16.0) + 1
        if nextSector > sector {
            sector = nextSector
            showToast("SECTOR \(sector)")
            sound.play("sector")
            haptic(.heavy)
            burst(at: CGPoint(x: size.width * 0.5, y: size.height * 0.2), count: 28, color: SIMD3(0.4, 1, 1))
            // Ambush pack on sector change
            for _ in 0..<min(4, 1 + sector / 2) { spawnAsteroid() }
        }

        tickEffects(dt: dt)
        updateMayhemState()
        updateShip(dt: dt)
        updateBackground(dt: dt, speedScale: (nitroTime > 0 || mayhemActive) ? 1.4 : 1)
        updateStars(dt: dt)
        updateAsteroids(dt: dt)
        updateBossSystems(dt: dt)
        updateCrystals(dt: dt)
        updatePowerUps(dt: dt)
        updateBullets(dt: dt)
        updateMissileLauncher(dt: dt)
        updateMissiles(dt: dt)
        updateDrones(dt: dt)
        updateBlackHoles(dt: dt)
        updateBolts(dt: dt)
        autoFire(dt: dt)
        maybeAutoNova()
        updateParticles(dt: dt)
        updateFloaters(dt: dt)
        spawnEntities(dt: dt)
        emitTrail(dt: dt)
        accrueDistanceScore(dt: dt)
        checkCollisions()
        decayCombo(dt: dt)

        if shake > 0 { shake = max(0, shake - dt * 8) }
        if toastLife > 0 { toastLife = max(0, toastLife - dt) }
        if flashWhite > 0 { flashWhite = max(0, flashWhite - dt * 2.2) }
        if mayhemActive || chaosTime > 0 {
            hueShift = (hueShift + dt * 2.5).truncatingRemainder(dividingBy: 1)
        }
        syncBossHUD()

        objectWillChange.send()
    }

    func updateMenuAmbience(now: TimeInterval) {
        guard size.width > 0 else { return }
        let dt = deltaTime(now: now)
        updateBackground(dt: dt, speedScale: 0.32)
        updateStars(dt: dt * 0.4)
        updateParticles(dt: dt)
        updateFloaters(dt: dt)
        if shake > 0 { shake = max(0, shake - dt * 6) }
        objectWillChange.send()
    }

    private func deltaTime(now: TimeInterval) -> CGFloat {
        let dt: CGFloat
        if let last = lastTick {
            dt = min(CGFloat(now - last), 1.0 / 20.0)
        } else {
            dt = 1.0 / 60.0
        }
        lastTick = now
        return dt
    }

    // MARK: - Systems

    private func applyUpgradeStats() {
        baseMaxShields = 3 + upgrades.bonusMaxShields
        scoreMulPerm = upgrades.scoreMultiplier
        thrusterMul = upgrades.thrusterBoost
        lucky = upgrades.luckyFactor
        extraBankChance = upgrades.extraBankChance
        maxShieldsDisplay = baseMaxShields
    }

    private func resetWorld() {
        ship = Ship(x: max(size.width * 0.5, 40), y: max(size.height * 0.78, 120))
        asteroids.removeAll(keepingCapacity: true)
        crystals.removeAll(keepingCapacity: true)
        powerUps.removeAll(keepingCapacity: true)
        bullets.removeAll(keepingCapacity: true)
        missiles.removeAll(keepingCapacity: true)
        drones.removeAll(keepingCapacity: true)
        bolts.removeAll(keepingCapacity: true)
        blackHoles.removeAll(keepingCapacity: true)
        particles.removeAll(keepingCapacity: true)
        floaters.removeAll(keepingCapacity: true)
        lastTick = nil
        touchX = nil
        fireCooldown = 0
        missileCooldown = 0
        shake = 0
        backgroundOffset = 0
        bossActive = false
        flashWhite = 0
    }

    private func spawnStars(count: Int) {
        stars = (0..<count).map { _ in
            Star(
                x: .random(in: 0...max(size.width, 1)),
                y: .random(in: 0...max(size.height, 1)),
                speed: .random(in: 40...180),
                size: .random(in: 1...2.8),
                brightness: .random(in: 0.25...0.95)
            )
        }
    }

    private func tickEffects(dt: CGFloat) {
        magnetTime = max(0, magnetTime - dt)
        slowMoTime = max(0, slowMoTime - dt)
        multiplierTime = max(0, multiplierTime - dt)
        nitroTime = max(0, nitroTime - dt)
        rapidTime = max(0, rapidTime - dt)
        droneTime = max(0, droneTime - dt)
        chaosTime = max(0, chaosTime - dt)
        invulnTime = max(0, invulnTime - dt)
        if droneTime <= 0 { drones.removeAll(keepingCapacity: true) }
    }

    private func updateMayhemState() {
        // Mayhem is a late-combo reward, not early steamroll.
        let should = combo >= 18 || chaosTime > 0
        if should && !mayhemActive {
            mayhemActive = true
            showToast("⚡ MAYHEM MODE ⚡")
            sound.play("mayhem", volume: 0.45)
            haptic(.heavy)
            flashWhite = 0.25
        } else if !should {
            mayhemActive = false
        }
    }

    private func maybeAutoNova() {
        guard novaCharge >= 1 else { return }
        fireNova()
    }

    /// Manual trigger from UI if desired (also auto when full).
    func triggerNovaIfReady() {
        guard phase == .playing, novaCharge >= 1 else { return }
        fireNova()
    }

    private func updateShip(dt: CGFloat) {
        let targetX = touchX ?? ship.x
        let maxSpeed: CGFloat = (nitroTime > 0 ? 700 : 540) * thrusterMul
        let accel: CGFloat = (nitroTime > 0 ? 24 : 18) * thrusterMul
        let dx = targetX - ship.x
        ship.vx += dx * accel * dt
        ship.vx *= pow(0.06, dt)
        ship.vx = max(-maxSpeed, min(maxSpeed, ship.vx))
        ship.x += ship.vx * dt
        let margin = ship.radius + 8
        ship.x = max(margin, min(size.width - margin, ship.x))
    }

    private func updateBackground(dt: CGFloat, speedScale: CGFloat) {
        let scroll = 90 * max(difficulty, 1) * speedScale
        backgroundOffset += scroll * dt
        if size.height > 0 {
            backgroundOffset = backgroundOffset.truncatingRemainder(dividingBy: size.height)
        }
    }

    private func updateStars(dt: CGFloat) {
        let scroll = 120 * difficulty * (nitroTime > 0 ? 1.4 : 1)
        for i in stars.indices {
            stars[i].y += (stars[i].speed + scroll * 0.35) * dt
            if stars[i].y > size.height + 4 {
                stars[i].y = -4
                stars[i].x = .random(in: 0...size.width)
            }
        }
    }

    private func updateAsteroids(dt: CGFloat) {
        let speedMul: CGFloat = nitroTime > 0 ? 1.15 : 1
        for i in asteroids.indices {
            if asteroids[i].isBoss {
                // Boss patrols mid-upper field
                asteroids[i].x += asteroids[i].vx * dt
                asteroids[i].rotation += asteroids[i].spin * dt
                let targetY = size.height * 0.22
                asteroids[i].y += (targetY - asteroids[i].y) * min(1, 1.6 * dt)
                if asteroids[i].x < asteroids[i].radius + 8 {
                    asteroids[i].x = asteroids[i].radius + 8
                    asteroids[i].vx = abs(asteroids[i].vx)
                } else if asteroids[i].x > size.width - asteroids[i].radius - 8 {
                    asteroids[i].x = size.width - asteroids[i].radius - 8
                    asteroids[i].vx = -abs(asteroids[i].vx)
                }
            } else {
                asteroids[i].y += asteroids[i].speed * speedMul * dt
                asteroids[i].x += asteroids[i].vx * dt
                asteroids[i].rotation += asteroids[i].spin * dt
                if asteroids[i].x < asteroids[i].radius {
                    asteroids[i].x = asteroids[i].radius
                    asteroids[i].vx = abs(asteroids[i].vx)
                } else if asteroids[i].x > size.width - asteroids[i].radius {
                    asteroids[i].x = size.width - asteroids[i].radius
                    asteroids[i].vx = -abs(asteroids[i].vx)
                }
            }
        }
        asteroids.removeAll { !$0.isBoss && $0.y - $0.radius > size.height + 30 }
    }

    private func updateBossSystems(dt: CGFloat) {
        bossTimer -= TimeInterval(dt)
        if bossTimer <= 0 && !bossActive {
            spawnBoss()
            bossTimer = dailyMod == .bossHunt ? 28 : 38
        }

        bossMinionTimer -= dt
        for i in asteroids.indices where asteroids[i].isBoss {
            asteroids[i].coreTimer -= dt
            if asteroids[i].coreTimer <= 0 {
                dropBossCore(from: asteroids[i])
                asteroids[i].coreTimer = CGFloat.random(in: 0.9...1.4)
            }
            if bossMinionTimer <= 0 {
                spawnAsteroid(miniFromBoss: true, nearX: asteroids[i].x)
                spawnAsteroid(miniFromBoss: true, nearX: asteroids[i].x)
                bossMinionTimer = CGFloat.random(in: 0.9...1.5)
            }
        }
    }

    private func syncBossHUD() {
        if let boss = asteroids.first(where: { $0.isBoss }) {
            bossActive = true
            bossHP = boss.hp
            bossMaxHP = boss.maxHp
        } else {
            bossActive = false
            bossHP = 0
        }
    }

    private func updateCrystals(dt: CGFloat) {
        for i in crystals.indices {
            if magnetTime > 0 || crystals[i].damagesBoss {
                let pull: CGFloat = crystals[i].damagesBoss ? 220 : 320
                let dx = ship.x - crystals[i].x
                let dy = ship.y - crystals[i].y
                let dist = max(1, sqrt(dx * dx + dy * dy))
                crystals[i].x += dx / dist * pull * dt * (magnetTime > 0 || crystals[i].damagesBoss ? 1 : 0)
                if magnetTime > 0 {
                    crystals[i].y += dy / dist * pull * dt
                } else if crystals[i].damagesBoss {
                    crystals[i].y += crystals[i].speed * dt * 0.65
                    crystals[i].y += dy / dist * pull * 0.35 * dt
                } else {
                    crystals[i].y += crystals[i].speed * dt
                }
            } else {
                crystals[i].y += crystals[i].speed * dt
            }
            crystals[i].pulse += dt * 6
        }
        crystals.removeAll { $0.y - $0.radius > size.height + 30 }
    }

    private func updatePowerUps(dt: CGFloat) {
        for i in powerUps.indices {
            powerUps[i].y += powerUps[i].speed * dt
            powerUps[i].pulse += dt * 5
            powerUps[i].x += sin(powerUps[i].pulse) * 18 * dt
        }
        powerUps.removeAll { $0.y - $0.radius > size.height + 30 }
    }

    private func updateParticles(dt: CGFloat) {
        for i in particles.indices {
            particles[i].x += particles[i].vx * dt
            particles[i].y += particles[i].vy * dt
            particles[i].life -= dt
            particles[i].vy += 18 * dt
        }
        particles.removeAll { $0.life <= 0 }
        if particles.count > 420 { particles.removeFirst(particles.count - 420) }
    }

    private func updateFloaters(dt: CGFloat) {
        for i in floaters.indices {
            floaters[i].y -= floaters[i].rise * dt
            floaters[i].life -= dt
        }
        floaters.removeAll { $0.life <= 0 }
        if floaters.count > 28 { floaters.removeFirst(floaters.count - 28) }
    }

    private func spawnEntities(dt: CGFloat) {
        // Fewer normal spawns while boss is active
        let spawnScale: TimeInterval = bossActive ? 1.35 : 1

        spawnTimer -= TimeInterval(dt)
        crystalTimer -= TimeInterval(dt)
        powerUpTimer -= TimeInterval(dt)

        if spawnTimer <= 0 {
            let maxBurst = sector >= 5 ? 3 : (sector >= 2 ? 2 : 1)
            let burst = Int.random(in: 1...maxBurst)
            for _ in 0..<burst { spawnAsteroid() }
            // Tighter spawns as difficulty climbs
            let base: TimeInterval = max(0.16, 0.62 - TimeInterval(difficulty) * 0.09) * spawnScale
            spawnTimer = base + TimeInterval.random(in: 0...0.1)
        }

        if crystalTimer <= 0 {
            spawnCrystal()
            let gemRush = dailyMod == .gemRush
            if (Bool.random() && sector >= 2) || gemRush {
                spawnCrystal()
            }
            if gemRush { spawnCrystal() }
            crystalTimer = TimeInterval.random(in: gemRush ? 0.28...0.55 : 0.55...1.15)
        }

        if powerUpTimer <= 0 {
            spawnPowerUp()
            let interval = 8.5 / max(1.0, lucky * 0.85)
            powerUpTimer = TimeInterval.random(in: interval...(interval + 4.5))
        }
    }

    private func spawnAsteroid(miniFromBoss: Bool = false, nearX: CGFloat? = nil) {
        let r = miniFromBoss ? CGFloat.random(in: 16...26) : CGFloat.random(in: 24...52)
        let x: CGFloat
        if let nearX {
            x = min(size.width - r, max(r, nearX + .random(in: -90...90)))
        } else {
            // Bias toward player lane sometimes so dodging matters
            if !miniFromBoss, Bool.random(), size.width > 0 {
                let aim = ship.x + CGFloat.random(in: -70...70)
                x = min(size.width - r, max(r, aim))
            } else {
                x = .random(in: r...(size.width - r))
            }
        }
        let speed = CGFloat.random(in: 190...300) * difficulty * (miniFromBoss ? 1.2 : 1)
        // Tankier rocks — shooting should feel earned
        let hp: Int
        if miniFromBoss {
            hp = 2
        } else if r > 42 {
            hp = 5 + (sector >= 4 ? 1 : 0)
        } else if r > 32 {
            hp = 3 + (sector >= 3 ? 1 : 0)
        } else {
            hp = 2
        }
        asteroids.append(
            Asteroid(
                x: x,
                y: -r - 12,
                vx: .random(in: -70...70) * min(1.8, difficulty * 0.55),
                radius: r,
                speed: speed,
                rotation: .random(in: 0...(2 * .pi)),
                spin: .random(in: -2.8...2.8),
                spriteIndex: Int.random(in: 0...2),
                hp: hp,
                maxHp: hp
            )
        )
    }

    // MARK: - Weapons

    private func autoFire(dt: CGFloat) {
        fireCooldown -= dt
        guard fireCooldown <= 0 else { return }

        let rapid = rapidTime > 0 || nitroTime > 0 || mayhemActive
        let rateBoost = 1.0 + 0.08 * CGFloat(upgrades.level(of: .thrusters)) + (mayhemActive ? 0.15 : 0)
        // Slower base fire — spray was deleting the sky for free
        let interval: CGFloat = (rapid ? 0.12 : 0.22) / rateBoost
        fireCooldown = interval

        let muzzleY = ship.y - ship.visualRadius * 0.72
        let damage = mayhemActive ? 2 : 1
        let style = mayhemActive ? 2 : (rapid ? 1 : 0)
        let speed: CGFloat = mayhemActive ? 820 : (rapid ? 720 : 600)

        spawnBullet(x: ship.x, y: muzzleY, vx: ship.vx * 0.08, vy: -speed, damage: damage, style: style)

        // Dual only with power-ups / late mayhem — not free sector 3 triple
        if rapid || mayhemActive {
            spawnBullet(x: ship.x - 14, y: muzzleY + 4, vx: -40 + ship.vx * 0.05, vy: -speed * 0.98, damage: 1, style: style)
            spawnBullet(x: ship.x + 14, y: muzzleY + 4, vx: 40 + ship.vx * 0.05, vy: -speed * 0.98, damage: 1, style: style)
        }

        // Mayhem: one extra diagonal, not a bullet hose
        if mayhemActive {
            let t = CGFloat(elapsed)
            spawnBullet(x: ship.x, y: muzzleY, vx: cos(t * 6) * 90, vy: -speed * 0.92, damage: 1, style: 2)
        }

        for _ in 0..<(mayhemActive ? 6 : 3) {
            particles.append(
                Particle(
                    x: ship.x + .random(in: -4...4),
                    y: muzzleY,
                    vx: .random(in: -40...40),
                    vy: .random(in: -140...(-40)),
                    life: 0.12,
                    maxLife: 0.12,
                    size: .random(in: 2...5),
                    color: mayhemActive
                        ? SIMD3(Float.random(in: 0.4...1), Float.random(in: 0.2...1), Float.random(in: 0.4...1))
                        : (rapid ? SIMD3(1.0, 0.85, 0.3) : SIMD3(0.4, 0.95, 1.0))
                )
            )
        }
        sound.play("shoot", volume: mayhemActive ? 0.12 : (rapid ? 0.2 : 0.15))
    }

    private func updateMissileLauncher(dt: CGFloat) {
        missileCooldown -= dt
        guard missileCooldown <= 0 else { return }
        guard killsSinceMissile >= 10 || mayhemActive || chaosTime > 0 else { return }
        launchMissile()
        killsSinceMissile = 0
        missileCooldown = mayhemActive ? 1.1 : 2.2
    }

    private func updateMissiles(dt: CGFloat) {
        for i in missiles.indices {
            // Home toward nearest asteroid
            var aimX = missiles[i].x
            var aimY = missiles[i].y - 200
            if let target = nearestAsteroid(to: CGPoint(x: missiles[i].x, y: missiles[i].y)) {
                aimX = target.x
                aimY = target.y
            }
            let dx = aimX - missiles[i].x
            let dy = aimY - missiles[i].y
            let dist = max(1, sqrt(dx * dx + dy * dy))
            let desiredVX = dx / dist * 420
            let desiredVY = dy / dist * 420
            missiles[i].vx += (desiredVX - missiles[i].vx) * min(1, missiles[i].turn * dt)
            missiles[i].vy += (desiredVY - missiles[i].vy) * min(1, missiles[i].turn * dt)
            missiles[i].x += missiles[i].vx * dt
            missiles[i].y += missiles[i].vy * dt
            missiles[i].life -= dt
            // Smoke trail
            if Int(missiles[i].life * 30) % 2 == 0 {
                particles.append(
                    Particle(
                        x: missiles[i].x, y: missiles[i].y,
                        vx: .random(in: -20...20), vy: .random(in: 20...60),
                        life: 0.25, maxLife: 0.25, size: 3,
                        color: SIMD3(1, 0.5, 0.2)
                    )
                )
            }
        }
        missiles.removeAll { $0.life <= 0 || $0.y < -40 || $0.y > size.height + 40 }

        // Missile collisions
        var mRemove = Set<Int>()
        var aRemove = Set<Int>()
        var bossHits: [(Int, Int, CGPoint)] = []
        for (mi, m) in missiles.enumerated() {
            for (ai, rock) in asteroids.enumerated() {
                let dx = m.x - rock.x
                let dy = m.y - rock.y
                if dx * dx + dy * dy < pow(rock.radius + 10, 2) {
                    mRemove.insert(mi)
                    if rock.isBoss {
                        bossHits.append((ai, 4, CGPoint(x: rock.x, y: rock.y)))
                    } else {
                        aRemove.insert(ai)
                    }
                    burst(at: CGPoint(x: m.x, y: m.y), count: 16, color: SIMD3(1, 0.45, 0.15))
                    break
                }
            }
        }
        for mi in mRemove.sorted(by: >) where missiles.indices.contains(mi) {
            missiles.remove(at: mi)
        }
        for hit in bossHits.sorted(by: { $0.0 > $1.0 }) {
            damageBoss(index: hit.0, amount: hit.1, source: hit.2)
        }
        for ai in aRemove.sorted(by: >) where asteroids.indices.contains(ai) {
            destroyAsteroid(at: ai, byBullet: true, allowChain: true)
        }
    }

    private func launchMissile() {
        missiles.append(
            Missile(
                x: ship.x + .random(in: -8...8),
                y: ship.y - 20,
                vx: .random(in: -40...40),
                vy: -280,
                life: 3.2,
                turn: 7
            )
        )
        sound.play("missile", volume: 0.3)
    }

    private func nearestAsteroid(to point: CGPoint) -> Asteroid? {
        var best: Asteroid?
        var bestD = CGFloat.greatestFiniteMagnitude
        for a in asteroids {
            let dx = a.x - point.x
            let dy = a.y - point.y
            let d = dx * dx + dy * dy
            if d < bestD {
                bestD = d
                best = a
            }
        }
        return best
    }

    private func activateDrones() {
        droneTime = max(droneTime, 8)
        if drones.isEmpty {
            // Two drones max — three was melting waves
            drones = [
                CombatDrone(angle: 0, orbit: 52, fireCD: 0),
                CombatDrone(angle: .pi, orbit: 52, fireCD: 0.2)
            ]
        }
    }

    private func updateDrones(dt: CGFloat) {
        // Drones only from power-up / chaos — not free during mayhem
        guard droneTime > 0 else {
            if !drones.isEmpty && chaosTime <= 0 { drones.removeAll(keepingCapacity: true) }
            return
        }
        if drones.isEmpty { activateDrones() }
        for i in drones.indices {
            drones[i].angle += dt * 2.4
            drones[i].fireCD -= dt
            let dx = cos(drones[i].angle) * drones[i].orbit
            let dy = sin(drones[i].angle) * drones[i].orbit * 0.55
            let x = ship.x + dx
            let y = ship.y + dy
            if drones[i].fireCD <= 0 {
                drones[i].fireCD = 0.32
                spawnBullet(x: x, y: y - 6, vx: 0, vy: -620, damage: 1, style: 3)
            }
            // Drone body sparkle
            if Int(elapsed * 20 + Double(i)) % 3 == 0 {
                particles.append(
                    Particle(x: x, y: y, vx: 0, vy: 0, life: 0.15, maxLife: 0.15, size: 2.5, color: SIMD3(0.7, 0.5, 1))
                )
            }
        }
    }

    private func updateBlackHoles(dt: CGFloat) {
        for i in blackHoles.indices {
            blackHoles[i].life -= dt
            let pull = 380 * (blackHoles[i].life / blackHoles[i].maxLife)
            for j in asteroids.indices where !asteroids[j].isBoss {
                let dx = blackHoles[i].x - asteroids[j].x
                let dy = blackHoles[i].y - asteroids[j].y
                let dist = max(20, sqrt(dx * dx + dy * dy))
                if dist < blackHoles[i].radius * 2.2 {
                    asteroids[j].x += dx / dist * pull * dt
                    asteroids[j].y += dy / dist * pull * dt
                    if dist < blackHoles[i].radius * 0.55 {
                        asteroids[j].hp = 0
                    }
                }
            }
            // Swallow crystals gently toward center (optional score later)
            for j in crystals.indices {
                let dx = blackHoles[i].x - crystals[j].x
                let dy = blackHoles[i].y - crystals[j].y
                let dist = max(1, sqrt(dx * dx + dy * dy))
                crystals[j].x += dx / dist * 120 * dt
                crystals[j].y += dy / dist * 120 * dt
            }
        }
        // Destroy zero-hp rocks from hole
        for ai in asteroids.indices.reversed() where !asteroids[ai].isBoss && asteroids[ai].hp <= 0 {
            destroyAsteroid(at: ai, byBullet: true, allowChain: false)
        }
        blackHoles.removeAll { $0.life <= 0 }
    }

    private func updateBolts(dt: CGFloat) {
        for i in bolts.indices {
            bolts[i].life -= dt
        }
        bolts.removeAll { $0.life <= 0 }
        if bolts.count > 24 { bolts.removeFirst(bolts.count - 24) }
    }

    private func spawnBlackHole(at point: CGPoint) {
        blackHoles.append(
            BlackHoleFX(x: point.x, y: point.y, life: 2.2, maxLife: 2.2, radius: 52)
        )
        showToast("SINGULARITY")
        sound.play("blackhole", volume: 0.5)
        shake = 1.1
        flashWhite = 0.15
    }

    private func fireNova() {
        novaCharge = 0
        novasFired += 1
        flashWhite = 0.4
        shake = 1.2
        showToast("⭐ NOVA BLAST ⭐")
        sound.play("nova", volume: 0.55)
        haptic(.heavy)

        // Partial clear near ship — not a free full-screen wipe
        let novaR: CGFloat = min(size.width, size.height) * 0.42
        var removeIdx: [Int] = []
        for (i, rock) in asteroids.enumerated() {
            let dx = rock.x - ship.x
            let dy = rock.y - ship.y
            let inRange = dx * dx + dy * dy <= novaR * novaR
            if rock.isBoss {
                if inRange { damageBoss(index: i, amount: 3, source: CGPoint(x: rock.x, y: rock.y)) }
            } else if inRange {
                removeIdx.append(i)
            }
        }
        for i in removeIdx.sorted(by: >) {
            destroyAsteroid(at: i, byBullet: true, allowChain: false)
        }
        for k in 0..<36 {
            let a = CGFloat(k) / 36 * (.pi * 2)
            particles.append(
                Particle(
                    x: ship.x, y: ship.y,
                    vx: cos(a) * 240, vy: sin(a) * 240,
                    life: 0.55, maxLife: 0.55, size: 4,
                    color: SIMD3(1, Float.random(in: 0.4...1), Float.random(in: 0.6...1))
                )
            )
        }
        score += Int(120 * scoreMulPerm)
        invulnTime = max(invulnTime, 0.45)
    }

    private func fireChainLightning(from origin: CGPoint, remaining: Int) {
        guard remaining > 0, chainDepthGuard < 8 else { return }
        chainDepthGuard += 1
        defer { chainDepthGuard -= 1 }

        var bestIdx: Int?
        var bestD = CGFloat(130 * 130)
        for (i, rock) in asteroids.enumerated() where !rock.isBoss {
            let dx = rock.x - origin.x
            let dy = rock.y - origin.y
            let d = dx * dx + dy * dy
            if d < bestD && d > 4 {
                bestD = d
                bestIdx = i
            }
        }
        guard let idx = bestIdx else { return }
        let target = asteroids[idx]
        bolts.append(
            LightningBolt(
                x1: origin.x, y1: origin.y,
                x2: target.x, y2: target.y,
                life: 0.18, maxLife: 0.18
            )
        )
        chainCount += 1
        sound.play("zap", volume: 0.25)
        destroyAsteroid(at: idx, byBullet: true, allowChain: remaining > 1)
    }

    private func spawnBullet(x: CGFloat, y: CGFloat, vx: CGFloat, vy: CGFloat, damage: Int, style: Int) {
        bullets.append(
            Bullet(x: x, y: y, vx: vx, vy: vy, radius: style == 1 ? 5 : 4, damage: damage, style: style)
        )
        if bullets.count > 80 {
            bullets.removeFirst(bullets.count - 80)
        }
    }

    private func updateBullets(dt: CGFloat) {
        for i in bullets.indices {
            bullets[i].x += bullets[i].vx * dt
            bullets[i].y += bullets[i].vy * dt
        }
        bullets.removeAll {
            $0.y + $0.radius < -20
                || $0.y - $0.radius > size.height + 40
                || $0.x < -30
                || $0.x > size.width + 30
        }
    }

    private func spawnBoss() {
        guard !bossActive else { return }
        let r: CGFloat = min(size.width * 0.18, 72)
        let hp = 14 + sector * 5 + (dailyMod == .bossHunt ? 8 : 0)
        asteroids.append(
            Asteroid(
                x: size.width * 0.5,
                y: -r - 40,
                vx: CGFloat.random(in: 70...110) * (Bool.random() ? 1 : -1),
                radius: r,
                speed: 0,
                rotation: 0,
                spin: CGFloat.random(in: 0.6...1.2),
                spriteIndex: 2,
                isBoss: true,
                hp: hp,
                maxHp: hp,
                coreTimer: 0.5
            )
        )
        bossActive = true
        bossHP = hp
        bossMaxHP = hp
        showToast("BOSS INBOUND")
        sound.play("boss")
        haptic(.heavy)
        shake = 0.7
        burst(at: CGPoint(x: size.width * 0.5, y: size.height * 0.18), count: 40, color: SIMD3(1, 0.3, 0.4))
    }

    private func dropBossCore(from boss: Asteroid) {
        crystals.append(
            Crystal(
                x: boss.x + .random(in: -boss.radius * 0.4...boss.radius * 0.4),
                y: boss.y + boss.radius * 0.3,
                radius: 13,
                speed: 90,
                pulse: .random(in: 0...(.pi * 2)),
                isGold: true,
                damagesBoss: true
            )
        )
    }

    private func spawnCrystal() {
        var goldChance = 0.12 * lucky
        if dailyMod == .goldFever { goldChance = 0.55 }
        let gold = Double.random(in: 0...1) < goldChance
        crystals.append(
            Crystal(
                x: .random(in: 28...(size.width - 28)),
                y: -24,
                radius: gold ? 16 : 14,
                speed: 130 * difficulty * 0.85,
                pulse: .random(in: 0...(.pi * 2)),
                isGold: gold
            )
        )
    }

    private func spawnPowerUp() {
        // Strong pickups are rare.
        let roll = Double.random(in: 0...1)
        let kind: PowerUpKind
        if roll < 0.035 {
            kind = .chaos
        } else if roll < 0.08 {
            kind = .blackhole
        } else if roll < 0.16 {
            kind = .drones
        } else {
            let basic: [PowerUpKind] = [.shield, .magnet, .slowmo, .multiplier, .nitro, .rapid]
            kind = basic.randomElement() ?? .shield
        }
        powerUps.append(
            PowerUp(
                x: .random(in: 36...(size.width - 36)),
                y: -30,
                radius: kind == .chaos ? 20 : 16,
                speed: 140 * difficulty * 0.8,
                kind: kind,
                pulse: .random(in: 0...(.pi * 2))
            )
        )
    }

    private func emitTrail(dt: CGFloat) {
        trailTimer -= TimeInterval(dt)
        guard trailTimer <= 0 else { return }
        trailTimer = nitroTime > 0 ? 0.018 : 0.03
        let boost = abs(ship.vx) / 540
        let c: SIMD3<Float> = nitroTime > 0 ? SIMD3(0.3, 1.0, 0.55) : SIMD3(0.2, 0.95, 1.0)
        particles.append(
            Particle(
                x: ship.x + .random(in: -5...5),
                y: ship.y + ship.radius * 0.65,
                vx: .random(in: -24...24) - ship.vx * 0.1,
                vy: .random(in: 90...180),
                life: 0.32,
                maxLife: 0.32,
                size: .random(in: 2...6) * (0.7 + boost),
                color: c
            )
        )
    }

    private func accrueDistanceScore(dt: CGFloat) {
        // Survival score is slower — combat skill should dominate
        let rate: CGFloat = (nitroTime > 0 ? 10 : 6) * difficulty * scoreMulPerm
        let glass = dailyMod == .glassCannon ? 1.2 : 1
        distanceAcc += rate * glass * dt
        while distanceAcc >= 1 {
            distanceAcc -= 1
            distance += 1
            var pts: CGFloat = multiplierTime > 0 ? 1.4 : 0.7
            pts *= scoreMulPerm * glass
            scoreAcc += pts
        }
        while scoreAcc >= 1 {
            scoreAcc -= 1
            score += 1
        }
    }

    private func decayCombo(dt: CGFloat) {
        if combo > 0 {
            comboDecay -= dt
            if comboDecay <= 0 {
                combo = max(0, combo - 1)
                comboDecay = 1.1
            }
        }
    }

    private func checkCollisions() {
        // Bullets vs asteroids / boss
        checkBulletHits()

        crystals.removeAll { crystal in
            let dx = crystal.x - ship.x
            let dy = crystal.y - ship.y
            if dx * dx + dy * dy < pow(crystal.radius + ship.radius * 0.95, 2) {
                collectCrystal(crystal)
                return true
            }
            return false
        }

        powerUps.removeAll { pup in
            let dx = pup.x - ship.x
            let dy = pup.y - ship.y
            if dx * dx + dy * dy < pow(pup.radius + ship.radius, 2) {
                collectPowerUp(pup)
                return true
            }
            return false
        }

        for i in asteroids.indices {
            let rock = asteroids[i]
            let dx = rock.x - ship.x
            let dy = rock.y - ship.y
            let dist2 = dx * dx + dy * dy
            let hitR = rock.radius * (rock.isBoss ? 0.72 : 0.8) + ship.radius * 0.7
            let nearR = rock.radius + ship.radius + (rock.isBoss ? 28 : 22)

            if dist2 < hitR * hitR {
                handleHit(at: CGPoint(x: ship.x, y: ship.y), rockIndex: i)
                return
            }

            if !asteroids[i].nearMissAwarded && dist2 < nearR * nearR && dy > -10 && dy < rock.radius + 20 {
                asteroids[i].nearMissAwarded = true
                awardNearMiss(at: CGPoint(x: rock.x, y: rock.y), boss: rock.isBoss)
            }
        }
    }

    private func checkBulletHits() {
        var bulletsToRemove = Set<Int>()
        // rockIndex -> total damage this frame
        var damageMap: [Int: Int] = [:]
        var impactPoints: [(CGPoint, Int)] = [] // point, style

        for (bi, bullet) in bullets.enumerated() {
            if bulletsToRemove.contains(bi) { continue }
            for (ai, rock) in asteroids.enumerated() {
                let dx = bullet.x - rock.x
                let dy = bullet.y - rock.y
                let hitR = bullet.radius + rock.radius * (rock.isBoss ? 0.78 : 0.88)
                if dx * dx + dy * dy <= hitR * hitR {
                    bulletsToRemove.insert(bi)
                    damageMap[ai, default: 0] += bullet.damage
                    impactPoints.append((CGPoint(x: bullet.x, y: bullet.y), bullet.style))
                    break
                }
            }
        }

        for bi in bulletsToRemove.sorted(by: >) {
            if bullets.indices.contains(bi) { bullets.remove(at: bi) }
        }

        for (point, style) in impactPoints {
            burst(
                at: point,
                count: 5,
                color: style == 1 ? SIMD3(1, 0.8, 0.25) : SIMD3(0.4, 1, 1)
            )
        }

        // Apply damage high-index first so removals stay valid.
        for ai in damageMap.keys.sorted(by: >) {
            guard asteroids.indices.contains(ai) else { continue }
            let dmg = damageMap[ai] ?? 0
            let rock = asteroids[ai]
            if rock.isBoss {
                damageBoss(index: ai, amount: dmg, source: CGPoint(x: rock.x, y: rock.y))
            } else {
                asteroids[ai].hp -= dmg
                if asteroids[ai].hp <= 0 {
                    destroyAsteroid(at: ai, byBullet: true, allowChain: true)
                } else {
                    asteroids[ai].y -= CGFloat(min(10, dmg * 4))
                    sound.play("bossHit", volume: 0.18)
                }
            }
        }
    }

    private func destroyAsteroid(at index: Int, byBullet: Bool, allowChain: Bool = true) {
        guard asteroids.indices.contains(index) else { return }
        let rock = asteroids[index]
        if rock.isBoss {
            defeatBoss(at: index)
            return
        }
        let ox = rock.x
        let oy = rock.y
        asteroids.remove(at: index)
        if byBullet {
            asteroidsDestroyed += 1
            killsSinceMissile += 1
            combo += 1
            maxCombo = max(maxCombo, combo)
            comboDecay = 1.25
            var gained = CGFloat(12 + Int(rock.radius) + min(combo, 10) * 1) * scoreMulPerm
            if multiplierTime > 0 { gained *= 1.75 }
            if mayhemActive { gained *= 1.25 }
            let g = Int(gained.rounded())
            score += g
            float(text: "+\(g)", at: CGPoint(x: ox, y: oy), color: mayhemActive ? SIMD3(1, 0.3, 0.8) : SIMD3(0.45, 1, 0.95))
            // Nova charges slowly
            novaCharge = min(1, novaCharge + (mayhemActive ? 0.035 : 0.022))
            if Double.random(in: 0...1) < 0.18 * lucky {
                crystals.append(
                    Crystal(x: ox, y: oy, radius: 12, speed: 80, pulse: 0, isGold: Double.random(in: 0...1) < 0.25)
                )
            }
            // Chain is rare and short — no screen-wide delete combos
            if allowChain && (combo >= 10 || mayhemActive), Double.random(in: 0...1) < (mayhemActive ? 0.45 : 0.28) {
                fireChainLightning(from: CGPoint(x: ox, y: oy), remaining: mayhemActive ? 2 : 1)
            }
        }
        burst(
            at: CGPoint(x: ox, y: oy),
            count: mayhemActive ? 28 : 18,
            color: mayhemActive
                ? SIMD3(Float.random(in: 0.5...1), Float.random(in: 0.2...1), Float.random(in: 0.5...1))
                : SIMD3(0.75, 0.75, 0.9)
        )
        sound.play("explode", volume: 0.26)
        haptic(.light)
    }

    private func collectCrystal(_ crystal: Crystal) {
        combo += 1
        maxCombo = max(maxCombo, combo)
        comboDecay = 1.4
        crystalsCollected += 1

        if crystal.damagesBoss, let idx = asteroids.firstIndex(where: { $0.isBoss }) {
            damageBoss(index: idx, amount: 1, source: CGPoint(x: crystal.x, y: crystal.y))
        }

        let base = crystal.isGold ? 40 : 12
        let comboBonus = min(combo, 15) * (crystal.isGold ? 4 : 2)
        var gained = CGFloat(base + comboBonus) * scoreMulPerm
        if dailyMod == .glassCannon { gained *= 1.35 }
        if multiplierTime > 0 { gained *= 2 }
        let gainedInt = Int(gained.rounded())
        score += gainedInt

        var bankAdd = crystal.isGold ? 3 : 1
        if crystal.damagesBoss { bankAdd += 1 }
        if Double.random(in: 0...1) < extraBankChance { bankAdd += 1 }
        bankedCrystals += bankAdd
        UserDefaults.standard.set(bankedCrystals, forKey: "NeonDriftBank")

        float(
            text: crystal.damagesBoss ? "CORE +\(gainedInt)" : (crystal.isGold ? "+\(gainedInt) GOLD" : "+\(gainedInt)"),
            at: CGPoint(x: crystal.x, y: crystal.y),
            color: crystal.damagesBoss ? SIMD3(1, 0.4, 0.35) : (crystal.isGold ? SIMD3(1, 0.85, 0.25) : SIMD3(1, 0.45, 0.95))
        )
        burst(
            at: CGPoint(x: crystal.x, y: crystal.y),
            count: crystal.isGold ? 16 : 12,
            color: crystal.isGold ? SIMD3(1, 0.85, 0.3) : SIMD3(1, 0.45, 0.95)
        )
        sound.play(crystal.isGold || crystal.damagesBoss ? "gold" : "collect", volume: 0.45)
        haptic(.light)
    }

    private func collectPowerUp(_ pup: PowerUp) {
        score += Int((multiplierTime > 0 ? 80 : 40) * scoreMulPerm)
        switch pup.kind {
        case .shield:
            shields = min(maxShieldsDisplay, shields + 1)
            showToast("SHIELD +1")
        case .magnet:
            magnetTime = max(magnetTime, 4.5)
            showToast("MAGNET")
        case .slowmo:
            slowMoTime = max(slowMoTime, 3.2)
            showToast("SLOW-MO")
        case .multiplier:
            multiplierTime = max(multiplierTime, 5.5)
            showToast("×2 SCORE")
        case .nitro:
            nitroTime = max(nitroTime, 3.5)
            rapidTime = max(rapidTime, 3.5)
            showToast("NITRO")
        case .rapid:
            rapidTime = max(rapidTime, 5)
            showToast("RAPID FIRE")
        case .drones:
            activateDrones()
            showToast("DRONE SWARM")
        case .chaos:
            chaosTime = max(chaosTime, 6)
            rapidTime = max(rapidTime, 6)
            multiplierTime = max(multiplierTime, 6)
            invulnTime = max(invulnTime, 0.8)
            showToast("💀 CHAOS UNLEASHED 💀")
            flashWhite = 0.35
            shake = 1.1
            activateDrones()
            launchMissile()
        case .blackhole:
            spawnBlackHole(at: CGPoint(x: size.width * 0.5, y: size.height * 0.35))
        }
        float(text: pup.kind.title, at: CGPoint(x: pup.x, y: pup.y), color: pup.kind.color)
        burst(at: CGPoint(x: pup.x, y: pup.y), count: 28, color: pup.kind.color)
        sound.play("power")
        haptic(.medium)
    }

    private func awardNearMiss(at point: CGPoint, boss: Bool) {
        nearMisses += 1
        combo += 1
        maxCombo = max(maxCombo, combo)
        comboDecay = 1.2
        var gained = CGFloat(20 + min(combo, 10) * 2) * scoreMulPerm * (boss ? 1.5 : 1)
        if multiplierTime > 0 { gained *= 2 }
        let g = Int(gained.rounded())
        score += g
        float(text: boss ? "BOSS GRAZE +\(g)" : "NEAR MISS +\(g)", at: point, color: SIMD3(0.45, 1, 0.85))
        sound.play("near", volume: 0.35)
        haptic(.soft)
    }

    private func damageBoss(index: Int, amount: Int, source: CGPoint) {
        guard asteroids.indices.contains(index), asteroids[index].isBoss else { return }
        asteroids[index].hp -= amount
        bossHP = asteroids[index].hp
        burst(at: source, count: 10, color: SIMD3(1, 0.35, 0.4))
        sound.play("bossHit", volume: 0.4)
        if asteroids[index].hp <= 0 {
            defeatBoss(at: index)
        }
    }

    private func defeatBoss(at index: Int) {
        let boss = asteroids[index]
        asteroids.remove(at: index)
        bossesDefeated += 1
        bossActive = false
        let bonus = Int((400 + CGFloat(sector) * 120) * scoreMulPerm)
        score += bonus
        bankedCrystals += 8 + sector
        UserDefaults.standard.set(bankedCrystals, forKey: "NeonDriftBank")
        float(text: "BOSS DOWN +\(bonus)", at: CGPoint(x: boss.x, y: boss.y), color: SIMD3(1, 0.5, 0.3))
        showToast("BOSS DEFEATED")
        explode(at: CGPoint(x: boss.x, y: boss.y))
        // gem rain
        for _ in 0..<6 {
            crystals.append(
                Crystal(
                    x: boss.x + .random(in: -60...60),
                    y: boss.y + .random(in: -20...40),
                    radius: 14,
                    speed: .random(in: 60...100),
                    pulse: .random(in: 0...(.pi * 2)),
                    isGold: true
                )
            )
        }
        sound.play("bossDown")
        haptic(.heavy)
        shake = 1.2
    }

    private func handleHit(at point: CGPoint, rockIndex: Int) {
        if invulnTime > 0 { return }

        if asteroids.indices.contains(rockIndex) {
            let rock = asteroids[rockIndex]
            if rock.isBoss {
                // Boss collision only damages player, boss stays
                burst(at: point, count: 20, color: SIMD3(1, 0.4, 0.4))
            } else {
                burst(at: CGPoint(x: rock.x, y: rock.y), count: 16, color: SIMD3(0.7, 0.7, 0.85))
                asteroids.remove(at: rockIndex)
            }
        }

        if shields > 0 {
            shields -= 1
            invulnTime = 0.85
            shake = 1.15
            combo = 0
            // Getting hit dumps nova charge — punishes reckless play
            novaCharge = max(0, novaCharge - 0.35)
            showToast(shields == 0 ? "LAST LIFE" : "SHIELD DOWN")
            burst(at: point, count: 26, color: SIMD3(0.4, 0.9, 1))
            sound.play("hit")
            haptic(.heavy)
            return
        }

        explode(at: point)
        shake = 1.4
        sound.play("explode")
        endGame()
    }

    private func explode(at point: CGPoint) {
        burst(at: point, count: 48, color: SIMD3(1, 0.4, 0.85))
        for _ in 0..<20 {
            let angle = CGFloat.random(in: 0...(2 * .pi))
            let speed = CGFloat.random(in: 40...340)
            particles.append(
                Particle(
                    x: point.x, y: point.y,
                    vx: cos(angle) * speed,
                    vy: sin(angle) * speed,
                    life: .random(in: 0.4...1.0),
                    maxLife: 1.0,
                    size: .random(in: 2...7),
                    color: SIMD3(Float.random(in: 0.4...1), Float.random(in: 0.2...0.8), Float.random(in: 0.8...1))
                )
            )
        }
    }

    private func burst(at point: CGPoint, count: Int, color: SIMD3<Float>) {
        for _ in 0..<count {
            let angle = CGFloat.random(in: 0...(2 * .pi))
            let speed = CGFloat.random(in: 50...220)
            particles.append(
                Particle(
                    x: point.x, y: point.y,
                    vx: cos(angle) * speed,
                    vy: sin(angle) * speed,
                    life: 0.45,
                    maxLife: 0.45,
                    size: .random(in: 2...5),
                    color: color
                )
            )
        }
    }

    private func float(text: String, at point: CGPoint, color: SIMD3<Float>) {
        floaters.append(
            Floater(x: point.x, y: point.y, text: text, life: 0.95, maxLife: 0.95, color: color, rise: 48)
        )
    }

    private func showToast(_ text: String) {
        toast = text
        toastLife = 1.5
    }

    private func endGame() {
        phase = .gameOver
        lastTick = nil
        combo = 0
        isNewBest = score > highScore
        if isNewBest {
            highScore = score
            UserDefaults.standard.set(highScore, forKey: "NeonDriftHighScore")
        }

        if isDailyRun {
            var bank = bankedCrystals
            let reward = dailyStore.registerRun(score: score, bossesDefeated: bossesDefeated, bank: &bank)
            bankedCrystals = bank
            dailyRewardEarned = reward
            if reward > 0 { sound.play("daily") }
        }

        UINotificationFeedbackGenerator().notificationOccurred(isNewBest || dailyRewardEarned > 0 ? .success : .error)
    }

    private enum HapticStrength { case soft, light, medium, heavy }

    private func haptic(_ s: HapticStrength) {
        switch s {
        case .soft: UIImpactFeedbackGenerator(style: .soft).impactOccurred()
        case .light: UIImpactFeedbackGenerator(style: .light).impactOccurred()
        case .medium: UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .heavy: UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        }
    }
}
