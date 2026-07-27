import SwiftUI

/// Arena Cricket — original Real-Cricket-style match loop (not affiliated with KRAFTON/Real Cricket™).
struct MatchContainerView: View {
    @StateObject private var model = MatchModel()
    @State private var pulse = false

    var body: some View {
        GeometryReader { geo in
            let size = geo.size
            ZStack {
                // 3D world (360° orbit camera)
                if model.phase == .playing || model.phase == .paused || model.phase == .inningsBreak || model.phase == .matchOver {
                    Cricket3DView(model: model)
                        .ignoresSafeArea()
                } else {
                    stadiumBackdrop
                }

                DisplayLinkHost { t in
                    model.configure(size: size)
                    model.update(now: t)
                }
                .frame(width: 0, height: 0)
                .allowsHitTesting(false)

                // HUD captures controls; 3D view handles orbit + bat tap
                overlay
                    .zIndex(20)
            }
            .onAppear {
                model.configure(size: size)
                withAnimation(.easeInOut(duration: 1.1).repeatForever(autoreverses: true)) {
                    pulse = true
                }
            }
            .onChange(of: size) { newSize in
                model.configure(size: newSize)
            }
        }
        .background(Color.black)
    }

    private var stadiumBackdrop: some View {
        ZStack {
            Image("StadiumBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Color.black.opacity(0.55).ignoresSafeArea()
        }
    }

    @ViewBuilder
    private var overlay: some View {
        switch model.phase {
        case .hub: hub
        case .setup: setup
        case .toss: toss
        case .playing: playingHUD
        case .paused: paused
        case .inningsBreak: inningsBreak
        case .matchOver: matchOver
        }
    }

    // MARK: - Hub (RC-style)

    private var hub: some View {
        VStack(spacing: 18) {
            Spacer().frame(height: 56)
            Text("ARENA")
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .tracking(8)
                .foregroundStyle(.white.opacity(0.6))
            Text("CRICKET")
                .font(.system(size: 48, weight: .black, design: .rounded))
                .foregroundStyle(LinearGradient(colors: [.green, .yellow, .orange], startPoint: .leading, endPoint: .trailing))
                .shadow(color: .green.opacity(0.4), radius: 16)

            Text("3D Stadium · 360° camera · Shot map · Bowl & chase")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.7))

            HStack(spacing: 12) {
                statPill("WINS", "\(model.wins)")
                statPill("BEST", "\(model.highScore)")
            }

            Spacer()

            bigButton("QUICK MATCH", accent: true) { model.openSetup() }
                .scaleEffect(pulse ? 1.03 : 1.0)

            Text("Original game — not affiliated with Real Cricket™ / KRAFTON")
                .font(.system(size: 10, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.35))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
                .padding(.bottom, 28)
        }
        .padding(.horizontal, 22)
    }

    // MARK: - Setup

    private var setup: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Button("Back") { model.backToHub() }
                        .foregroundStyle(.white.opacity(0.7))
                    Spacer()
                    Text("MATCH SETUP")
                        .font(.system(size: 14, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                    Spacer()
                    Color.clear.frame(width: 40)
                }
                .padding(.top, 50)

                section("FORMAT")
                HStack(spacing: 8) {
                    ForEach(MatchFormat.allCases) { f in
                        formatChip(f)
                    }
                }

                section("YOUR TEAM")
                teamGrid(selected: model.homeTeamId) { model.homeTeamId = $0 }

                section("OPPONENT")
                teamGrid(selected: model.awayTeamId) { model.awayTeamId = $0 }

                bigButton("TOSS", accent: true) {
                    if model.homeTeamId == model.awayTeamId {
                        // force different
                        if let other = TeamLibrary.all.first(where: { $0.id != model.homeTeamId }) {
                            model.awayTeamId = other.id
                        }
                    }
                    model.goToss()
                }
                .padding(.vertical, 12)
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 40)
        }
    }

    // MARK: - Toss

    private var toss: some View {
        VStack(spacing: 18) {
            Spacer()
            Text("TOSS")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .tracking(4)
                .foregroundStyle(.white.opacity(0.6))
            Text("\(model.homeTeam.short) vs \(model.awayTeam.short)")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundStyle(.white)
            Text(model.format.rawValue + " · " + model.format.blurb)
                .foregroundStyle(.white.opacity(0.55))

            VStack(spacing: 12) {
                bigButton("BAT FIRST", accent: true) { model.chooseBatFirst(true) }
                bigButton("BOWL FIRST", accent: false) { model.chooseBatFirst(false) }
            }
            .padding(.top, 12)
            Spacer()
        }
        .padding(24)
    }

    // MARK: - Playing HUD

    private var playingHUD: some View {
        VStack(spacing: 0) {
            // Broadcast scorebar
            HStack(spacing: 10) {
                teamBadge(model.battingTeam)
                VStack(alignment: .leading, spacing: 1) {
                    Text(model.scoreText)
                        .font(.system(size: 22, weight: .black, design: .rounded))
                        .foregroundStyle(.white)
                        .monospacedDigit()
                    Text("\(model.oversText) ov")
                        .font(.system(size: 11, weight: .bold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.55))
                }
                Spacer()
                if let req = model.requiredText {
                    Text(req)
                        .font(.system(size: 11, weight: .heavy, design: .rounded))
                        .foregroundStyle(.yellow)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 5)
                        .background(Color.black.opacity(0.35), in: Capsule())
                }
                Button { model.togglePause() } label: {
                    Image(systemName: "pause.fill")
                        .foregroundStyle(.white)
                        .frame(width: 40, height: 40)
                        .background(.ultraThinMaterial, in: Circle())
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 14)
            .padding(.top, 50)
            .padding(.bottom, 8)
            .background(Color.black.opacity(0.35))

            // Commentary strip
            Text(model.commentary)
                .font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.85))
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(Color.black.opacity(0.25))

            if model.toastLife > 0 {
                Text(model.toast)
                    .font(.system(size: 22, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        LinearGradient(colors: [.orange.opacity(0.75), .red.opacity(0.55)], startPoint: .leading, endPoint: .trailing),
                        in: Capsule()
                    )
                    .padding(.top, 10)
            }

            // Transparent center — orbit / bat tap reaches SceneKit
            Spacer()
                .allowsHitTesting(false)

            // Camera help
            Text("DRAG = 360° look  ·  PINCH = zoom  ·  TAP = shot")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.55))
                .padding(.bottom, 4)
                .allowsHitTesting(false)

            if model.role == .batting {
                shotMap
                Text(model.delivery == .inFlight ? "TAP FIELD TO TIME SHOT" : "PICK SHOT · WAIT FOR BALL")
                    .font(.system(size: 12, weight: .heavy, design: .rounded))
                    .foregroundStyle(.white.opacity(0.55))
                    .padding(.bottom, 10)
                    .allowsHitTesting(false)
            } else {
                bowlingControls
            }
        }
    }

    private var shotMap: some View {
        VStack(spacing: 8) {
            Text("SHOT MAP · \(model.selectedShot.label)")
                .font(.system(size: 11, weight: .black, design: .rounded))
                .foregroundStyle(.white.opacity(0.7))

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 3), spacing: 6) {
                ForEach(ShotDirection.allCases) { shot in
                    Button {
                        model.selectedShot = shot
                    } label: {
                        Text(shot.label)
                            .font(.system(size: 10, weight: .bold, design: .rounded))
                            .foregroundStyle(model.selectedShot == shot ? .black : .white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(
                                model.selectedShot == shot
                                ? AnyShapeStyle(LinearGradient(colors: [.green, .yellow], startPoint: .leading, endPoint: .trailing))
                                : AnyShapeStyle(Color.white.opacity(0.12)),
                                in: RoundedRectangle(cornerRadius: 10, style: .continuous)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 28)
        }
        .padding(.top, 6)
        .background(
            LinearGradient(colors: [Color.black.opacity(0.05), Color.black.opacity(0.55)], startPoint: .top, endPoint: .bottom)
        )
    }

    private var bowlingControls: some View {
        VStack(spacing: 12) {
            Text("BOWLING · Line & Length")
                .font(.system(size: 11, weight: .black, design: .rounded))
                .foregroundStyle(.white.opacity(0.7))

            HStack {
                Text("LEG").font(.caption2).foregroundStyle(.white.opacity(0.5))
                Slider(value: $model.bowlLine, in: -1...1)
                    .tint(.orange)
                Text("OFF").font(.caption2).foregroundStyle(.white.opacity(0.5))
            }
            .padding(.horizontal, 16)

            HStack {
                Text("FULL").font(.caption2).foregroundStyle(.white.opacity(0.5))
                Slider(value: $model.bowlLength, in: 0...1)
                    .tint(.cyan)
                Text("SHORT").font(.caption2).foregroundStyle(.white.opacity(0.5))
            }
            .padding(.horizontal, 16)

            HStack {
                Text("POWER").font(.caption2).foregroundStyle(.white.opacity(0.5))
                Slider(value: $model.bowlPower, in: 0.35...1)
                    .tint(.red)
            }
            .padding(.horizontal, 16)

            Button {
                model.deliverBall()
            } label: {
                Text(model.delivery == .idle ? "DELIVER BALL" : "WAIT…")
                    .font(.system(size: 16, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                    .frame(maxWidth: 260)
                    .padding(.vertical, 14)
                    .background(
                        LinearGradient(colors: [.cyan, .blue], startPoint: .leading, endPoint: .trailing),
                        in: RoundedRectangle(cornerRadius: 16, style: .continuous)
                    )
            }
            .buttonStyle(.plain)
            .disabled(model.delivery != .idle)
            .opacity(model.delivery == .idle ? 1 : 0.5)
            .padding(.bottom, 28)
        }
        .padding(.top, 8)
        .background(Color.black.opacity(0.5))
    }

    // MARK: - Break / Over

    private var paused: some View {
        ZStack {
            Color.black.opacity(0.55).ignoresSafeArea()
            VStack(spacing: 14) {
                Text("PAUSED").font(.system(size: 30, weight: .black, design: .rounded)).foregroundStyle(.white)
                Text("\(model.battingTeam.short) \(model.scoreText)")
                    .foregroundStyle(.white.opacity(0.65))
                bigButton("RESUME", accent: true) { model.togglePause() }
                bigButton("ABANDON", accent: false) { model.backToHub() }
            }
            .padding(24)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
            .padding(24)
        }
    }

    private var inningsBreak: some View {
        ZStack {
            Color.black.opacity(0.6).ignoresSafeArea()
            VStack(spacing: 14) {
                Text("INNINGS BREAK")
                    .font(.system(size: 24, weight: .black, design: .rounded))
                    .foregroundStyle(.yellow)
                Text(model.firstInnings.scoreText)
                    .font(.system(size: 44, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                Text("\(model.firstInnings.oversText) overs · \(model.firstInnings.fours)×4 · \(model.firstInnings.sixes)×6")
                    .foregroundStyle(.white.opacity(0.55))
                Text("TARGET \(model.firstInnings.runs + 1)")
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .foregroundStyle(.orange)
                    .padding(.top, 4)
                bigButton(model.playerBatsFirst ? "GO DEFEND" : "GO CHASE", accent: true) {
                    model.continueAfterBreak()
                }
            }
            .padding(24)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 22, style: .continuous))
            .padding(24)
        }
    }

    private var matchOver: some View {
        ZStack {
            Color.black.opacity(0.65).ignoresSafeArea()
            VStack(spacing: 12) {
                Text(model.matchResultText)
                    .font(.system(size: 32, weight: .black, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing)
                    )
                scoreCardRow(model.homeTeam.short, model.playerBatsFirst ? model.firstInnings : model.secondInnings)
                scoreCardRow(model.awayTeam.short, model.playerBatsFirst ? model.secondInnings : model.firstInnings)
                Text(model.commentary)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundStyle(.white.opacity(0.65))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                if model.isNewBest {
                    Text("NEW BEST SCORE \(model.highScore)")
                        .font(.system(size: 12, weight: .black, design: .rounded))
                        .foregroundStyle(.black)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color.yellow, in: Capsule())
                }
                bigButton("REMATCH", accent: true) { model.openSetup() }
                bigButton("HOME", accent: false) { model.backToHub() }
            }
            .padding(22)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(20)
        }
    }

    // MARK: - UI bits

    private func scoreCardRow(_ name: String, _ inn: InningsScore) -> some View {
        HStack {
            Text(name).font(.system(size: 16, weight: .heavy, design: .rounded)).foregroundStyle(.white)
            Spacer()
            Text(inn.scoreText)
                .font(.system(size: 18, weight: .black, design: .rounded))
                .foregroundStyle(.white)
                .monospacedDigit()
            Text("(\(inn.oversText))")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.5))
        }
        .padding(.horizontal, 8)
    }

    private func teamBadge(_ team: CricketTeam) -> some View {
        Text(team.short)
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .background(team.primary, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
    }

    private func section(_ t: String) -> some View {
        Text(t)
            .font(.system(size: 12, weight: .black, design: .rounded))
            .foregroundStyle(.white.opacity(0.5))
            .padding(.top, 8)
    }

    private func formatChip(_ f: MatchFormat) -> some View {
        Button {
            model.format = f
        } label: {
            VStack(spacing: 4) {
                Text(f.rawValue).font(.system(size: 13, weight: .black, design: .rounded))
                Text(f.blurb).font(.system(size: 9, weight: .medium, design: .rounded)).opacity(0.7)
            }
            .foregroundStyle(model.format == f ? .black : .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(
                model.format == f
                ? AnyShapeStyle(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                : AnyShapeStyle(Color.white.opacity(0.12)),
                in: RoundedRectangle(cornerRadius: 12, style: .continuous)
            )
        }
        .buttonStyle(.plain)
    }

    private func teamGrid(selected: String, onPick: @escaping (String) -> Void) -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
            ForEach(TeamLibrary.all) { team in
                Button {
                    onPick(team.id)
                } label: {
                    HStack {
                        Circle().fill(team.primary).frame(width: 14, height: 14)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(team.short).font(.system(size: 14, weight: .black, design: .rounded))
                            Text(team.name).font(.system(size: 10, weight: .medium, design: .rounded)).opacity(0.7)
                        }
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .strokeBorder(selected == team.id ? team.primary : .white.opacity(0.15), lineWidth: selected == team.id ? 2 : 1)
                            .background(Color.white.opacity(selected == team.id ? 0.12 : 0.06), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }

    private func statPill(_ title: String, _ value: String) -> some View {
        VStack(spacing: 2) {
            Text(title).font(.system(size: 10, weight: .bold, design: .rounded)).foregroundStyle(.white.opacity(0.45))
            Text(value).font(.system(size: 18, weight: .black, design: .rounded)).foregroundStyle(.white)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 10)
        .background(.ultraThinMaterial, in: Capsule())
    }

    private func bigButton(_ title: String, accent: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 17, weight: .heavy, design: .rounded))
                .foregroundStyle(accent ? .black : .white)
                .frame(maxWidth: 280)
                .padding(.vertical, 15)
                .background {
                    if accent {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(LinearGradient(colors: [.yellow, .orange], startPoint: .leading, endPoint: .trailing))
                    } else {
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .strokeBorder(.white.opacity(0.3), lineWidth: 1.2)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(.white.opacity(0.08)))
                    }
                }
        }
        .buttonStyle(.plain)
    }
}
