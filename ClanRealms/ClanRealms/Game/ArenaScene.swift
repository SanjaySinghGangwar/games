import SpriteKit

protocol ArenaSceneDelegate: AnyObject {
    func arenaDidUpdate(hud: ArenaHUD)
    func arenaDidEnd(result: ArenaResult)
}

struct ArenaHUD {
    var wellRatio: CGFloat
    var riftRatio: CGFloat
    var energy: Int
    var maxEnergy: Int
    var combo: Int
    var wave: Int
    var totalWaves: Int
    var timeLeft: TimeInterval
    var championHP: CGFloat
    var championMaxHP: CGFloat
    var ultimateReady: Bool
    var missionText: String
}

struct ArenaResult {
    let won: Bool
    let stars: Int
    let combo: Int
    let loot: EssenceLoot
    let stage: ArenaStage
}

/// Clean two-zone arena: defend LEFT base, attack RIGHT rift.
final class ArenaScene: SKScene {
    weak var arenaDelegate: ArenaSceneDelegate?

    private var stage: ArenaStage!
    private var championKind: ChampionKind = .boldrin
    private var unlockedSpirits: Set<SpiritKind> = [.wisp, .wolf]

    private let world = SKNode()
    private let cameraNode = SKCameraNode()
    private var moveMarker: SKShapeNode?

    private var champion: ChampionNode!
    private var well: StructureNode!
    private var rift: StructureNode!
    private var spirits: [UnitNode] = []
    private var foes: [UnitNode] = []
    private var pickups: [SKNode] = []

    private var energy: Int = 40
    private let maxEnergy: Int = 100
    private var combo: Int = 0
    private var comboTimer: TimeInterval = 0
    private var timeLeft: TimeInterval = 120
    private var elapsed: TimeInterval = 0
    private var waveIndex: Int = 0
    private var wavesSpawned: Set<Int> = []
    private var ended = false
    private var moveTarget: CGPoint?
    private var lastHUD: TimeInterval = 0
    private var energyAcc: TimeInterval = 0
    private var combatStarted = false
    private var countdownDone = false

    private let playBoundsX: CGFloat = 0.40
    private let playBoundsY: CGFloat = 0.32

    func configure(stage: ArenaStage, champion: ChampionKind, spirits: Set<SpiritKind>) {
        self.stage = stage
        self.championKind = champion
        self.unlockedSpirits = spirits
        self.timeLeft = stage.timeLimit
        self.energy = 50
        self.combo = 0
        self.waveIndex = 0
        self.wavesSpawned = []
        self.ended = false
        self.elapsed = 0
        self.combatStarted = false
        self.countdownDone = false
    }

    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.12, green: 0.18, blue: 0.14, alpha: 1)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        removeAllChildren()
        world.removeAllChildren()
        spirits.removeAll()
        foes.removeAll()
        pickups.removeAll()

        addChild(world)
        camera = cameraNode
        addChild(cameraNode)
        cameraNode.position = .zero

        buildCleanBoard()
        spawnObjectives()
        spawnChampion()
        setupMoveMarker()
        startCountdown()
        pushHUD()
    }

    // MARK: - Clean board (readable two sides)

    private func buildCleanBoard() {
        let w = size.width
        let h = size.height

        // Sky-ish top strip
        let sky = SKShapeNode(rectOf: CGSize(width: w * 1.4, height: h * 0.55))
        sky.fillColor = SKColor(red: 0.35, green: 0.55, blue: 0.75, alpha: 1)
        sky.strokeColor = .clear
        sky.position = CGPoint(x: 0, y: h * 0.28)
        sky.zPosition = -400
        world.addChild(sky)

        // Soft hills silhouette
        let hill = SKShapeNode(ellipseOf: CGSize(width: w * 1.2, height: h * 0.5))
        hill.fillColor = SKColor(red: 0.22, green: 0.42, blue: 0.28, alpha: 1)
        hill.strokeColor = .clear
        hill.position = CGPoint(x: 0, y: h * 0.05)
        hill.zPosition = -390
        world.addChild(hill)

        // Main grass floor (playfield)
        let floor = SKShapeNode(rectOf: CGSize(width: w * 1.2, height: h * 0.85), cornerRadius: 24)
        floor.fillColor = SKColor(red: 0.28, green: 0.52, blue: 0.30, alpha: 1)
        floor.strokeColor = SKColor(red: 0.18, green: 0.35, blue: 0.2, alpha: 1)
        floor.lineWidth = 4
        floor.zPosition = -350
        world.addChild(floor)

        // Subtle checker grass (not noisy tiles)
        let cols = 10
        let rows = 6
        let tw = w * 0.9 / CGFloat(cols)
        let th = h * 0.62 / CGFloat(rows)
        for r in 0..<rows {
            for c in 0..<cols {
                if (r + c) % 2 == 0 {
                    let cell = SKShapeNode(rectOf: CGSize(width: tw, height: th), cornerRadius: 2)
                    cell.fillColor = SKColor(red: 0.30, green: 0.55, blue: 0.32, alpha: 0.55)
                    cell.strokeColor = .clear
                    cell.position = CGPoint(
                        x: -w * 0.45 + tw * (CGFloat(c) + 0.5),
                        y: -h * 0.28 + th * (CGFloat(r) + 0.5)
                    )
                    cell.zPosition = -340
                    world.addChild(cell)
                }
            }
        }

        // LEFT zone — your side (blue wash)
        let leftZone = SKShapeNode(rectOf: CGSize(width: w * 0.34, height: h * 0.7), cornerRadius: 18)
        leftZone.fillColor = SKColor(red: 0.15, green: 0.55, blue: 0.75, alpha: 0.18)
        leftZone.strokeColor = SKColor.cyan.withAlphaComponent(0.55)
        leftZone.lineWidth = 3
        leftZone.position = CGPoint(x: -w * 0.28, y: 0)
        leftZone.zPosition = -300
        world.addChild(leftZone)

        // RIGHT zone — enemy side (red wash)
        let rightZone = SKShapeNode(rectOf: CGSize(width: w * 0.34, height: h * 0.7), cornerRadius: 18)
        rightZone.fillColor = SKColor(red: 0.85, green: 0.2, blue: 0.2, alpha: 0.16)
        rightZone.strokeColor = SKColor.red.withAlphaComponent(0.5)
        rightZone.lineWidth = 3
        rightZone.position = CGPoint(x: w * 0.28, y: 0)
        rightZone.zPosition = -300
        world.addChild(rightZone)

        // Center path / fight lane
        let lane = SKShapeNode(rectOf: CGSize(width: w * 0.22, height: h * 0.55), cornerRadius: 12)
        lane.fillColor = SKColor(red: 0.45, green: 0.38, blue: 0.28, alpha: 0.45)
        lane.strokeColor = SKColor(red: 0.55, green: 0.45, blue: 0.3, alpha: 0.7)
        lane.lineWidth = 2
        lane.zPosition = -290
        world.addChild(lane)

        // Direction arrows in lane: YOU → ENEMY
        for i in 0..<3 {
            let arrow = SKLabelNode(fontNamed: "AvenirNext-Heavy")
            arrow.text = "▶"
            arrow.fontSize = 22
            arrow.fontColor = SKColor.white.withAlphaComponent(0.35)
            arrow.position = CGPoint(x: CGFloat(i - 1) * 40, y: -h * 0.22)
            arrow.zPosition = -280
            world.addChild(arrow)
            arrow.run(.repeatForever(.sequence([
                .fadeAlpha(to: 0.15, duration: 0.6),
                .fadeAlpha(to: 0.45, duration: 0.6),
            ])))
        }

        // Side banners
        addBanner(text: "YOU", color: .cyan, at: CGPoint(x: -w * 0.28, y: h * 0.34))
        addBanner(text: "ENEMY", color: .red, at: CGPoint(x: w * 0.28, y: h * 0.34))

        // Minimal edge decor (not clutter)
        placeEdgeTree(at: CGPoint(x: -w * 0.42, y: h * 0.28))
        placeEdgeTree(at: CGPoint(x: w * 0.42, y: h * 0.28))
        placeEdgeTree(at: CGPoint(x: -w * 0.42, y: -h * 0.28))
        placeEdgeTree(at: CGPoint(x: w * 0.42, y: -h * 0.28))

        // Mission strip on board (always readable)
        let mission = SKLabelNode(fontNamed: "AvenirNext-Heavy")
        mission.text = "GOAL: Destroy the red ENEMY RIFT  ·  Keep YOUR BASE alive"
        mission.fontSize = 14
        mission.fontColor = .white
        mission.position = CGPoint(x: 0, y: -h * 0.36)
        mission.zPosition = 5
        mission.name = "missionBoard"
        world.addChild(mission)

        let missionBg = SKShapeNode(rectOf: CGSize(width: min(w * 0.85, 520), height: 28), cornerRadius: 10)
        missionBg.fillColor = SKColor.black.withAlphaComponent(0.45)
        missionBg.strokeColor = SKColor.white.withAlphaComponent(0.15)
        missionBg.position = mission.position
        missionBg.zPosition = 4
        world.addChild(missionBg)
    }

    private func addBanner(text: String, color: SKColor, at pos: CGPoint) {
        let bg = SKShapeNode(rectOf: CGSize(width: 80, height: 26), cornerRadius: 8)
        bg.fillColor = SKColor.black.withAlphaComponent(0.5)
        bg.strokeColor = color.withAlphaComponent(0.8)
        bg.lineWidth = 2
        bg.position = pos
        bg.zPosition = 6
        world.addChild(bg)

        let label = SKLabelNode(fontNamed: "AvenirNext-Heavy")
        label.text = text
        label.fontSize = 14
        label.fontColor = color
        label.verticalAlignmentMode = .center
        label.position = pos
        label.zPosition = 7
        world.addChild(label)
    }

    private func placeEdgeTree(at pos: CGPoint) {
        let tree = SKSpriteNode(imageNamed: "tree")
        if (tree.texture?.size().width ?? 0) < 2 {
            return
        }
        tree.size = CGSize(width: 48, height: 48)
        tree.position = pos
        tree.zPosition = -200
        tree.alpha = 0.85
        world.addChild(tree)
    }

    private func spawnObjectives() {
        well = StructureNode(role: .spiritWell, maxHP: stage.wellHP)
        well.position = CGPoint(x: -size.width * 0.28, y: 0)
        well.zPosition = 40
        world.addChild(well)

        rift = StructureNode(role: .riftCore, maxHP: stage.riftHP)
        rift.position = CGPoint(x: size.width * 0.28, y: 0)
        rift.zPosition = 40
        world.addChild(rift)
    }

    private func spawnChampion() {
        champion = ChampionNode(kind: championKind)
        champion.position = CGPoint(x: -size.width * 0.12, y: 0)
        world.addChild(champion)
        moveTarget = champion.position
    }

    private func setupMoveMarker() {
        let m = SKShapeNode(circleOfRadius: 18)
        m.strokeColor = .yellow
        m.lineWidth = 3
        m.fillColor = SKColor.yellow.withAlphaComponent(0.15)
        m.zPosition = 30
        m.isHidden = true
        m.name = "moveMarker"
        world.addChild(m)
        m.run(.repeatForever(.sequence([
            .scale(to: 1.15, duration: 0.35),
            .scale(to: 0.9, duration: 0.35),
        ])))
        moveMarker = m
    }

    private func startCountdown() {
        // 3-2-1 then fight — player can still move during countdown
        let labels = ["3", "2", "1", "FIGHT!"]
        for (i, text) in labels.enumerated() {
            run(.sequence([
                .wait(forDuration: TimeInterval(i) * 0.7),
                .run { [weak self] in
                    self?.showCenterBanner(text, color: i == 3 ? .yellow : .white, size: i == 3 ? 42 : 48)
                    if i == 3 {
                        self?.countdownDone = true
                        self?.combatStarted = true
                    }
                },
            ]))
        }
        // Soft help after fight starts
        run(.sequence([
            .wait(forDuration: 3.2),
            .run { [weak self] in
                self?.showCenterBanner("Drag to move your hero → Attack red rift", color: .cyan, size: 18)
            },
        ]))
    }

    private func showCenterBanner(_ text: String, color: SKColor, size: CGFloat) {
        let label = SKLabelNode(fontNamed: "AvenirNext-Heavy")
        label.text = text
        label.fontSize = size
        label.fontColor = color
        label.position = .zero
        label.zPosition = 900
        cameraNode.addChild(label)
        label.setScale(0.5)
        label.run(.sequence([
            .group([.scale(to: 1.1, duration: 0.15), .fadeIn(withDuration: 0.1)]),
            .wait(forDuration: 0.45),
            .group([.fadeOut(withDuration: 0.25), .scale(to: 1.3, duration: 0.25)]),
            .removeFromParent(),
        ]))
    }

    // MARK: - Input

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !ended, let t = touches.first else { return }
        let loc = clamp(t.location(in: world))
        moveTarget = loc
        moveMarker?.position = loc
        moveMarker?.isHidden = false
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !ended, let t = touches.first else { return }
        let loc = clamp(t.location(in: world))
        moveTarget = loc
        moveMarker?.position = loc
        moveMarker?.isHidden = false
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Keep last target; marker fades
        moveMarker?.run(.sequence([
            .wait(forDuration: 0.4),
            .run { [weak self] in self?.moveMarker?.isHidden = true },
        ]))
    }

    private func clamp(_ p: CGPoint) -> CGPoint {
        CGPoint(
            x: min(size.width * playBoundsX, max(-size.width * playBoundsX, p.x)),
            y: min(size.height * playBoundsY, max(-size.height * playBoundsY, p.y))
        )
    }

    // MARK: - Controls

    func summon(_ spirit: SpiritKind) {
        guard !ended, champion.isAlive else { return }
        guard unlockedSpirits.contains(spirit) else { return }
        guard energy >= spirit.energyCost else {
            flash("Need more Energy (\(spirit.energyCost))")
            return
        }
        energy -= spirit.energyCost
        let unit = UnitNode(spirit: spirit)
        unit.position = CGPoint(
            x: champion.position.x + CGFloat.random(in: -36...36),
            y: champion.position.y + CGFloat.random(in: -36...36)
        )
        world.addChild(unit)
        spirits.append(unit)
        FXLibrary.play(.magic, at: unit.position, in: world, scale: 0.55, z: 200)
        flash("Summoned \(spirit.displayName)!")
        pushHUD()
    }

    func castUltimate() {
        guard !ended else { return }
        let ok = champion.castUltimate(foes: foes.filter(\.isAlive), rift: rift.isAlive ? rift : nil)
        if ok {
            combo += 2
            comboTimer = 3
            flash(champion.kind.ultimateName + "!")
        } else {
            flash("Ultimate needs energy + cooldown")
        }
        pushHUD()
    }

    // MARK: - Loop

    override func update(_ currentTime: TimeInterval) {
        guard !ended else { return }
        let dt: TimeInterval = 1.0 / 60.0
        elapsed += dt

        if countdownDone {
            timeLeft -= dt
        }

        comboTimer -= dt
        if comboTimer <= 0 { combo = max(0, combo - 1); comboTimer = 0.45 }

        energyAcc += dt
        if energyAcc >= 0.45 {
            energyAcc = 0
            energy = min(maxEnergy, energy + 2)
        }

        if timeLeft <= 0 {
            endGame(won: false)
            return
        }

        if let mt = moveTarget {
            champion.move(toward: mt, dt: dt)
        }
        champion.position = clamp(champion.position)

        if combatStarted {
            champion.updateCombat(dt: dt, foes: foes.filter(\.isAlive), rift: rift.isAlive ? rift : nil)
            spawnWavesIfNeeded()

            let liveFoes = foes.filter { $0.isAlive && $0.parent != nil }
            let liveSpirits = spirits.filter { $0.isAlive && $0.parent != nil }
            for s in liveSpirits {
                s.update(dt: dt, enemies: liveFoes + (rift.isAlive ? [rift] : []), allies: liveSpirits, well: nil, rift: rift.isAlive ? rift : nil, champion: champion)
            }
            for f in liveFoes {
                f.update(dt: dt, enemies: [], allies: liveSpirits, well: well.isAlive ? well : nil, rift: nil, champion: champion.isAlive ? champion : nil)
            }

            for f in foes where !f.isAlive {
                if f.userData == nil { f.userData = NSMutableDictionary() }
                if f.userData?["rewarded"] as? Bool != true {
                    f.userData?["rewarded"] = true
                    energy = min(maxEnergy, energy + 6)
                    combo += 1
                    comboTimer = 3
                    maybeDropPickup(at: f.position)
                }
            }
        }

        foes = foes.filter { $0.parent != nil }
        spirits = spirits.filter { $0.parent != nil && $0.isAlive }

        if !rift.isAlive {
            endGame(won: true)
            return
        }
        if !well.isAlive || !champion.isAlive {
            endGame(won: false)
            return
        }

        if elapsed - lastHUD > 0.12 {
            lastHUD = elapsed
            pushHUD()
        }
    }

    private func spawnWavesIfNeeded() {
        guard combatStarted else { return }
        // Offset wave delays so first wave comes after countdown
        let t = elapsed - 2.8
        for (i, wave) in stage.waves.enumerated() {
            if wavesSpawned.contains(i) { continue }
            if t >= wave.delay {
                wavesSpawned.insert(i)
                waveIndex = i + 1
                flash("Wave \(waveIndex) of \(stage.waves.count)")
                for foe in wave.foes {
                    spawnFoe(foe)
                }
                FXLibrary.play(.flash, at: rift.position, in: world, scale: 0.75, z: 180)
            }
        }
    }

    private func spawnFoe(_ kind: FoeKind) {
        let unit = UnitNode(foe: kind)
        unit.position = CGPoint(
            x: rift.position.x + CGFloat.random(in: -40...20),
            y: rift.position.y + CGFloat.random(in: -70...70)
        )
        world.addChild(unit)
        foes.append(unit)
        FXLibrary.play(.puff, at: unit.position, in: world, scale: 0.35, z: 170)
    }

    private func maybeDropPickup(at pos: CGPoint) {
        guard Int.random(in: 0...100) < 30 else { return }
        let type = ["heal", "energy", "rage"].randomElement()!
        let asset = type == "heal" ? "health_potion" : (type == "energy" ? "mana_potion" : "star")
        let node = SKSpriteNode(imageNamed: asset)
        node.size = CGSize(width: 30, height: 30)
        node.position = pos
        node.zPosition = 60
        node.name = "pickup_\(type)"
        world.addChild(node)
        node.run(.repeatForever(.sequence([
            .moveBy(x: 0, y: 6, duration: 0.4),
            .moveBy(x: 0, y: -6, duration: 0.4),
        ])))
        pickups.append(node)
        node.run(.sequence([.wait(forDuration: 8), .fadeOut(withDuration: 0.3), .removeFromParent()]))
    }

    override func didFinishUpdate() {
        guard !ended, let champion else { return }
        for p in pickups {
            guard p.parent != nil else { continue }
            if hypot(p.position.x - champion.position.x, p.position.y - champion.position.y) < 42 {
                if p.name?.contains("heal") == true {
                    champion.heal(70)
                    flash("Healed!")
                } else if p.name?.contains("energy") == true {
                    energy = min(maxEnergy, energy + 28)
                    flash("+Energy")
                } else {
                    combo += 3
                    comboTimer = 4
                    champion.energy = min(100, champion.energy + 30)
                    flash("Power up!")
                }
                FXLibrary.play(.spark, at: p.position, in: world, scale: 0.5, z: 200)
                p.removeFromParent()
            }
        }
        pickups = pickups.filter { $0.parent != nil }
    }

    private func endGame(won: Bool) {
        guard !ended else { return }
        ended = true
        moveMarker?.isHidden = true
        let wellR = well.hp / well.maxHP
        var stars = 0
        if won {
            stars = 1
            if wellR > 0.5 { stars = 2 }
            if wellR > 0.8 && combo >= 8 { stars = 3 }
            else if wellR > 0.75 { stars = max(stars, 2) }
        }
        let mult = max(1, combo / 5)
        let loot = EssenceLoot(
            essence: won ? stage.rewards.essence * max(1, stars) / 2 + mult * 5 : stage.rewards.essence / 6,
            shards: won ? stage.rewards.shards + stars * 3 : 0
        )
        flash(won ? "You sealed the Rift!" : (champion.isAlive ? "Your Base fell" : "Champion defeated"))
        let result = ArenaResult(won: won, stars: stars, combo: combo, loot: loot, stage: stage)
        run(.sequence([
            .wait(forDuration: 1.1),
            .run { [weak self] in self?.arenaDelegate?.arenaDidEnd(result: result) },
        ]))
    }

    private func pushHUD() {
        let mission: String
        if !countdownDone {
            mission = "Get ready…"
        } else if !rift.isAlive {
            mission = "Victory!"
        } else {
            mission = "Destroy ENEMY RIFT  ·  Protect YOUR BASE"
        }
        arenaDelegate?.arenaDidUpdate(hud: ArenaHUD(
            wellRatio: max(0, well.hp / well.maxHP),
            riftRatio: max(0, rift.hp / rift.maxHP),
            energy: energy,
            maxEnergy: maxEnergy,
            combo: combo,
            wave: waveIndex,
            totalWaves: stage.waves.count,
            timeLeft: max(0, timeLeft),
            championHP: max(0, champion.hp),
            championMaxHP: champion.maxHP,
            ultimateReady: champion.ultimateCooldown <= 0 && champion.energy >= 50,
            missionText: mission
        ))
    }

    private func flash(_ text: String) {
        let label = SKLabelNode(fontNamed: "AvenirNext-Bold")
        label.text = text
        label.fontSize = 20
        label.fontColor = .yellow
        label.position = CGPoint(x: 0, y: size.height * 0.18)
        label.zPosition = 950
        cameraNode.addChild(label)
        label.run(.sequence([
            .group([
                .moveBy(x: 0, y: 24, duration: 0.85),
                .sequence([.wait(forDuration: 0.45), .fadeOut(withDuration: 0.4)]),
            ]),
            .removeFromParent(),
        ]))
    }
}
