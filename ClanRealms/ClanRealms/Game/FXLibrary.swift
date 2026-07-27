import SpriteKit

/// Animated combat FX from downloaded Kenney particle frames.
enum FXLibrary {
    static func textures(prefix: String, count: Int) -> [SKTexture] {
        (0..<count).compactMap { i -> SKTexture? in
            let name = String(format: "%@%02d", prefix, i)
            let t = SKTexture(imageNamed: name)
            guard t.size().width > 2 else { return nil }
            t.filteringMode = .linear
            return t
        }
    }

    static func explosionAction() -> SKAction? {
        let frames = textures(prefix: "expl_explosion", count: 9)
        guard frames.count >= 3 else { return nil }
        return .animate(with: frames, timePerFrame: 0.04, resize: true, restore: false)
    }

    static func puffAction() -> SKAction? {
        let frames = textures(prefix: "puff_whitePuff", count: 22)
        guard frames.count >= 4 else { return nil }
        return .animate(with: frames, timePerFrame: 0.035, resize: true, restore: false)
    }

    static func flashAction() -> SKAction? {
        let frames = textures(prefix: "flash_flash", count: 9)
        guard frames.count >= 3 else { return nil }
        return .animate(with: frames, timePerFrame: 0.03, resize: true, restore: false)
    }

    @discardableResult
    static func play(_ kind: Kind, at position: CGPoint, in parent: SKNode, scale: CGFloat = 1, z: CGFloat = 400) -> SKNode? {
        switch kind {
        case .explosion:
            return playFrames(explosionAction(), fallback: .orange, at: position, in: parent, scale: scale, z: z)
        case .puff:
            return playFrames(puffAction(), fallback: .white, at: position, in: parent, scale: scale, z: z)
        case .flash:
            return playFrames(flashAction(), fallback: .yellow, at: position, in: parent, scale: scale, z: z)
        case .slash:
            return playStatic("fx_slash_0\(Int.random(in: 1...4))", at: position, in: parent, scale: scale, z: z)
        case .muzzle:
            return playStatic("fx_muzzle_0\(Int.random(in: 1...5))", at: position, in: parent, scale: scale * 0.65, z: z)
        case .magic:
            return playStatic("fx_magic_0\(Int.random(in: 1...5))", at: position, in: parent, scale: scale, z: z)
        case .fire:
            return playStatic("fx_flame_0\(Int.random(in: 1...6))", at: position, in: parent, scale: scale, z: z)
        case .heal:
            return playStatic("fx_light_0\(Int.random(in: 1...3))", at: position, in: parent, scale: scale, z: z)
        case .spark:
            return playStatic("fx_flare_01", at: position, in: parent, scale: scale * 0.5, z: z)
        }
    }

    private static func playFrames(_ action: SKAction?, fallback: SKColor, at position: CGPoint, in parent: SKNode, scale: CGFloat, z: CGFloat) -> SKNode? {
        if let action {
            let node = SKSpriteNode(color: .clear, size: CGSize(width: 64, height: 64))
            node.position = position
            node.setScale(scale)
            node.zPosition = z
            node.blendMode = .add
            parent.addChild(node)
            node.run(.sequence([action, .fadeOut(withDuration: 0.04), .removeFromParent()]))
            return node
        }
        let n = SKShapeNode(circleOfRadius: 12 * scale)
        n.fillColor = fallback
        n.strokeColor = .clear
        n.position = position
        n.zPosition = z
        parent.addChild(n)
        n.run(.sequence([
            .group([.scale(to: 2.8, duration: 0.22), .fadeOut(withDuration: 0.22)]),
            .removeFromParent(),
        ]))
        return n
    }

    private static func playStatic(_ name: String, at position: CGPoint, in parent: SKNode, scale: CGFloat, z: CGFloat) -> SKSpriteNode {
        let tex = SKTexture(imageNamed: name)
        let node: SKSpriteNode
        if tex.size().width > 2 {
            node = SKSpriteNode(texture: tex)
            node.blendMode = .add
        } else {
            node = SKSpriteNode(color: .white, size: CGSize(width: 20, height: 20))
        }
        node.position = position
        node.setScale(scale)
        node.zPosition = z
        parent.addChild(node)
        node.run(.sequence([
            .group([.scale(to: scale * 1.45, duration: 0.16), .fadeOut(withDuration: 0.2)]),
            .removeFromParent(),
        ]))
        return node
    }

    enum Kind {
        case explosion, puff, flash, slash, muzzle, magic, fire, heal, spark
    }
}
