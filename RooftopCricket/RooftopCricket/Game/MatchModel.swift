import Foundation
import CoreGraphics
import UIKit
import AudioToolbox

enum MatchPhase: Equatable {
    case hub
    case setup
    case toss
    case playing
    case paused
    case inningsBreak
    case matchOver
}

enum DeliveryState: Equatable {
    case idle
    case bowling
    case inFlight
    case boundaryFlight
    case resultHold
}

enum ShotResult: Equatable {
    case six, four, two, one, dot, miss, outBowled, outCatch, outLBW

    var runs: Int {
        switch self {
        case .six: return 6
        case .four: return 4
        case .two: return 2
        case .one: return 1
        default: return 0
        }
    }

    var isWicket: Bool {
        switch self {
        case .outBowled, .outCatch, .outLBW: return true
        default: return false
        }
    }

    var isBoundary: Bool { self == .four || self == .six }

    var label: String {
        switch self {
        case .six: return "SIX!"
        case .four: return "FOUR!"
        case .two: return "TWO"
        case .one: return "SINGLE"
        case .dot: return "DOT BALL"
        case .miss: return "BEATEN"
        case .outBowled: return "BOWLED!"
        case .outCatch: return "CAUGHT!"
        case .outLBW: return "LBW!"
        }
    }
}

enum PlayerRole: Equatable {
    case batting
    case bowling
}

struct Particle {
    var x, y, vx, vy, life, maxLife, size: CGFloat
    var color: SIMD3<Float>
}

struct BallTrailPoint {
    var x, y, age: CGFloat
}

struct InningsScore: Equatable {
    var runs = 0
    var wickets = 0
    var balls = 0
    var fours = 0
    var sixes = 0

    var oversText: String { "\(balls / 6).\(balls % 6)" }
    var scoreText: String { "\(runs)/\(wickets)" }
}

final class MatchModel: ObservableObject {
    // MARK: - Flow
    @Published var phase: MatchPhase = .hub
    @Published var format: MatchFormat = .t5
    @Published var homeTeamId = "ind"
    @Published var awayTeamId = "aus"
    @Published var playerBatsFirst = true
    @Published var selectedShot: ShotDirection = .cover
    @Published var bowlLine: CGFloat = 0 // -1 leg ... +1 off
    @Published var bowlLength: CGFloat = 0.55 // 0 full ... 1 short
    @Published var bowlPower: CGFloat = 0.7

    // MARK: - Match state
    private(set) var inningsIndex = 0 // 0 first, 1 second
    private(set) var firstInnings = InningsScore()
    private(set) var secondInnings = InningsScore()
    private(set) var target: Int? = nil
    private(set) var role: PlayerRole = .batting
    private(set) var highScore = UserDefaults.standard.integer(forKey: "ArenaCricketHS")
    private(set) var wins = UserDefaults.standard.integer(forKey: "ArenaCricketWins")
    private(set) var matchResultText = ""
    private(set) var isNewBest = false

    // Active innings helpers
    var active: InningsScore {
        get { inningsIndex == 0 ? firstInnings : secondInnings }
        set {
            if inningsIndex == 0 { firstInnings = newValue } else { secondInnings = newValue }
        }
    }

    var battingTeam: CricketTeam {
        let batFirst = playerBatsFirst ? homeTeam : awayTeam
        let batSecond = playerBatsFirst ? awayTeam : homeTeam
        return inningsIndex == 0 ? batFirst : batSecond
    }

    var bowlingTeam: CricketTeam {
        let bowlFirst = playerBatsFirst ? awayTeam : homeTeam
        let bowlSecond = playerBatsFirst ? homeTeam : awayTeam
        return inningsIndex == 0 ? bowlFirst : bowlSecond
    }

    var homeTeam: CricketTeam { TeamLibrary.team(id: homeTeamId) }
    var awayTeam: CricketTeam { TeamLibrary.team(id: awayTeamId) }

    var maxOvers: Int { format.overs }
    var maxBalls: Int { format.overs * 6 }
    var maxWickets: Int { format.wickets }

    var scoreText: String { active.scoreText }
    var oversText: String { active.oversText }
    var requiredText: String? {
        guard let target, inningsIndex == 1 else { return nil }
        let need = max(0, target - active.runs)
        let ballsLeft = max(0, maxBalls - active.balls)
        return "NEED \(need) OFF \(ballsLeft)"
    }

    // MARK: - Delivery visuals
    private(set) var delivery: DeliveryState = .idle
    private(set) var ballT: CGFloat = 0
    private(set) var ballX: CGFloat = 0
    private(set) var ballY: CGFloat = 0
    private(set) var ballVX: CGFloat = 0
    private(set) var ballVY: CGFloat = 0
    private(set) var ballSpeed: CGFloat = 1
    private(set) var ballLine: CGFloat = 0
    private(set) var ballSpin: CGFloat = 0
    private(set) var ballScale: CGFloat = 1
    private(set) var ballShadowScale: CGFloat = 1
    private(set) var ballShadowY: CGFloat = 0
    private(set) var showBall = false
    private(set) var trail: [BallTrailPoint] = []
    private(set) var swingAngle: CGFloat = 0
    private(set) var swinging = false
    private(set) var useSwingPose = false
    private(set) var lastResult: ShotResult?
    private(set) var resultTimer: CGFloat = 0
    private(set) var toast = ""
    private(set) var toastLife: CGFloat = 0
    private(set) var timingHint: CGFloat = 0
    private(set) var bowlWindup: CGFloat = 0
    private(set) var particles: [Particle] = []
    private(set) var crowdPulse: CGFloat = 0
    private(set) var cameraShake: CGFloat = 0
    private(set) var boundaryFlash: CGFloat = 0
    private(set) var bounceDust: CGFloat = 0
    private(set) var streak = 0
    private(set) var commentary = "Welcome to Arena Cricket"

    private let sweetSpot: CGFloat = 0.78
    private var size: CGSize = .zero
    private var lastTick: TimeInterval?
    private var nextBowlDelay: CGFloat = 0
    private var swingCooldown: CGFloat = 0
    private var hasSwungThisBall = false
    private var bounceEmitted = false
    private var secondBounceEmitted = false
    private var boundarySide: CGFloat = 1
    private var poseRelax: CGFloat = 0
    private var aiAutoTimer: CGFloat = 0

    private(set) var pitchTop: CGFloat = 0
    private(set) var pitchBottom: CGFloat = 0
    private(set) var batsmanX: CGFloat = 0
    private(set) var batsmanY: CGFloat = 0
    private(set) var bowlerX: CGFloat = 0
    private(set) var bowlerY: CGFloat = 0
    private(set) var groundY: CGFloat = 0

    // MARK: - Hub actions

    func openSetup() {
        phase = .setup
        objectWillChange.send()
    }

    func backToHub() {
        phase = .hub
        delivery = .idle
        showBall = false
        objectWillChange.send()
    }

    func goToss() {
        phase = .toss
        objectWillChange.send()
        playSound(1104)
    }

    func chooseBatFirst(_ bat: Bool) {
        playerBatsFirst = bat
        startMatch()
    }

    func startMatch() {
        firstInnings = InningsScore()
        secondInnings = InningsScore()
        inningsIndex = 0
        target = nil
        role = playerBatsFirst ? .batting : .bowling
        streak = 0
        matchResultText = ""
        isNewBest = false
        lastResult = nil
        delivery = .idle
        nextBowlDelay = 1.0
        toast = role == .batting ? "YOU'RE BATTING" : "YOU'RE BOWLING"
        toastLife = 1.5
        commentary = "\(battingTeam.short) elect to \(role == .batting && playerBatsFirst || role == .bowling && !playerBatsFirst ? "bat" : "field"). Let's play!"
        particles.removeAll()
        trail.removeAll()
        showBall = false
        useSwingPose = false
        phase = .playing
        objectWillChange.send()
        playSound(1110)
        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
    }

    func togglePause() {
        if phase == .playing {
            phase = .paused
            lastTick = nil
        } else if phase == .paused {
            phase = .playing
        }
        objectWillChange.send()
    }

    func continueAfterBreak() {
        // Start second innings
        inningsIndex = 1
        role = playerBatsFirst ? .bowling : .batting
        // target = first innings + 1
        target = firstInnings.runs + 1
        delivery = .idle
        nextBowlDelay = 1.0
        toast = role == .batting ? "CHASE \(target!)" : "DEFEND \(firstInnings.runs)"
        toastLife = 1.6
        commentary = "Target \(target!). \(battingTeam.short) need \(target!) to win."
        showBall = false
        lastResult = nil
        streak = 0
        phase = .playing
        objectWillChange.send()
    }

    func configure(size: CGSize) {
        guard size.width > 0, size.height > 0 else { return }
        self.size = size
        pitchTop = size.height * 0.36
        pitchBottom = size.height * 0.76
        groundY = pitchBottom + 10
        batsmanX = size.width * 0.50
        batsmanY = pitchBottom + 6
        bowlerX = size.width * 0.50
        bowlerY = pitchTop + 8
    }

    // MARK: - Input

    func swing() {
        guard phase == .playing, role == .batting else { return }
        guard delivery == .inFlight else {
            swingAngle = -0.4
            swinging = true
            useSwingPose = true
            swingCooldown = 0.15
            return
        }
        guard !hasSwungThisBall, swingCooldown <= 0 else { return }
        hasSwungThisBall = true
        swinging = true
        useSwingPose = true
        swingAngle = -1.0
        swingCooldown = 0.2

        let delta = ballT - sweetSpot
        timingHint = delta
        let absD = abs(delta)
        // Line vs shot: wrong line reduces quality
        let lineError = abs(ballLine - shotLineBias(selectedShot))
        let skill = absD + lineError * 0.08

        var result: ShotResult
        if skill <= 0.032 {
            result = Double.random(in: 0...1) < 0.5 ? .six : .four
        } else if skill <= 0.065 {
            result = Double.random(in: 0...1) < 0.55 ? .four : .two
        } else if skill <= 0.1 {
            result = Double.random(in: 0...1) < 0.55 ? .two : .one
        } else if skill <= 0.14 {
            result = .dot
        } else if skill <= 0.19 {
            result = .miss
        } else if delta > 0.1 {
            result = Double.random(in: 0...1) < 0.55 ? .outBowled : .outLBW
        } else {
            // Early mistime → catch risk by shot area
            let catchChance = selectedShot.aerialRisk * (0.45 + Double(ballSpeed - 0.8))
            result = Double.random(in: 0...1) < catchChance ? .outCatch : .miss
        }

        // Pace bonus risk
        if ballSpeed > 1.3 && skill > 0.09 && result == .miss, Double.random(in: 0...1) < 0.35 {
            result = .outCatch
        }

        applyResult(result)
    }

    /// Deliver as bowler (after setting line/length/power).
    func deliverBall() {
        guard phase == .playing, role == .bowling, delivery == .idle || delivery == .resultHold else { return }
        if delivery == .resultHold { return }
        // Convert UI bowls into ball params
        ballSpeed = 0.85 + bowlPower * 0.7
        ballLine = bowlLine * 0.7
        // length affects bounce timing subtly via speed
        ballSpeed *= 0.9 + bowlLength * 0.2
        startDelivery(fromPlayerBowl: true)
    }

    private func shotLineBias(_ shot: ShotDirection) -> CGFloat {
        switch shot {
        case .fineLeg, .squareLeg, .midwicket: return -0.45
        case .longOn, .straight, .longOff: return 0
        case .cover, .point, .thirdMan: return 0.45
        }
    }

    // MARK: - Update loop

    func update(now: TimeInterval) {
        guard phase == .playing || phase == .hub || phase == .setup || phase == .toss else {
            lastTick = now
            return
        }
        let dt = deltaTime(now: now)
        crowdPulse = 0.5 + 0.5 * sin(now * 3)
        if cameraShake > 0 { cameraShake = max(0, cameraShake - dt * 5) }
        if boundaryFlash > 0 { boundaryFlash = max(0, boundaryFlash - dt * 1.8) }
        if bounceDust > 0 { bounceDust = max(0, bounceDust - dt * 3) }
        updateParticles(dt: dt)
        updateTrail(dt: dt)
        if toastLife > 0 { toastLife = max(0, toastLife - dt) }
        if swingCooldown > 0 { swingCooldown = max(0, swingCooldown - dt) }

        if swinging {
            swingAngle += dt * 5.5
            if swingAngle > 0.2 { swinging = false }
        }
        if useSwingPose && !swinging && delivery != .boundaryFlight && delivery != .inFlight {
            poseRelax += dt
            if poseRelax > 0.35 { useSwingPose = false; poseRelax = 0 }
        } else if swinging || delivery == .boundaryFlight {
            poseRelax = 0
        }

        guard phase == .playing else {
            objectWillChange.send()
            return
        }

        switch delivery {
        case .idle:
            nextBowlDelay -= dt
            if nextBowlDelay <= 0 {
                if role == .batting {
                    // AI bowls
                    aiPrepareBowl()
                    startDelivery(fromPlayerBowl: false)
                }
                // if bowling, wait for player deliverBall()
            }
        case .bowling:
            bowlWindup += dt
            if bowlWindup >= 0.65 { releaseBall() }
        case .inFlight:
            ballT += dt * (0.78 * ballSpeed)
            updateBowlingBallPosition()
            ballSpin += dt * 14 * ballSpeed
            emitTrail()
            if !bounceEmitted && ballT >= 0.52 {
                bounceEmitted = true
                emitBounceDust()
                bounceDust = 1
            }
            if !secondBounceEmitted && ballT >= 0.78 {
                secondBounceEmitted = true
                emitBounceDust(small: true)
            }

            if role == .bowling {
                // AI bats automatically near sweet spot
                aiAutoTimer += dt
                if !hasSwungThisBall && ballT > sweetSpot - 0.05 {
                    aiBat()
                }
            }

            if ballT >= 1.08 && !hasSwungThisBall {
                if role == .batting {
                    applyResult(Double.random(in: 0...1) < 0.3 ? .outBowled : .dot)
                } else {
                    // AI left alone
                    applyResult(.dot)
                }
            } else if ballT >= 1.08, lastResult == nil {
                applyResult(.miss)
            }
        case .boundaryFlight:
            updateBoundaryBall(dt: dt)
        case .resultHold:
            resultTimer -= dt
            if resultTimer <= 0 {
                advanceAfterBall()
            }
        }

        objectWillChange.send()
    }

    // MARK: - AI

    private func aiPrepareBowl() {
        let skill = bowlingTeam.bowlSkill
        bowlPower = CGFloat(0.55 + skill * 0.4 + Double.random(in: -0.1...0.15))
        bowlLine = CGFloat.random(in: -0.55...0.55)
        bowlLength = CGFloat.random(in: 0.35...0.85)
        ballSpeed = 0.9 + bowlPower * 0.65
        ballLine = bowlLine * 0.75
    }

    private func aiBat() {
        hasSwungThisBall = true
        swinging = true
        useSwingPose = true
        let skill = battingTeam.batSkill
        // Timing error based on skill and bowl quality
        let difficulty = Double(ballSpeed) * 0.12 + abs(Double(ballLine)) * 0.08
        let error = max(0, (1.0 - skill) * 0.22 + difficulty * 0.15 + Double.random(in: -0.03...0.08))
        let result: ShotResult
        if error < 0.04 {
            result = Double.random(in: 0...1) < 0.4 ? .six : .four
        } else if error < 0.08 {
            result = Double.random(in: 0...1) < 0.45 ? .four : .two
        } else if error < 0.12 {
            result = Double.random(in: 0...1) < 0.5 ? .two : .one
        } else if error < 0.17 {
            result = .dot
        } else if error < 0.22 {
            result = Double.random(in: 0...1) < 0.4 ? .outCatch : .miss
        } else {
            result = [.outBowled, .outCatch, .outLBW].randomElement()!
        }
        // Player bowling skill nudges AI down
        if role == .bowling && bowlPower > 0.8 && Double.random(in: 0...1) < 0.12 {
            if !result.isWicket && result.runs >= 4 {
                applyResult(.outCatch)
                return
            }
        }
        applyResult(result)
    }

    // MARK: - Delivery physics

    private func startDelivery(fromPlayerBowl: Bool) {
        delivery = .bowling
        bowlWindup = 0
        ballT = 0
        hasSwungThisBall = false
        lastResult = nil
        bounceEmitted = false
        secondBounceEmitted = false
        if !fromPlayerBowl {
            // already set by aiPrepareBowl
        } else {
            ballSpeed = 0.85 + bowlPower * 0.7
            ballLine = bowlLine * 0.7
        }
        ballX = bowlerX + 6
        ballY = bowlerY - 18
        ballScale = 0.3
        showBall = false
        trail.removeAll()
        useSwingPose = false
        commentary = role == .batting
            ? "\(bowlingTeam.short) running in…"
            : "You run in — line \(String(format: "%.0f", (bowlLine + 1) * 50)) · power \(Int(bowlPower * 100))%"
        playSound(1103)
    }

    private func releaseBall() {
        delivery = .inFlight
        ballT = 0
        showBall = true
        updateBowlingBallPosition()
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }

    private func updateBowlingBallPosition() {
        let t = max(0, min(1.2, ballT))
        let start = CGPoint(x: bowlerX + 6, y: bowlerY - 18)
        let end = CGPoint(x: batsmanX + ballLine * size.width * 0.06, y: batsmanY - 52)
        let u = min(1, t)
        let o = 1 - u
        let mid = CGPoint(x: (start.x + end.x) * 0.5 + ballLine * 12, y: (start.y + end.y) * 0.52)
        ballX = o * o * start.x + 2 * o * u * mid.x + u * u * end.x
        var y = o * o * start.y + 2 * o * u * mid.y + u * u * end.y
        if t < 0.48 {
            y -= sin((t / 0.48) * .pi) * 36
        } else if t < 0.85 {
            let t2 = (t - 0.48) / 0.37
            y -= sin(min(1, t2) * .pi) * 16 * max(0, 1 - t2 * 0.85)
        }
        ballY = y
        ballScale = 0.28 + 0.95 * min(1, t)
        let surfaceY = start.y + (pitchBottom - 28 - start.y) * min(1, t)
        ballShadowY = surfaceY
        let heightOff = max(0, surfaceY - ballY)
        ballShadowScale = max(0.18, (0.7 - heightOff / 140)) * ballScale
    }

    private func applyResult(_ result: ShotResult) {
        guard delivery == .inFlight || delivery == .bowling else { return }
        lastResult = result
        var inn = active
        inn.balls += 1
        inn.runs += result.runs
        if result == .four { inn.fours += 1 }
        if result == .six { inn.sixes += 1 }
        if result.isWicket { inn.wickets += 1 }
        active = inn

        toast = result.label
        toastLife = 1.05
        commentary = makeCommentary(result)

        switch result {
        case .six:
            streak += 1
            launchBoundary(isSix: true)
            playSound(1025)
            UINotificationFeedbackGenerator().notificationOccurred(.success)
        case .four:
            streak += 1
            launchBoundary(isSix: false)
            playSound(1111)
            UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
        case .two, .one:
            streak += 1
            launchShortHit(runs: result.runs)
            playSound(1105)
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
        case .dot, .miss:
            streak = 0
            delivery = .resultHold
            resultTimer = 0.7
            playSound(1103)
        case .outBowled, .outCatch, .outLBW:
            streak = 0
            delivery = .resultHold
            resultTimer = 1.15
            cameraShake = 0.95
            emitWicketBurst()
            playSound(1053)
            UINotificationFeedbackGenerator().notificationOccurred(.error)
        }
    }

    private func makeCommentary(_ r: ShotResult) -> String {
        switch r {
        case .six: return "Massive! \(selectedShot.label) into the crowd!"
        case .four: return "Cracking shot through \(selectedShot.label)!"
        case .two: return "Good running, they pick up two."
        case .one: return "Pushed for a single."
        case .dot: return "Dot ball. Pressure builds."
        case .miss: return "Beaten all ends up!"
        case .outBowled: return "Timber! Clean bowled!"
        case .outCatch: return "Taken in the deep! Soft dismissal."
        case .outLBW: return "Trapped! That's plumb LBW!"
        }
    }

    private func advanceAfterBall() {
        // Check innings / match end
        if shouldEndInnings() {
            endInnings()
            return
        }
        delivery = .idle
        nextBowlDelay = role == .batting ? 0.55 : 0.35
        lastResult = nil
        showBall = false
        trail.removeAll()
        useSwingPose = false
    }

    private func shouldEndInnings() -> Bool {
        if active.wickets >= maxWickets { return true }
        if active.balls >= maxBalls { return true }
        if let target, inningsIndex == 1, active.runs >= target { return true }
        return false
    }

    private func endInnings() {
        showBall = false
        delivery = .idle
        if inningsIndex == 0 {
            phase = .inningsBreak
            commentary = "Innings break. \(firstInnings.scoreText) in \(firstInnings.oversText) overs. Target \(firstInnings.runs + 1)."
            toast = "INNINGS BREAK"
            toastLife = 2
        } else {
            finishMatch()
        }
        objectWillChange.send()
    }

    private func finishMatch() {
        phase = .matchOver
        // Home is always the player's team.
        let homeRuns = playerBatsFirst ? firstInnings.runs : secondInnings.runs
        let awayRuns = playerBatsFirst ? secondInnings.runs : firstInnings.runs
        isNewBest = homeRuns > highScore
        if isNewBest {
            highScore = homeRuns
            UserDefaults.standard.set(highScore, forKey: "ArenaCricketHS")
        }

        if homeRuns > awayRuns {
            wins += 1
            UserDefaults.standard.set(wins, forKey: "ArenaCricketWins")
            matchResultText = "YOU WIN!"
            let margin = homeRuns - awayRuns
            commentary = "\(homeTeam.name) win by \(margin) runs!"
        } else if homeRuns < awayRuns {
            matchResultText = "YOU LOSE"
            commentary = "\(awayTeam.name) chase it down."
        } else {
            matchResultText = "TIE!"
            commentary = "Scores level — super thriller!"
        }

        toast = matchResultText
        toastLife = 2.5
        playSound(matchResultText.contains("WIN") ? 1025 : 1110)
        objectWillChange.send()
    }

    // MARK: - Boundary physics (same as before, condensed)

    private func launchBoundary(isSix: Bool) {
        delivery = .boundaryFlight
        useSwingPose = true
        cameraShake = isSix ? 1.1 : 0.7
        boundaryFlash = isSix ? 1.0 : 0.7
        boundarySide = isSix ? 0 : (selectedShot.angle > 0 ? 1 : -1)
        if abs(boundarySide) < 0.1 { boundarySide = Bool.random() ? 1 : -1 }

        for _ in 0..<(isSix ? 28 : 18) {
            let a = CGFloat.random(in: -.pi...0)
            let s = CGFloat.random(in: 120...340)
            particles.append(Particle(
                x: ballX, y: ballY,
                vx: cos(a) * s, vy: sin(a) * s,
                life: .random(in: 0.35...0.8), maxLife: 0.8, size: .random(in: 2...5),
                color: isSix ? SIMD3(1, 0.85, 0.2) : SIMD3(0.5, 0.95, 1)
            ))
        }
        if isSix {
            ballVX = CGFloat.random(in: -100...100)
            ballVY = -700
            resultTimer = 1.65
        } else {
            ballVX = boundarySide * CGFloat.random(in: 520...700)
            ballVY = -140
            resultTimer = 1.3
        }
        ballScale = max(0.9, ballScale)
    }

    private func launchShortHit(runs: Int) {
        delivery = .boundaryFlight
        useSwingPose = true
        let dir: CGFloat = selectedShot.angle > 0 ? 1 : -1
        ballVX = dir * (runs == 2 ? 280 : 180)
        ballVY = -120
        resultTimer = 0.85
        cameraShake = 0.25
    }

    private func updateBoundaryBall(dt: CGFloat) {
        guard showBall else { return }
        ballVX *= 0.995
        ballVY += 980 * dt
        ballX += ballVX * dt
        ballY += ballVY * dt
        ballSpin += dt * (12 + abs(ballVX) * 0.02)
        emitTrail()
        let floor = groundY - 24
        if ballY > floor && ballVY > 0 {
            ballY = floor
            if lastResult == .six {
                finishBoundary(); return
            }
            ballVY *= -0.45
            ballVX *= 0.88
            emitBounceDust(small: abs(ballVY) < 120)
            bounceDust = 0.8
            if abs(ballVY) < 90 { ballVY = 0 }
        }
        if lastResult == .six {
            ballScale = max(0.25, ballScale - dt * 0.55)
        } else {
            ballScale = max(0.35, 1.0 - abs(ballX - batsmanX) / (size.width * 1.1))
        }
        ballShadowY = floor + 4
        ballShadowScale = ballScale * 0.7

        let offX = ballX < -40 || ballX > size.width + 40
        let offTop = ballY < -60
        let fourDone = lastResult == .four && (offX || abs(ballX - batsmanX) > size.width * 0.48)
        let sixDone = lastResult == .six && (offTop || (ballY < size.height * 0.12 && ballVY > 0))
        let shortDone = (lastResult == .one || lastResult == .two) && ((abs(ballVX) < 40 && ballVY == 0) || offX)
        if fourDone || sixDone || shortDone {
            if lastResult?.isBoundary == true {
                boundaryFlash = 1
                cameraShake = lastResult == .six ? 0.8 : 0.5
            }
            finishBoundary()
        }
        resultTimer -= dt
        if resultTimer <= 0 { finishBoundary() }
    }

    private func finishBoundary() {
        delivery = .resultHold
        resultTimer = lastResult?.isBoundary == true ? 0.65 : 0.4
    }

    private func emitBounceDust(small: Bool = false) {
        for _ in 0..<(small ? 6 : 14) {
            particles.append(Particle(
                x: ballX + .random(in: -6...6), y: max(ballY, pitchTop + 50),
                vx: .random(in: -50...50), vy: .random(in: -40...(-5)),
                life: 0.35, maxLife: 0.35, size: small ? 2 : 3.5,
                color: SIMD3(0.75, 0.62, 0.4)
            ))
        }
    }

    private func emitWicketBurst() {
        for _ in 0..<28 {
            particles.append(Particle(
                x: batsmanX, y: batsmanY - 40,
                vx: .random(in: -200...200), vy: .random(in: -280...(-30)),
                life: 0.85, maxLife: 0.85, size: .random(in: 2...6),
                color: SIMD3(0.95, 0.85, 0.55)
            ))
        }
    }

    private func emitTrail() {
        guard showBall else { return }
        trail.append(BallTrailPoint(x: ballX, y: ballY, age: 0))
        if trail.count > 18 { trail.removeFirst(trail.count - 18) }
    }

    private func updateTrail(dt: CGFloat) {
        for i in trail.indices { trail[i].age += dt }
        trail.removeAll { $0.age > 0.25 }
    }

    private func updateParticles(dt: CGFloat) {
        for i in particles.indices {
            particles[i].x += particles[i].vx * dt
            particles[i].y += particles[i].vy * dt
            particles[i].vy += 260 * dt
            particles[i].life -= dt
        }
        particles.removeAll { $0.life <= 0 }
        if particles.count > 160 { particles.removeFirst(particles.count - 160) }
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

    private func playSound(_ id: SystemSoundID) {
        AudioServicesPlaySystemSound(id)
    }
}
