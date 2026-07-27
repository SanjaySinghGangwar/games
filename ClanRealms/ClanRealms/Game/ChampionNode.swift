import SpriteKit

/// Player-controlled champion — drag to move, auto-attack, ultimates.
final class ChampionNode: SKNode {
    let kind: ChampionKind
    let sprite: SKSpriteNode
    private let ring: SKShapeNode
    private let hpBarBG: SKShapeNode
    private var hpBarFill: SKShapeNode
    private let energyBarBG: SKShapeNode
    private var energyBarFill: SKShapeNode

    var hp: CGFloat
    let maxHP: CGFloat
    var energy: CGFloat = 40
    let maxEnergy: CGFloat = 100
    var attackTimer: TimeInterval = 0
    var ultimateCooldown: TimeInterval = 0
    private(set) var isAlive = true
    private var isAttacking = false
    private var walkPhase: CGFloat = 0
    private var invuln: TimeInterval = 0

    var spriteSize: CGFloat { kind.spriteSize }

    init(kind: ChampionKind) {
        self.kind = kind
        self.maxHP = kind.maxHP
        self.hp = kind.maxHP

        let tex = SKTexture(imageNamed: kind.assetName)
        sprite = SKSpriteNode(texture: tex, size: CGSize(width: kind.spriteSize, height: kind.spriteSize))
        sprite.zPosition = 2

        ring = SKShapeNode(circleOfRadius: kind.spriteSize * 0.55)
        ring.strokeColor = SKColor.cyan.withAlphaComponent(0.7)
        ring.lineWidth = 2.5
        ring.fillColor = SKColor.cyan.withAlphaComponent(0.08)
        ring.zPosition = 0

        hpBarBG = SKShapeNode(rectOf: CGSize(width: 70, height: 7), cornerRadius: 2)
        hpBarBG.fillColor = SKColor.black.withAlphaComponent(0.5)
        hpBarBG.strokeColor = .clear
        hpBarBG.position = CGPoint(x: 0, y: 42)
        hpBarBG.zPosition = 10

        hpBarFill = SKShapeNode(rectOf: CGSize(width: 70, height: 7), cornerRadius: 2)
        hpBarFill.fillColor = .green
        hpBarFill.strokeColor = .clear
        hpBarFill.position = CGPoint(x: 0, y: 42)
        hpBarFill.zPosition = 11

        energyBarBG = SKShapeNode(rectOf: CGSize(width: 70, height: 5), cornerRadius: 2)
        energyBarBG.fillColor = SKColor.black.withAlphaComponent(0.45)
        energyBarBG.strokeColor = .clear
        energyBarBG.position = CGPoint(x: 0, y: 34)
        energyBarBG.zPosition = 10

        energyBarFill = SKShapeNode(rectOf: CGSize(width: 28, height: 5), cornerRadius: 2)
        energyBarFill.fillColor = .purple
        energyBarFill.strokeColor = .clear
        energyBarFill.position = CGPoint(x: -21, y: 34)
        energyBarFill.zPosition = 11

        super.init()
        addChild(ring)
        addChild(sprite)
        addChild(hpBarBG)
        addChild(hpBarFill)
        addChild(energyBarBG)
        addChild(energyBarFill)

        ring.run(.repeatForever(.sequence([
            .scale(to: 1.08, duration: 0.6),
            .scale(to: 1.0, duration: 0.6),
        ])))

        setScale(0.2)
        run(.scale(to: 1, duration: 0.25))
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    func move(toward point: CGPoint, dt: TimeInterval) {
        guard isAlive else { return }
        let dx = point.x - position.x
        let dy = point.y - position.y
        let dist = hypot(dx, dy)
        if dist < 8 {
            sprite.position.y = 0
            return
        }
        let nx = dx / dist
        let ny = dy / dist
        let step = kind.moveSpeed * CGFloat(dt)
        position.x += nx * min(step, dist)
        position.y += ny * min(step, dist)
        sprite.xScale = dx < 0 ? -1 : 1
        animateWalk(dt: dt)
        zPosition = 100 - position.y * 0.01
    }

    private func animateWalk(dt: TimeInterval) {
        walkPhase += CGFloat(dt) * 16
        sprite.position.y = sin(walkPhase) * 4
        sprite.yScale = 1 + sin(walkPhase * 2) * 0.06
        let face: CGFloat = sprite.xScale < 0 ? -1 : 1
        sprite.xScale = face
    }

    func updateCombat(dt: TimeInterval, foes: [UnitNode], rift: StructureNode?) {
        guard isAlive else { return }
        attackTimer = max(0, attackTimer - dt)
        ultimateCooldown = max(0, ultimateCooldown - dt)
        invuln = max(0, invuln - dt)
        energy = min(maxEnergy, energy + CGFloat(dt) * 6)

        var targets: [SKNode] = foes.filter(\.isAlive)
        if let rift, rift.isAlive { targets.append(rift) }
        guard let target = targets.min(by: {
            hypot($0.position.x - position.x, $0.position.y - position.y)
                < hypot($1.position.x - position.x, $1.position.y - position.y)
        }) else {
            refreshBars()
            return
        }

        let dist = hypot(target.position.x - position.x, target.position.y - position.y)
        if dist <= kind.attackRange + 24, attackTimer <= 0, !isAttacking {
            autoAttack(target)
        }
        refreshBars()
    }

    private func autoAttack(_ target: SKNode) {
        isAttacking = true
        attackTimer = kind.attackCooldown
        sprite.position = .zero
        let face = target.position.x < position.x ? -1.0 : 1.0
        sprite.xScale = face

        sprite.run(.sequence([
            .group([
                .moveBy(x: face * 10, y: 0, duration: 0.06),
                .scaleX(to: face * 1.15, y: 0.9, duration: 0.06),
            ]),
            .group([
                .moveBy(x: -face * 10, y: 0, duration: 0.1),
                .scaleX(to: face, y: 1, duration: 0.1),
            ]),
        ])) { [weak self] in
            self?.isAttacking = false
        }

        if let parent {
            if kind.attackRange > 80 {
                FXLibrary.play(.magic, at: target.position, in: parent, scale: 0.55, z: 250)
                // Projectile visual
                let bolt = SKSpriteNode(imageNamed: "fx_magic_01")
                if (bolt.texture?.size().width ?? 0) < 2 {
                    bolt.color = .purple
                    bolt.size = CGSize(width: 14, height: 14)
                } else {
                    bolt.size = CGSize(width: 28, height: 28)
                    bolt.blendMode = .add
                }
                bolt.position = position
                bolt.zPosition = 240
                parent.addChild(bolt)
                bolt.run(.sequence([
                    .move(to: target.position, duration: 0.12),
                    .removeFromParent(),
                ]))
            } else {
                FXLibrary.play(.slash, at: target.position, in: parent, scale: 0.55, z: 250)
            }
        }

        // Delayed damage to match impact
        run(.sequence([
            .wait(forDuration: 0.1),
            .run { [weak self] in
                guard let self else { return }
                if let u = target as? UnitNode { u.takeDamage(self.kind.damage) }
                else if let s = target as? StructureNode { s.takeDamage(self.kind.damage) }
                self.energy = min(self.maxEnergy, self.energy + 8)
            },
        ]))
    }

    /// Ultimate skill — unique per champion.
    @discardableResult
    func castUltimate(foes: [UnitNode], rift: StructureNode?) -> Bool {
        guard isAlive, ultimateCooldown <= 0, energy >= 50 else { return false }
        energy -= 50
        ultimateCooldown = 8
        guard let parent else { return true }

        switch kind {
        case .boldrin:
            invuln = 2.2
            FXLibrary.play(.heal, at: position, in: parent, scale: 1.0, z: 260)
            ring.strokeColor = .yellow
            run(.sequence([.wait(forDuration: 2.2), .run { [weak self] in self?.ring.strokeColor = .cyan }]))
            for f in foes where f.isAlive && hypot(f.position.x - position.x, f.position.y - position.y) < 120 {
                f.takeDamage(kind.damage * 0.8)
            }
        case .lumen:
            FXLibrary.play(.magic, at: position, in: parent, scale: 1.4, z: 260)
            FXLibrary.play(.explosion, at: position, in: parent, scale: 0.7, z: 261)
            for f in foes where f.isAlive && hypot(f.position.x - position.x, f.position.y - position.y) < 180 {
                f.takeDamage(kind.damage * 2.2)
            }
            rift?.takeDamage(kind.damage * 1.5)
        case .lyra:
            for f in foes.prefix(6) where f.isAlive {
                FXLibrary.play(.slash, at: f.position, in: parent, scale: 0.5, z: 260)
                f.takeDamage(kind.damage * 1.4)
            }
        case .borin:
            FXLibrary.play(.explosion, at: position, in: parent, scale: 1.0, z: 260)
            // Shockwave ring
            let wave = SKShapeNode(circleOfRadius: 20)
            wave.strokeColor = .orange
            wave.lineWidth = 4
            wave.fillColor = .clear
            wave.position = position
            wave.zPosition = 255
            parent.addChild(wave)
            wave.run(.sequence([
                .group([.scale(to: 8, duration: 0.4), .fadeOut(withDuration: 0.4)]),
                .removeFromParent(),
            ]))
            for f in foes where f.isAlive && hypot(f.position.x - position.x, f.position.y - position.y) < 160 {
                f.takeDamage(kind.damage * 1.8)
                // knockback
                let dx = f.position.x - position.x
                let dy = f.position.y - position.y
                let d = max(1, hypot(dx, dy))
                f.run(.moveBy(x: dx / d * 40, y: dy / d * 40, duration: 0.15))
            }
        }
        refreshBars()
        return true
    }

    func takeDamage(_ amount: CGFloat) {
        guard isAlive, invuln <= 0 else { return }
        hp -= amount
        refreshBars()
        sprite.run(.sequence([
            .colorize(with: .red, colorBlendFactor: 0.75, duration: 0.05),
            .colorize(withColorBlendFactor: 0, duration: 0.12),
        ]))
        if hp <= 0 {
            isAlive = false
            if let parent {
                FXLibrary.play(.explosion, at: position, in: parent, scale: 0.9, z: 300)
            }
            run(.sequence([
                .group([.fadeOut(withDuration: 0.4), .scale(to: 0.2, duration: 0.4)]),
            ]))
        }
    }

    func heal(_ amount: CGFloat) {
        guard isAlive else { return }
        hp = min(maxHP, hp + amount)
        if let parent { FXLibrary.play(.heal, at: position, in: parent, scale: 0.6, z: 250) }
        refreshBars()
    }

    private func refreshBars() {
        let hr = max(0, hp / maxHP)
        let er = max(0, energy / maxEnergy)
        hpBarFill.removeFromParent()
        energyBarFill.removeFromParent()

        let hFill = SKShapeNode(rectOf: CGSize(width: max(2, 70 * hr), height: 7), cornerRadius: 2)
        hFill.fillColor = hr > 0.5 ? .green : (hr > 0.25 ? .yellow : .red)
        hFill.strokeColor = .clear
        hFill.position = CGPoint(x: -(70 * (1 - hr)) / 2, y: 42)
        hFill.zPosition = 11
        addChild(hFill)
        hpBarFill = hFill

        let eFill = SKShapeNode(rectOf: CGSize(width: max(2, 70 * er), height: 5), cornerRadius: 2)
        eFill.fillColor = .purple
        eFill.strokeColor = .clear
        eFill.position = CGPoint(x: -(70 * (1 - er)) / 2, y: 34)
        eFill.zPosition = 11
        addChild(eFill)
        energyBarFill = eFill
    }
}
