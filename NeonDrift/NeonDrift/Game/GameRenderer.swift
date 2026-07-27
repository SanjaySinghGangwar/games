import SwiftUI

enum GameRenderer {
    private static let asteroidNames = ["Asteroid1", "Asteroid2", "Asteroid3"]

    static func draw(
        context: GraphicsContext,
        size: CGSize,
        model: GameModel
    ) {
        let shakeX = model.shake > 0 ? CGFloat.random(in: -5...5) * model.shake : 0
        let shakeY = model.shake > 0 ? CGFloat.random(in: -5...5) * model.shake : 0

        context.drawLayer { layer in
            layer.translateBy(x: shakeX, y: shakeY)
            drawBackground(context: layer, size: size, model: model)
            drawStars(context: layer, model: model)
            drawBlackHoles(context: layer, model: model)
            drawParticles(context: layer, model: model)
            drawCrystals(context: layer, model: model)
            drawPowerUps(context: layer, model: model)
            drawAsteroids(context: layer, model: model)
            drawMissiles(context: layer, model: model)
            drawBullets(context: layer, model: model)
            drawBolts(context: layer, model: model)
            drawDrones(context: layer, model: model)

            if model.phase == .playing || model.phase == .paused || model.phase == .gameOver {
                drawShip(context: layer, model: model)
            }

            drawFloaters(context: layer, model: model)
        }

        if model.invulnTime > 1.0 && model.phase == .playing {
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color.cyan.opacity(0.08)))
        }
        if model.mayhemActive || model.chaosTime > 0 {
            context.fill(
                Path(CGRect(origin: .zero, size: size)),
                with: .color(Color(hue: Double(model.hueShift), saturation: 0.7, brightness: 1).opacity(0.07))
            )
        }
        if model.flashWhite > 0 {
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(Color.white.opacity(Double(model.flashWhite) * 0.65)))
        }
    }

    // MARK: - Layers

    private static func drawBackground(context: GraphicsContext, size: CGSize, model: GameModel) {
        let bg = Image("SpaceBackground")
        let h = size.height
        let offset = model.backgroundOffset

        context.draw(bg, in: CGRect(x: 0, y: offset - h, width: size.width, height: h))
        context.draw(bg, in: CGRect(x: 0, y: offset, width: size.width, height: h))

        // Depth tint
        context.fill(
            Path(CGRect(origin: .zero, size: size)),
            with: .linearGradient(
                Gradient(colors: [
                    Color(red: 0.05, green: 0.02, blue: 0.15).opacity(0.25),
                    .clear,
                    Color.black.opacity(0.35)
                ]),
                startPoint: CGPoint(x: size.width * 0.5, y: 0),
                endPoint: CGPoint(x: size.width * 0.5, y: size.height)
            )
        )

        // Nitro speed lines
        if model.nitroTime > 0 {
            for i in 0..<10 {
                let x = CGFloat(i) / 10 * size.width + 12
                var path = Path()
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: size.height))
                context.stroke(path, with: .color(Color.green.opacity(0.08)), lineWidth: 1.2)
            }
        }

        context.fill(
            Path(CGRect(origin: .zero, size: size)),
            with: .radialGradient(
                Gradient(colors: [.clear, Color.black.opacity(0.4)]),
                center: CGPoint(x: size.width * 0.5, y: size.height * 0.42),
                startRadius: size.width * 0.12,
                endRadius: max(size.width, size.height) * 0.92
            )
        )
    }

    private static func drawStars(context: GraphicsContext, model: GameModel) {
        for star in model.stars where star.brightness > 0.55 {
            let alpha = Double(star.brightness) * 0.55
            let rect = CGRect(
                x: star.x - star.size * 0.5,
                y: star.y - star.size * 0.5,
                width: star.size,
                height: star.size
            )
            context.fill(Path(ellipseIn: rect), with: .color(Color.white.opacity(alpha)))
        }
    }

    private static func drawParticles(context: GraphicsContext, model: GameModel) {
        for p in model.particles {
            let t = max(0, p.life / p.maxLife)
            let color = Color(
                red: Double(p.color.x),
                green: Double(p.color.y),
                blue: Double(p.color.z),
                opacity: Double(t) * 0.92
            )
            let s = p.size * (0.5 + 0.5 * t)
            context.fill(
                Path(ellipseIn: CGRect(x: p.x - s * 0.5, y: p.y - s * 0.5, width: s, height: s)),
                with: .color(color)
            )
        }
    }

    private static func drawCrystals(context: GraphicsContext, model: GameModel) {
        let image = Image("Crystal")
        for c in model.crystals {
            let pulse = 1 + 0.1 * sin(c.pulse)
            let side = c.radius * 2.6 * pulse
            let rect = CGRect(x: c.x - side * 0.5, y: c.y - side * 0.5, width: side, height: side)

            let glowColor: Color
            if c.damagesBoss {
                glowColor = Color.red.opacity(0.35)
            } else if c.isGold {
                glowColor = Color(red: 1, green: 0.85, blue: 0.25).opacity(0.28)
            } else {
                glowColor = Color(red: 1, green: 0.35, blue: 0.9).opacity(0.22)
            }
            context.fill(Path(ellipseIn: rect.insetBy(dx: -side * 0.2, dy: -side * 0.2)), with: .color(glowColor))
            context.draw(image, in: rect)

            if c.damagesBoss {
                context.stroke(Path(ellipseIn: rect.insetBy(dx: -2, dy: -2)), with: .color(Color.red.opacity(0.7)), lineWidth: 1.5)
            } else if c.isGold {
                context.fill(Path(ellipseIn: rect.insetBy(dx: side * 0.2, dy: side * 0.2)), with: .color(Color.yellow.opacity(0.15)))
            }
        }
    }

    private static func drawPowerUps(context: GraphicsContext, model: GameModel) {
        for p in model.powerUps {
            let pulse = 1 + 0.12 * sin(p.pulse)
            let r = p.radius * pulse
            let c = p.kind.color
            let color = Color(red: Double(c.x), green: Double(c.y), blue: Double(c.z))

            let outer = CGRect(x: p.x - r * 1.55, y: p.y - r * 1.55, width: r * 3.1, height: r * 3.1)
            context.stroke(Path(ellipseIn: outer), with: .color(color.opacity(0.4)), lineWidth: 2)

            let core = CGRect(x: p.x - r, y: p.y - r, width: r * 2, height: r * 2)
            context.fill(
                Path(ellipseIn: core),
                with: .radialGradient(
                    Gradient(colors: [.white.opacity(0.95), color.opacity(0.95), color.opacity(0.2)]),
                    center: CGPoint(x: p.x, y: p.y - r * 0.2),
                    startRadius: 0,
                    endRadius: r
                )
            )
            context.stroke(Path(ellipseIn: core), with: .color(.white.opacity(0.9)), lineWidth: 1.4)

            // Letter mark for kind (reliable at small size)
            let mark: String
            switch p.kind {
            case .shield: mark = "S"
            case .magnet: mark = "M"
            case .slowmo: mark = "T"
            case .multiplier: mark = "×"
            case .nitro: mark = "N"
            case .rapid: mark = "R"
            case .drones: mark = "D"
            case .chaos: mark = "!"
            case .blackhole: mark = "O"
            }
            context.draw(
                Text(mark)
                    .font(.system(size: r * 1.05, weight: .black, design: .rounded))
                    .foregroundColor(.black.opacity(0.75)),
                at: CGPoint(x: p.x, y: p.y),
                anchor: .center
            )
        }
    }

    private static func drawAsteroids(context: GraphicsContext, model: GameModel) {
        for rock in model.asteroids {
            let name = asteroidNames[rock.spriteIndex % asteroidNames.count]
            let image = Image(name)
            let side = rock.radius * (rock.isBoss ? 2.55 : 2.35)

            if rock.isBoss {
                let aura = rock.radius * 1.45
                context.stroke(
                    Path(ellipseIn: CGRect(x: rock.x - aura, y: rock.y - aura, width: aura * 2, height: aura * 2)),
                    with: .color(Color.red.opacity(0.35 + 0.1 * sin(model.elapsed * 5))),
                    lineWidth: 3
                )
                context.fill(
                    Path(ellipseIn: CGRect(x: rock.x - aura, y: rock.y - aura, width: aura * 2, height: aura * 2)),
                    with: .color(Color.orange.opacity(0.12))
                )
                // HP arc under boss
                if rock.maxHp > 0 {
                    let ratio = CGFloat(rock.hp) / CGFloat(rock.maxHp)
                    let barW = rock.radius * 2.2
                    let barH: CGFloat = 6
                    let bx = rock.x - barW * 0.5
                    let by = rock.y + rock.radius + 10
                    context.fill(
                        Path(roundedRect: CGRect(x: bx, y: by, width: barW, height: barH), cornerRadius: 3),
                        with: .color(Color.black.opacity(0.45))
                    )
                    context.fill(
                        Path(roundedRect: CGRect(x: bx, y: by, width: barW * ratio, height: barH), cornerRadius: 3),
                        with: .color(Color(red: 1, green: 0.35, blue: 0.35))
                    )
                }
            }

            context.drawLayer { layer in
                layer.translateBy(x: rock.x, y: rock.y)
                layer.rotate(by: .radians(rock.rotation))
                if rock.isBoss {
                    layer.scaleBy(x: 1.08, y: 1.08)
                }
                layer.draw(image, in: CGRect(x: -side * 0.5, y: -side * 0.5, width: side, height: side))
            }
        }
    }

    private static func drawBullets(context: GraphicsContext, model: GameModel) {
        for b in model.bullets {
            let core: Color
            let glow: Color
            switch b.style {
            case 1:
                core = Color(red: 1, green: 0.9, blue: 0.35)
                glow = Color.orange.opacity(0.45)
            case 2:
                core = Color(hue: Double(model.hueShift + b.x * 0.001).truncatingRemainder(dividingBy: 1), saturation: 0.9, brightness: 1)
                glow = core.opacity(0.5)
            case 3:
                core = Color(red: 0.75, green: 0.55, blue: 1)
                glow = Color.purple.opacity(0.45)
            default:
                core = Color(red: 0.45, green: 1, blue: 1)
                glow = Color.cyan.opacity(0.4)
            }

            let trail = CGRect(x: b.x - 2, y: b.y, width: 4, height: 14)
            context.fill(Path(roundedRect: trail, cornerRadius: 2), with: .color(core.opacity(0.35)))
            let glowR = b.radius * 2.4
            context.fill(
                Path(ellipseIn: CGRect(x: b.x - glowR, y: b.y - glowR, width: glowR * 2, height: glowR * 2)),
                with: .color(glow)
            )
            let body = CGRect(x: b.x - b.radius * 0.7, y: b.y - b.radius * 1.6, width: b.radius * 1.4, height: b.radius * 3.2)
            context.fill(Path(roundedRect: body, cornerRadius: b.radius), with: .color(core))
            context.fill(
                Path(ellipseIn: CGRect(x: b.x - b.radius * 0.45, y: b.y - b.radius * 1.8, width: b.radius * 0.9, height: b.radius * 0.9)),
                with: .color(.white.opacity(0.95))
            )
        }
    }

    private static func drawMissiles(context: GraphicsContext, model: GameModel) {
        for m in model.missiles {
            let body = CGRect(x: m.x - 4, y: m.y - 10, width: 8, height: 18)
            context.fill(Path(roundedRect: body, cornerRadius: 3), with: .color(Color.orange))
            context.fill(
                Path(ellipseIn: CGRect(x: m.x - 6, y: m.y + 4, width: 12, height: 10)),
                with: .color(Color.red.opacity(0.55))
            )
            context.fill(
                Path(ellipseIn: CGRect(x: m.x - 2, y: m.y - 12, width: 4, height: 4)),
                with: .color(.white)
            )
        }
    }

    private static func drawDrones(context: GraphicsContext, model: GameModel) {
        guard model.droneTime > 0 else { return }
        for d in model.drones {
            let x = model.ship.x + cos(d.angle) * d.orbit
            let y = model.ship.y + sin(d.angle) * d.orbit * 0.55
            let r: CGFloat = 9
            context.fill(
                Path(ellipseIn: CGRect(x: x - r * 1.6, y: y - r * 1.6, width: r * 3.2, height: r * 3.2)),
                with: .color(Color.purple.opacity(0.25))
            )
            context.fill(
                Path(ellipseIn: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)),
                with: .color(Color(red: 0.55, green: 0.35, blue: 1))
            )
            context.stroke(
                Path(ellipseIn: CGRect(x: x - r, y: y - r, width: r * 2, height: r * 2)),
                with: .color(.white.opacity(0.8)),
                lineWidth: 1.2
            )
        }
    }

    private static func drawBolts(context: GraphicsContext, model: GameModel) {
        for b in model.bolts {
            let t = max(0, b.life / b.maxLife)
            var path = Path()
            path.move(to: CGPoint(x: b.x1, y: b.y1))
            // Jagged lightning
            let mids = 4
            for i in 1...mids {
                let u = CGFloat(i) / CGFloat(mids + 1)
                let x = b.x1 + (b.x2 - b.x1) * u + CGFloat.random(in: -10...10)
                let y = b.y1 + (b.y2 - b.y1) * u + CGFloat.random(in: -10...10)
                path.addLine(to: CGPoint(x: x, y: y))
            }
            path.addLine(to: CGPoint(x: b.x2, y: b.y2))
            context.stroke(path, with: .color(Color.white.opacity(0.9 * t)), lineWidth: 2.4)
            context.stroke(path, with: .color(Color.cyan.opacity(0.7 * t)), lineWidth: 5)
        }
    }

    private static func drawBlackHoles(context: GraphicsContext, model: GameModel) {
        for h in model.blackHoles {
            let t = max(0, h.life / h.maxLife)
            let r = h.radius * (0.85 + 0.2 * sin(h.life * 10))
            context.fill(
                Path(ellipseIn: CGRect(x: h.x - r * 1.8, y: h.y - r * 1.8, width: r * 3.6, height: r * 3.6)),
                with: .color(Color.purple.opacity(0.18 * t))
            )
            context.fill(
                Path(ellipseIn: CGRect(x: h.x - r, y: h.y - r, width: r * 2, height: r * 2)),
                with: .radialGradient(
                    Gradient(colors: [Color.black, Color.purple.opacity(0.8 * t), Color.clear]),
                    center: CGPoint(x: h.x, y: h.y),
                    startRadius: 0,
                    endRadius: r
                )
            )
            context.stroke(
                Path(ellipseIn: CGRect(x: h.x - r * 1.1, y: h.y - r * 1.1, width: r * 2.2, height: r * 2.2)),
                with: .color(Color(red: 0.7, green: 0.3, blue: 1).opacity(0.7 * t)),
                style: StrokeStyle(lineWidth: 2, dash: [6, 4])
            )
        }
    }

    private static func drawShip(context: GraphicsContext, model: GameModel) {
        let s = model.ship
        let lean = max(-0.42, min(0.42, s.vx / 540))
        let side = s.visualRadius * 2.1
        let blink = model.invulnTime > 0 && Int(model.invulnTime * 12) % 2 == 0

        // Shield aura
        if model.shields > 0 || model.invulnTime > 0 {
            let auraR = side * 0.62
            let alpha = model.invulnTime > 0 ? 0.35 : 0.18
            context.stroke(
                Path(ellipseIn: CGRect(x: s.x - auraR, y: s.y - auraR, width: auraR * 2, height: auraR * 2)),
                with: .color(Color.cyan.opacity(alpha + 0.1 * sin(model.elapsed * 6))),
                lineWidth: 2.5
            )
            context.fill(
                Path(ellipseIn: CGRect(x: s.x - auraR, y: s.y - auraR, width: auraR * 2, height: auraR * 2)),
                with: .color(Color.cyan.opacity(alpha * 0.35))
            )
        }

        // Magnet ring
        if model.magnetTime > 0 {
            let mr = side * 0.85
            context.stroke(
                Path(ellipseIn: CGRect(x: s.x - mr, y: s.y - mr, width: mr * 2, height: mr * 2)),
                with: .color(Color.pink.opacity(0.25)),
                style: StrokeStyle(lineWidth: 1.5, dash: [4, 4])
            )
        }

        if blink && model.phase == .playing { return }

        let thruster = Image("Thruster")
        let thrW = side * (model.nitroTime > 0 ? 0.7 : 0.55)
        let thrH = side * (model.nitroTime > 0 ? 1.1 : 0.85)
        context.drawLayer { layer in
            layer.translateBy(x: s.x + lean * 6, y: s.y + s.visualRadius * 0.55)
            layer.rotate(by: .radians(lean * 0.35))
            layer.opacity = model.nitroTime > 0 ? 1.0 : 0.9
            layer.draw(thruster, in: CGRect(x: -thrW * 0.5, y: 0, width: thrW, height: thrH))
        }

        let ship = Image("Ship")
        context.drawLayer { layer in
            layer.translateBy(x: s.x, y: s.y)
            layer.rotate(by: .radians(lean * 0.55))
            layer.draw(ship, in: CGRect(x: -side * 0.5, y: -side * 0.5, width: side, height: side))
        }
    }

    private static func drawFloaters(context: GraphicsContext, model: GameModel) {
        for f in model.floaters {
            let t = max(0, f.life / f.maxLife)
            let color = Color(
                red: Double(f.color.x),
                green: Double(f.color.y),
                blue: Double(f.color.z),
                opacity: Double(t)
            )
            context.draw(
                Text(f.text)
                    .font(.system(size: 14, weight: .heavy, design: .rounded))
                    .foregroundColor(color),
                at: CGPoint(x: f.x, y: f.y),
                anchor: .center
            )
        }
    }
}
