import SpriteKit

enum StructureRole {
    case spiritWell   // player base — defend
    case riftCore     // enemy objective — destroy
}

/// Clear, labeled objective: big icon + role text so players instantly get it.
final class StructureNode: SKNode {
    let role: StructureRole
    private let platform: SKShapeNode
    private let sprite: SKSpriteNode
    private let aura: SKShapeNode
    private let titleLabel: SKLabelNode
    private let roleLabel: SKLabelNode
    private let hpBarBG: SKShapeNode
    private var hpBarFill: SKShapeNode

    var hp: CGFloat
    let maxHP: CGFloat
    private(set) var isAlive = true
    var radius: CGFloat { 56 }

    init(role: StructureRole, maxHP: CGFloat) {
        self.role = role
        self.maxHP = maxHP
        self.hp = maxHP

        let isWell = role == .spiritWell
        let accent = isWell ? SKColor(red: 0.2, green: 0.85, blue: 0.95, alpha: 1) : SKColor(red: 1, green: 0.35, blue: 0.35, alpha: 1)

        // Stone platform base — reads as "building on the map"
        platform = SKShapeNode(ellipseOf: CGSize(width: 120, height: 48))
        platform.fillColor = isWell
            ? SKColor(red: 0.2, green: 0.35, blue: 0.4, alpha: 0.9)
            : SKColor(red: 0.4, green: 0.18, blue: 0.2, alpha: 0.9)
        platform.strokeColor = accent.withAlphaComponent(0.9)
        platform.lineWidth = 3
        platform.position = CGPoint(x: 0, y: -28)
        platform.zPosition = 0

        let asset = isWell ? "well" : "portal"
        let tex = SKTexture(imageNamed: asset)
        sprite = SKSpriteNode(texture: tex, size: CGSize(width: 88, height: 88))
        sprite.zPosition = 2
        sprite.position = CGPoint(x: 0, y: 10)

        aura = SKShapeNode(circleOfRadius: 58)
        aura.strokeColor = accent.withAlphaComponent(0.75)
        aura.lineWidth = 4
        aura.fillColor = accent.withAlphaComponent(0.12)
        aura.zPosition = 1
        aura.position = CGPoint(x: 0, y: 8)

        titleLabel = SKLabelNode(fontNamed: "AvenirNext-Heavy")
        titleLabel.text = isWell ? "YOUR BASE" : "ENEMY RIFT"
        titleLabel.fontSize = 13
        titleLabel.fontColor = accent
        titleLabel.position = CGPoint(x: 0, y: 78)
        titleLabel.zPosition = 12
        titleLabel.horizontalAlignmentMode = .center

        roleLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
        roleLabel.text = isWell ? "PROTECT THIS" : "DESTROY THIS"
        roleLabel.fontSize = 11
        roleLabel.fontColor = .white
        roleLabel.position = CGPoint(x: 0, y: 64)
        roleLabel.zPosition = 12
        roleLabel.horizontalAlignmentMode = .center

        // Soft label plate
        let plate = SKShapeNode(rectOf: CGSize(width: 110, height: 32), cornerRadius: 8)
        plate.fillColor = SKColor.black.withAlphaComponent(0.55)
        plate.strokeColor = accent.withAlphaComponent(0.5)
        plate.lineWidth = 1.5
        plate.position = CGPoint(x: 0, y: 72)
        plate.zPosition = 11

        hpBarBG = SKShapeNode(rectOf: CGSize(width: 100, height: 10), cornerRadius: 4)
        hpBarBG.fillColor = SKColor.black.withAlphaComponent(0.6)
        hpBarBG.strokeColor = SKColor.white.withAlphaComponent(0.2)
        hpBarBG.lineWidth = 1
        hpBarBG.position = CGPoint(x: 0, y: -52)
        hpBarBG.zPosition = 10

        hpBarFill = SKShapeNode(rectOf: CGSize(width: 100, height: 10), cornerRadius: 4)
        hpBarFill.fillColor = accent
        hpBarFill.strokeColor = .clear
        hpBarFill.position = CGPoint(x: 0, y: -52)
        hpBarFill.zPosition = 11

        super.init()
        addChild(platform)
        addChild(aura)
        addChild(sprite)
        addChild(plate)
        addChild(titleLabel)
        addChild(roleLabel)
        addChild(hpBarBG)
        addChild(hpBarFill)

        aura.run(.repeatForever(.sequence([
            .scale(to: 1.1, duration: 0.9),
            .scale(to: 1.0, duration: 0.9),
        ])))
        if !isWell {
            sprite.run(.repeatForever(.sequence([
                .rotate(byAngle: 0.12, duration: 1.4),
                .rotate(byAngle: -0.12, duration: 1.4),
            ])))
        }
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    func takeDamage(_ amount: CGFloat) {
        guard isAlive else { return }
        hp -= amount
        refreshHP()
        sprite.run(.sequence([
            .colorize(with: .orange, colorBlendFactor: 0.7, duration: 0.05),
            .colorize(withColorBlendFactor: 0, duration: 0.12),
        ]))
        run(.sequence([
            .moveBy(x: 3, y: 0, duration: 0.03),
            .moveBy(x: -6, y: 0, duration: 0.04),
            .moveBy(x: 3, y: 0, duration: 0.03),
        ]))
        if let parent {
            FXLibrary.play(.spark, at: position, in: parent, scale: 0.5, z: 200)
        }
        if hp <= 0 { destroy() }
    }

    private func refreshHP() {
        let ratio = max(0, hp / maxHP)
        let accent = role == .spiritWell
            ? SKColor(red: 0.2, green: 0.85, blue: 0.95, alpha: 1)
            : SKColor(red: 1, green: 0.35, blue: 0.35, alpha: 1)
        hpBarFill.removeFromParent()
        let fill = SKShapeNode(rectOf: CGSize(width: max(3, 100 * ratio), height: 10), cornerRadius: 4)
        fill.fillColor = ratio > 0.3 ? accent : .orange
        fill.strokeColor = .clear
        fill.position = CGPoint(x: -(100 * (1 - ratio)) / 2, y: -52)
        fill.zPosition = 11
        addChild(fill)
        hpBarFill = fill
    }

    private func destroy() {
        isAlive = false
        if let parent {
            FXLibrary.play(.explosion, at: position, in: parent, scale: 1.3, z: 300)
            FXLibrary.play(.puff, at: position, in: parent, scale: 1.0, z: 301)
        }
        sprite.removeAllActions()
        aura.removeAllActions()
        titleLabel.text = role == .spiritWell ? "BASE LOST" : "RIFT SEALED!"
        roleLabel.text = ""
        run(.sequence([
            .group([.scale(to: 0.15, duration: 0.45), .fadeOut(withDuration: 0.45)]),
        ]))
    }
}
