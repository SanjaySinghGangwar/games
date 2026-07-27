import SpriteKit

enum UnitTeam {
    case player
    case enemy
}

/// Ally spirit or rift foe — walks, attacks, dies with FX.
final class UnitNode: SKNode {
    let team: UnitTeam
    let foeKind: FoeKind?
    let spiritKind: SpiritKind?

    private let sprite: SKSpriteNode
    private let shadow: SKShapeNode
    private let hpBarBG: SKShapeNode
    private var hpBarFill: SKShapeNode

    var hp: CGFloat
    let maxHP: CGFloat
    let damage: CGFloat
    let moveSpeed: CGFloat
    let attackRange: CGFloat
    let attackCooldown: TimeInterval
    let spriteSize: CGFloat
    let isFlying: Bool

    var attackTimer: TimeInterval = 0
    private(set) var isAlive = true
    private var isAttacking = false
    private var walkPhase: CGFloat = 0
    weak var focusTarget: SKNode?

    // Spirit init
    init(spirit: SpiritKind) {
        self.team = .player
        self.spiritKind = spirit
        self.foeKind = nil
        self.maxHP = spirit.maxHP
        self.hp = spirit.maxHP
        self.damage = spirit.damage
        self.moveSpeed = spirit.moveSpeed
        self.attackRange = spirit.attackRange
        self.attackCooldown = spirit.attackCooldown
        self.spriteSize = spirit.spriteSize
        self.isFlying = spirit.isFlying

        let tex = SKTexture(imageNamed: spirit.assetName)
        sprite = SKSpriteNode(texture: tex, size: CGSize(width: spriteSize, height: spriteSize))
        shadow = Self.makeShadow(size: spriteSize)
        hpBarBG = Self.makeBarBG(width: spriteSize * 0.9, y: spriteSize * 0.55)
        hpBarFill = Self.makeBarFill(width: spriteSize * 0.9, y: spriteSize * 0.55, color: .cyan)

        super.init()
        commonSetup()
        spawnPop()
        if isFlying { floatIdle() }
    }

    // Foe init
    init(foe: FoeKind) {
        self.team = .enemy
        self.foeKind = foe
        self.spiritKind = nil
        self.maxHP = foe.maxHP
        self.hp = foe.maxHP
        self.damage = foe.damage
        self.moveSpeed = foe.moveSpeed
        self.attackRange = foe.attackRange
        self.attackCooldown = foe.attackCooldown
        self.spriteSize = foe.spriteSize
        self.isFlying = (foe == .bat || foe == .bee || foe == .ghost || foe == .hatchling || foe == .adultDragon)

        let tex = SKTexture(imageNamed: foe.assetName)
        sprite = SKSpriteNode(texture: tex, size: CGSize(width: spriteSize, height: spriteSize))
        shadow = Self.makeShadow(size: spriteSize)
        hpBarBG = Self.makeBarBG(width: spriteSize * 0.9, y: spriteSize * 0.55)
        hpBarFill = Self.makeBarFill(width: spriteSize * 0.9, y: spriteSize * 0.55, color: .red)

        super.init()
        commonSetup()
        spawnPop()
        if isFlying { floatIdle() }
        if foe.isBoss {
            sprite.run(.repeatForever(.sequence([
                .scale(to: 1.08, duration: 0.5),
                .scale(to: 1.0, duration: 0.5),
            ])))
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    private func commonSetup() {
        sprite.zPosition = 1
        addChild(shadow)
        addChild(sprite)
        addChild(hpBarBG)
        addChild(hpBarFill)
    }

    private static func makeShadow(size: CGFloat) -> SKShapeNode {
        let s = SKShapeNode(ellipseOf: CGSize(width: size * 0.55, height: size * 0.16))
        s.fillColor = SKColor.black.withAlphaComponent(0.28)
        s.strokeColor = .clear
        s.position = CGPoint(x: 0, y: -size * 0.34)
        s.zPosition = -1
        return s
    }

    private static func makeBarBG(width: CGFloat, y: CGFloat) -> SKShapeNode {
        let n = SKShapeNode(rectOf: CGSize(width: width, height: 5), cornerRadius: 2)
        n.fillColor = SKColor.black.withAlphaComponent(0.5)
        n.strokeColor = .clear
        n.position = CGPoint(x: 0, y: y)
        n.zPosition = 5
        return n
    }

    private static func makeBarFill(width: CGFloat, y: CGFloat, color: SKColor) -> SKShapeNode {
        let n = SKShapeNode(rectOf: CGSize(width: width, height: 5), cornerRadius: 2)
        n.fillColor = color
        n.strokeColor = .clear
        n.position = CGPoint(x: 0, y: y)
        n.zPosition = 6
        return n
    }

    private func spawnPop() {
        setScale(0.1)
        alpha = 0
        run(.group([.scale(to: 1, duration: 0.18), .fadeIn(withDuration: 0.12)]))
    }

    private func floatIdle() {
        sprite.run(.repeatForever(.sequence([
            .moveBy(x: 0, y: 7, duration: 0.45),
            .moveBy(x: 0, y: -7, duration: 0.45),
        ])))
    }

    func update(dt: TimeInterval, enemies: [SKNode], allies: [SKNode], well: SKNode?, rift: SKNode?, champion: ChampionNode?) {
        guard isAlive else { return }
        attackTimer = max(0, attackTimer - dt)

        // Choose target
        let targets: [SKNode]
        if team == .player {
            // Prefer foes, then rift
            var list = enemies.filter { ($0 as? UnitNode)?.isAlive == true || ($0 as? StructureNode)?.isAlive == true }
            if let rift { list.append(rift) }
            targets = list
        } else {
            // Prefer champion + spirits, then well
            var list: [SKNode] = allies.filter { ($0 as? UnitNode)?.isAlive == true }
            if let champion, champion.isAlive { list.append(champion) }
            if let well { list.append(well) }
            targets = list
        }

        guard let target = nearest(in: targets) else { return }
        focusTarget = target

        let dx = target.position.x - position.x
        let dy = target.position.y - position.y
        let dist = hypot(dx, dy)
        sprite.xScale = dx < 0 ? -1 : 1

        let targetRadius: CGFloat
        if let u = target as? UnitNode { targetRadius = u.spriteSize * 0.25 }
        else if let c = target as? ChampionNode { targetRadius = c.spriteSize * 0.25 }
        else if let s = target as? StructureNode { targetRadius = s.radius * 0.6 }
        else { targetRadius = 20 }

        if dist <= attackRange + targetRadius {
            if attackTimer <= 0 && !isAttacking {
                performAttack(on: target)
            }
        } else {
            let nx = dx / max(dist, 0.001)
            let ny = dy / max(dist, 0.001)
            position.x += nx * moveSpeed * CGFloat(dt)
            position.y += ny * moveSpeed * CGFloat(dt)
            zPosition = 80 - position.y * 0.01 + (isFlying ? 20 : 0)
            animateWalk(dt: dt)
        }
    }

    private func nearest(in nodes: [SKNode]) -> SKNode? {
        nodes.min {
            hypot($0.position.x - position.x, $0.position.y - position.y)
                < hypot($1.position.x - position.x, $1.position.y - position.y)
        }
    }

    private func animateWalk(dt: TimeInterval) {
        guard !isFlying else { return }
        walkPhase += CGFloat(dt) * 14
        sprite.position.y = sin(walkPhase) * 3.5
        sprite.yScale = 1.0 + sin(walkPhase * 2) * 0.05
        let face: CGFloat = sprite.xScale < 0 ? -1 : 1
        sprite.xScale = face
    }

    private func performAttack(on target: SKNode) {
        isAttacking = true
        attackTimer = attackCooldown
        sprite.position = .zero

        let lunge = CGVector(dx: (target.position.x - position.x) * 0.08, dy: (target.position.y - position.y) * 0.08)
        sprite.run(.sequence([
            .group([
                .moveBy(x: lunge.dx, y: lunge.dy, duration: 0.07),
                .scale(to: 1.12, duration: 0.07),
            ]),
            .group([
                .moveBy(x: -lunge.dx, y: -lunge.dy, duration: 0.1),
                .scale(to: 1.0, duration: 0.1),
            ]),
        ])) { [weak self] in
            self?.isAttacking = false
            self?.applyDamage(to: target)
        }

        if let parent {
            if attackRange > 70 {
                FXLibrary.play(team == .player ? .magic : .muzzle, at: position, in: parent, scale: 0.4, z: 200)
            } else {
                FXLibrary.play(.slash, at: target.position, in: parent, scale: 0.4, z: 200)
            }
        }
    }

    private func applyDamage(to target: SKNode) {
        if let u = target as? UnitNode {
            u.takeDamage(damage)
        } else if let c = target as? ChampionNode {
            c.takeDamage(damage)
        } else if let s = target as? StructureNode {
            s.takeDamage(damage)
        }
    }

    func takeDamage(_ amount: CGFloat) {
        guard isAlive else { return }
        hp -= amount
        refreshHP()
        sprite.run(.sequence([
            .colorize(with: .red, colorBlendFactor: 0.7, duration: 0.04),
            .colorize(withColorBlendFactor: 0, duration: 0.1),
        ]))
        if hp <= 0 { die() }
    }

    private func refreshHP() {
        let ratio = max(0, hp / maxHP)
        let barW = spriteSize * 0.9
        hpBarFill.removeFromParent()
        let fill = SKShapeNode(rectOf: CGSize(width: max(2, barW * ratio), height: 5), cornerRadius: 2)
        fill.fillColor = team == .player
            ? (ratio > 0.3 ? .cyan : .orange)
            : (ratio > 0.3 ? .red : .orange)
        fill.strokeColor = .clear
        fill.position = CGPoint(x: -(barW * (1 - ratio)) / 2, y: spriteSize * 0.55)
        fill.zPosition = 6
        addChild(fill)
        hpBarFill = fill
    }

    private func die() {
        isAlive = false
        removeAllActions()
        if let parent {
            FXLibrary.play(.puff, at: position, in: parent, scale: 0.45, z: 220)
            if foeKind?.isBoss == true {
                FXLibrary.play(.explosion, at: position, in: parent, scale: 0.8, z: 221)
            }
        }
        run(.sequence([
            .group([.scale(to: 0.05, duration: 0.25), .fadeOut(withDuration: 0.25), .rotate(byAngle: .pi, duration: 0.25)]),
            .removeFromParent(),
        ]))
    }
}
