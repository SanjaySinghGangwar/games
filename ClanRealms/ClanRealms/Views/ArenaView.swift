import SwiftUI
import SpriteKit

struct ArenaView: View {
    @EnvironmentObject var progress: PlayerProgress
    let stage: ArenaStage
    let onClose: () -> Void

    @State private var scene: ArenaScene?
    @State private var bridge: ArenaBridge?
    @State private var hud = ArenaHUD(
        wellRatio: 1, riftRatio: 1, energy: 50, maxEnergy: 100,
        combo: 0, wave: 0, totalWaves: 1, timeLeft: 120,
        championHP: 1, championMaxHP: 1, ultimateReady: false,
        missionText: "Destroy ENEMY RIFT · Protect YOUR BASE"
    )
    @State private var result: ArenaResult?
    @State private var showResult = false
    @State private var showHelp = true

    var body: some View {
        GeometryReader { geo in
            ZStack {
                if let scene {
                    SpriteView(scene: scene)
                        .ignoresSafeArea()
                } else {
                    Color(red: 0.2, green: 0.35, blue: 0.25).ignoresSafeArea()
                }

                VStack(spacing: 6) {
                    topHUD
                    missionBanner
                    Spacer()
                    if showHelp {
                        helpCard
                    }
                    bottomControls
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)

                if showResult, let result {
                    resultCard(result)
                }
            }
            .onAppear { setup(size: geo.size) }
            .onChange(of: geo.size) { _, s in
                if scene == nil { setup(size: s) }
                else { scene?.size = s }
            }
        }
        .ignoresSafeArea()
        .statusBarHidden()
        .persistentSystemOverlays(.hidden)
    }

    private func setup(size: CGSize) {
        guard scene == nil, size.width > 20 else { return }
        let b = ArenaBridge(
            onUpdate: { hud = $0 },
            onEnd: { r in
                result = r
                withAnimation(.spring()) { showResult = true }
                progress.applyResult(stage: r.stage, stars: r.stars, loot: r.loot, combo: r.combo)
            }
        )
        bridge = b
        let s = ArenaScene(size: size)
        s.scaleMode = .resizeFill
        s.configure(stage: stage, champion: progress.selectedChampion, spirits: progress.unlockedSpirits)
        s.arenaDelegate = b
        scene = s

        // Auto-hide help after a few seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            withAnimation { showHelp = false }
        }
    }

    // MARK: - Clear HUD

    private var topHUD: some View {
        HStack(spacing: 10) {
            Button(action: onClose) {
                Label("Exit", systemImage: "xmark")
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(.black.opacity(0.55)))
            }

            VStack(alignment: .leading, spacing: 1) {
                Text(stage.name)
                    .font(.subheadline.weight(.black))
                    .foregroundStyle(.white)
                Text("Wave \(max(1, hud.wave)) / \(hud.totalWaves)")
                    .font(.caption2.bold())
                    .foregroundStyle(.white.opacity(0.65))
            }

            Spacer()

            // Plain language objectives
            objectivePill(
                icon: "shield.fill",
                title: "Protect",
                subtitle: "Your Base",
                ratio: hud.wellRatio,
                color: .cyan
            )
            objectivePill(
                icon: "flame.fill",
                title: "Attack",
                subtitle: "Enemy Rift",
                ratio: 1 - hud.riftRatio,
                color: .red,
                invertFill: false,
                showDamage: true,
                damageRatio: 1 - hud.riftRatio
            )

            Text(timerText)
                .font(.system(size: 20, weight: .black, design: .rounded))
                .foregroundStyle(hud.timeLeft < 20 ? .red : .white)
                .monospacedDigit()
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Capsule().fill(.black.opacity(0.55)))
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 16).fill(.black.opacity(0.42)))
    }

    private func objectivePill(
        icon: String,
        title: String,
        subtitle: String,
        ratio: CGFloat,
        color: Color,
        invertFill: Bool = false,
        showDamage: Bool = false,
        damageRatio: CGFloat = 0
    ) -> some View {
        let fill = showDamage ? damageRatio : ratio
        return VStack(alignment: .leading, spacing: 3) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 10, weight: .bold))
                Text(title)
                    .font(.system(size: 10, weight: .black))
            }
            .foregroundStyle(color)
            Text(subtitle)
                .font(.system(size: 9, weight: .semibold))
                .foregroundStyle(.white.opacity(0.7))
            GeometryReader { g in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.black.opacity(0.45))
                    Capsule().fill(color)
                        .frame(width: max(4, g.size.width * max(0, min(1, fill))))
                }
            }
            .frame(width: 100, height: 9)
        }
        .padding(8)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.35)))
    }

    private var missionBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "flag.fill")
                .foregroundStyle(.yellow)
            Text(hud.missionText)
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            if hud.combo > 1 {
                Spacer(minLength: 8)
                Text("Combo ×\(hud.combo)")
                    .font(.caption.weight(.black))
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            Capsule()
                .fill(Color.black.opacity(0.5))
                .overlay(Capsule().stroke(Color.yellow.opacity(0.35), lineWidth: 1))
        )
    }

    private var helpCard: some View {
        HStack(spacing: 16) {
            helpStep(num: "1", text: "Drag finger\nto move hero")
            helpStep(num: "2", text: "Tap spirits\nto summon help")
            helpStep(num: "3", text: "Hit red Rift\nuntil it breaks")
            Button {
                withAnimation { showHelp = false }
            } label: {
                Text("Got it")
                    .font(.caption.weight(.black))
                    .foregroundStyle(.black)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.yellow))
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.black.opacity(0.72))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.15)))
        )
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }

    private func helpStep(num: String, text: String) -> some View {
        HStack(spacing: 8) {
            Text(num)
                .font(.headline.weight(.black))
                .foregroundStyle(.black)
                .frame(width: 26, height: 26)
                .background(Circle().fill(Color.cyan))
            Text(text)
                .font(.caption2.weight(.semibold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
        }
    }

    private var timerText: String {
        let t = max(0, Int(hud.timeLeft))
        return String(format: "%d:%02d", t / 60, t % 60)
    }

    private var bottomControls: some View {
        HStack(spacing: 10) {
            // Hero status — plain English
            HStack(spacing: 8) {
                Image(progress.selectedChampion.assetName)
                    .resizable()
                    .frame(width: 40, height: 40)
                VStack(alignment: .leading, spacing: 3) {
                    Text("Your Hero")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.white.opacity(0.6))
                    Text(progress.selectedChampion.displayName)
                        .font(.caption.weight(.black))
                        .foregroundStyle(.white)
                    GeometryReader { g in
                        ZStack(alignment: .leading) {
                            Capsule().fill(Color.black.opacity(0.5))
                            Capsule().fill(Color.green)
                                .frame(width: g.size.width * (hud.championHP / max(1, hud.championMaxHP)))
                        }
                    }
                    .frame(width: 90, height: 8)
                }
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.black.opacity(0.4)))

            // Energy
            VStack(spacing: 2) {
                Text("ENERGY")
                    .font(.system(size: 9, weight: .black))
                    .foregroundStyle(.purple)
                Text("\(hud.energy)")
                    .font(.title2.bold().monospacedDigit())
                    .foregroundStyle(.white)
                Text("for summons")
                    .font(.system(size: 8))
                    .foregroundStyle(.white.opacity(0.5))
            }
            .frame(width: 70)

            // Summons with names
            ForEach(SpiritKind.allCases) { spirit in
                let unlocked = progress.isSpiritUnlocked(spirit)
                let can = unlocked && hud.energy >= spirit.energyCost
                Button {
                    scene?.summon(spirit)
                } label: {
                    VStack(spacing: 2) {
                        Image(spirit.assetName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 38, height: 38)
                        Text(spirit.displayName)
                            .font(.system(size: 9, weight: .bold))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        Text("\(spirit.energyCost) en")
                            .font(.system(size: 8, weight: .semibold))
                            .foregroundStyle(can ? .cyan : .white.opacity(0.4))
                    }
                    .frame(width: 64)
                    .padding(.vertical, 6)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(can ? Color.purple.opacity(0.55) : Color.white.opacity(0.08))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(can ? Color.cyan.opacity(0.8) : Color.clear, lineWidth: 1.5)
                    )
                    .opacity(unlocked ? 1 : 0.3)
                }
                .buttonStyle(.plain)
                .disabled(!unlocked)
            }

            // Ultimate
            Button {
                scene?.castUltimate()
            } label: {
                VStack(spacing: 3) {
                    Image(systemName: "sparkles")
                        .font(.title2.bold())
                        .foregroundStyle(hud.ultimateReady ? .yellow : .gray)
                        .frame(width: 48, height: 48)
                        .background(
                            Circle().fill(hud.ultimateReady ? Color.orange.opacity(0.9) : Color.black.opacity(0.45))
                        )
                    Text("POWER")
                        .font(.system(size: 9, weight: .black))
                        .foregroundStyle(.white)
                    Text(progress.selectedChampion.ultimateName)
                        .font(.system(size: 8))
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            .buttonStyle(.plain)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.58))
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.12), lineWidth: 1))
        )
    }

    private func resultCard(_ r: ArenaResult) -> some View {
        ZStack {
            Color.black.opacity(0.75).ignoresSafeArea()
            VStack(spacing: 14) {
                Text(r.won ? "You Win!" : "Try Again")
                    .font(.system(size: 34, weight: .black, design: .rounded))
                    .foregroundStyle(r.won ? .cyan : .orange)
                Text(r.won ? "The enemy rift is sealed." : "Protect your base and keep fighting.")
                    .foregroundStyle(.white.opacity(0.8))
                StarRow(stars: r.stars, size: 22)
                if r.won {
                    HStack(spacing: 16) {
                        ResourcePill(icon: "crystal", value: r.loot.essence, tint: .cyan)
                        ResourcePill(icon: "star", value: r.loot.shards, tint: .yellow)
                    }
                }
                GameButton(title: "Back to Map", color: .purple, action: onClose)
                    .frame(width: 220)
            }
            .padding(28)
            .background(PanelBackground())
        }
    }
}

final class ArenaBridge: ArenaSceneDelegate {
    let onUpdate: (ArenaHUD) -> Void
    let onEnd: (ArenaResult) -> Void

    init(onUpdate: @escaping (ArenaHUD) -> Void, onEnd: @escaping (ArenaResult) -> Void) {
        self.onUpdate = onUpdate
        self.onEnd = onEnd
    }

    func arenaDidUpdate(hud: ArenaHUD) {
        DispatchQueue.main.async { self.onUpdate(hud) }
    }

    func arenaDidEnd(result: ArenaResult) {
        DispatchQueue.main.async { self.onEnd(result) }
    }
}
