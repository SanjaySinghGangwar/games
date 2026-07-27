import SwiftUI

/// Stadium broadcast view.
/// IMPORTANT: Never nest `GraphicsContext.drawLayer` or draw with a parent `context`
/// from inside a child layer — that triggers:
/// "precondition failure: current layer doesn't match drawing state"
enum MatchRenderer {
    static func draw(context: GraphicsContext, size: CGSize, model: MatchModel) {
        let ox = model.cameraShake > 0 ? CGFloat.random(in: -4...4) * model.cameraShake : 0
        let oy = model.cameraShake > 0 ? CGFloat.random(in: -3...3) * model.cameraShake : 0

        // Stadium background
        context.draw(
            Image("StadiumBG"),
            in: CGRect(x: ox, y: oy, width: size.width, height: size.height)
        )

        // UI readability grade
        context.fill(
            Path(CGRect(x: ox, y: oy, width: size.width, height: size.height)),
            with: .linearGradient(
                Gradient(colors: [
                    Color.black.opacity(0.28),
                    .clear,
                    .clear,
                    Color.black.opacity(0.42)
                ]),
                startPoint: CGPoint(x: size.width * 0.5 + ox, y: oy),
                endPoint: CGPoint(x: size.width * 0.5 + ox, y: size.height + oy)
            )
        )

        drawBounceDust(context: context, model: model, ox: ox, oy: oy)
        drawBowler(context: context, model: model, ox: ox, oy: oy)
        drawNearStumps(context: context, model: model, ox: ox, oy: oy)
        drawTrail(context: context, model: model, ox: ox, oy: oy)
        if model.showBall {
            drawBall(context: context, model: model, ox: ox, oy: oy)
        }
        drawBatsman(context: context, model: model, ox: ox, oy: oy)
        drawParticles(context: context, model: model, ox: ox, oy: oy)
        drawBoundaryFX(context: context, size: size, model: model, ox: ox, oy: oy)
        drawTimingMeter(context: context, size: size, model: model, ox: ox, oy: oy)

        if model.boundaryFlash > 0 {
            let c: Color = model.lastResult == .six
                ? Color.orange.opacity(Double(model.boundaryFlash) * 0.22)
                : Color.yellow.opacity(Double(model.boundaryFlash) * 0.16)
            context.fill(Path(CGRect(origin: .zero, size: size)), with: .color(c))
        }
    }

    // MARK: - Players (no nested layers)

    private static func drawBowler(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        let h: CGFloat = 92
        let w: CGFloat = 72
        let wind = model.delivery == .bowling ? sin(model.bowlWindup * 10) * 3 : 0
        let px = model.bowlerX + wind + ox
        let py = model.bowlerY + oy

        context.fill(
            Path(ellipseIn: CGRect(x: px - 16, y: py + 2, width: 32, height: 8)),
            with: .color(Color.black.opacity(0.22))
        )
        // Feet at (px, py) — draw upright without rotate to avoid nested layers
        context.draw(
            Image("Bowler"),
            in: CGRect(x: px - w * 0.5, y: py - h + 4, width: w, height: h)
        )
    }

    private static func drawBatsman(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        let img = Image(model.useSwingPose ? "BatsmanSwing" : "BatsmanReady")
        let h: CGFloat = 240
        let w: CGFloat = 180
        let px = model.batsmanX + ox
        let py = model.batsmanY + oy

        context.fill(
            Path(ellipseIn: CGRect(x: px - 42, y: py - 2, width: 84, height: 16)),
            with: .color(Color.black.opacity(0.32))
        )
        context.draw(
            img,
            in: CGRect(x: px - w * 0.5, y: py - h + 6, width: w, height: h)
        )
    }

    private static func drawNearStumps(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        let x = model.batsmanX - 2 + ox
        let y = model.batsmanY - 8 + oy
        let h: CGFloat = 34
        let w: CGFloat = 3.6
        for i in -1...1 {
            let sx = x + CGFloat(i) * 7
            context.fill(
                Path(roundedRect: CGRect(x: sx - w * 0.5, y: y - h, width: w, height: h), cornerRadius: 1),
                with: .color(Color(red: 0.97, green: 0.92, blue: 0.75))
            )
        }
        context.fill(
            Path(roundedRect: CGRect(x: x - 12, y: y - h - 3, width: 24, height: 3), cornerRadius: 1),
            with: .color(Color(red: 0.97, green: 0.92, blue: 0.75))
        )
        context.fill(
            Path(ellipseIn: CGRect(x: x - 14, y: y - 2, width: 28, height: 6)),
            with: .color(Color.black.opacity(0.18))
        )
    }

    // MARK: - Ball

    private static func drawTrail(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        guard model.trail.count > 1 else { return }
        for (i, p) in model.trail.enumerated() {
            let t = max(0, 1 - p.age / 0.25)
            let s = 2.5 + CGFloat(i) * 0.12
            context.fill(
                Path(ellipseIn: CGRect(x: p.x + ox - s * 0.5, y: p.y + oy - s * 0.5, width: s, height: s)),
                with: .color(Color.white.opacity(0.12 * Double(t)))
            )
        }
    }

    private static func drawBall(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        let base: CGFloat = 26
        let s = base * model.ballScale
        let bx = model.ballX + ox
        let by = model.ballY + oy

        let shW = 14 * model.ballShadowScale
        context.fill(
            Path(ellipseIn: CGRect(
                x: model.ballX + ox - shW,
                y: model.ballShadowY + oy - shW * 0.3,
                width: shW * 2,
                height: shW * 0.55
            )),
            with: .color(Color.black.opacity(0.28))
        )

        // Motion ghost (no extra layer)
        if model.delivery == .inFlight || model.delivery == .boundaryFlight {
            let gx = model.delivery == .boundaryFlight ? model.ballVX * 0.012 : 0
            let gy = model.delivery == .boundaryFlight ? model.ballVY * 0.01 : -6
            var ghost = context
            ghost.opacity = 0.22
            ghost.draw(
                Image("CricketBall"),
                in: CGRect(x: bx - s * 0.45 - gx, y: by - s * 0.45 - gy, width: s * 0.85, height: s * 0.85)
            )
        }

        // Ball itself (skip rotate via layer — spin is visual optional via slight offset)
        context.draw(
            Image("CricketBall"),
            in: CGRect(x: bx - s * 0.5, y: by - s * 0.5, width: s, height: s)
        )

        context.fill(
            Path(ellipseIn: CGRect(x: bx - s * 0.16, y: by - s * 0.2, width: s * 0.2, height: s * 0.14)),
            with: .color(Color.white.opacity(0.32))
        )
    }

    private static func drawBounceDust(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        guard model.bounceDust > 0 else { return }
        let a = Double(model.bounceDust) * 0.4
        let r = 14 + (1 - model.bounceDust) * 28
        context.stroke(
            Path(ellipseIn: CGRect(
                x: model.ballX + ox - r,
                y: model.ballY + oy - r * 0.3,
                width: r * 2,
                height: r * 0.55
            )),
            with: .color(Color(red: 0.72, green: 0.58, blue: 0.35).opacity(a)),
            lineWidth: 2
        )
    }

    private static func drawParticles(context: GraphicsContext, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        for p in model.particles {
            let t = max(0, p.life / p.maxLife)
            let c = Color(red: Double(p.color.x), green: Double(p.color.y), blue: Double(p.color.z), opacity: Double(t))
            let s = p.size * (0.5 + 0.5 * t)
            context.fill(
                Path(ellipseIn: CGRect(x: p.x + ox - s * 0.5, y: p.y + oy - s * 0.5, width: s, height: s)),
                with: .color(c)
            )
        }
    }

    private static func drawBoundaryFX(context: GraphicsContext, size: CGSize, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        guard model.boundaryFlash > 0, let result = model.lastResult, result.isBoundary else { return }
        let a = Double(model.boundaryFlash)
        if result == .six {
            context.fill(
                Path(CGRect(x: ox, y: size.height * 0.08 + oy, width: size.width, height: 8)),
                with: .color(Color.orange.opacity(0.5 * a))
            )
            context.draw(
                Text("INTO THE STANDS!")
                    .font(.system(size: 18, weight: .black, design: .rounded))
                    .foregroundColor(Color.yellow.opacity(0.92 * a)),
                at: CGPoint(x: size.width * 0.5 + ox, y: size.height * 0.07 + oy),
                anchor: .center
            )
        } else {
            context.fill(
                Path(CGRect(x: ox, y: size.height * 0.42 + oy, width: 8, height: size.height * 0.2)),
                with: .color(Color.yellow.opacity(0.35 * a))
            )
            context.fill(
                Path(CGRect(x: size.width - 8 + ox, y: size.height * 0.42 + oy, width: 8, height: size.height * 0.2)),
                with: .color(Color.yellow.opacity(0.35 * a))
            )
            context.draw(
                Text("BOUNDARY FOUR!")
                    .font(.system(size: 16, weight: .black, design: .rounded))
                    .foregroundColor(Color.white.opacity(0.9 * a)),
                at: CGPoint(x: size.width * 0.5 + ox, y: size.height * 0.20 + oy),
                anchor: .center
            )
        }
    }

    private static func drawTimingMeter(context: GraphicsContext, size: CGSize, model: MatchModel, ox: CGFloat, oy: CGFloat) {
        guard model.phase == .playing, model.delivery == .inFlight || model.delivery == .bowling else { return }

        let w = size.width * 0.78
        let h: CGFloat = 14
        let x = (size.width - w) / 2 + ox
        let y = size.height * 0.90 + oy
        let bar = CGRect(x: x, y: y, width: w, height: h)

        context.fill(Path(roundedRect: bar, cornerRadius: 7), with: .color(Color.black.opacity(0.5)))
        context.fill(
            Path(roundedRect: CGRect(x: x + w * 0.64, y: y, width: w * 0.24, height: h), cornerRadius: 6),
            with: .color(Color.yellow.opacity(0.4))
        )
        context.fill(
            Path(roundedRect: CGRect(x: x + w * 0.74, y: y, width: w * 0.09, height: h), cornerRadius: 6),
            with: .color(Color.green.opacity(0.8))
        )

        let t = min(1, max(0, model.ballT))
        let mx = x + w * t
        let ms: CGFloat = 16
        context.draw(Image("CricketBall"), in: CGRect(x: mx - ms * 0.5, y: y - 5, width: ms, height: ms))
        context.stroke(Path(roundedRect: bar, cornerRadius: 7), with: .color(.white.opacity(0.3)), lineWidth: 1)
        context.draw(
            Text("TAP IN THE GREEN")
                .font(.system(size: 11, weight: .heavy, design: .rounded))
                .foregroundColor(Color.white.opacity(0.55)),
            at: CGPoint(x: size.width * 0.5 + ox, y: y - 14),
            anchor: .center
        )
    }
}
