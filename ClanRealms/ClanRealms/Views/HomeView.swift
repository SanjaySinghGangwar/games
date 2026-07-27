import SwiftUI

/// Simple landscape lobby: how to play + pick hero + enter stage.
struct HomeView: View {
    @EnvironmentObject var progress: PlayerProgress
    @State private var activeStage: ArenaStage?
    @State private var showSpirits = false

    var body: some View {
        GeometryReader { geo in
            ZStack {
                background

                HStack(alignment: .top, spacing: 16) {
                    leftPanel
                        .frame(width: min(380, geo.size.width * 0.4))
                    stagesPanel
                }
                .padding(16)
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(item: $activeStage) { stage in
            ArenaView(stage: stage, onClose: { activeStage = nil })
                .environmentObject(progress)
        }
        .sheet(isPresented: $showSpirits) {
            SpiritSheet()
                .environmentObject(progress)
                .presentationDetents([.medium, .large])
        }
    }

    private var background: some View {
        LinearGradient(
            colors: [
                Color(red: 0.1, green: 0.16, blue: 0.14),
                Color(red: 0.08, green: 0.12, blue: 0.2),
                Color(red: 0.12, green: 0.1, blue: 0.18),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }

    private var leftPanel: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Aether Rift")
                .font(.system(size: 32, weight: .black, design: .rounded))
                .foregroundStyle(.white)
            Text("A simple arena fight — move, summon, win.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))

            HStack(spacing: 10) {
                ResourcePill(icon: "crystal", value: progress.essence, tint: .cyan)
                ResourcePill(icon: "star", value: progress.shards, tint: .yellow)
            }

            // How to play — big and clear
            VStack(alignment: .leading, spacing: 8) {
                Text("HOW TO PLAY")
                    .font(.caption.weight(.black))
                    .foregroundStyle(.yellow)

                howRow(num: "1", title: "Pick a hero", detail: "Below — each has a special power.")
                howRow(num: "2", title: "Enter a stage", detail: "Tap ENTER on any unlocked gate.")
                howRow(num: "3", title: "Drag to move", detail: "Your hero walks where you drag.")
                howRow(num: "4", title: "Summon helpers", detail: "Spend Energy on spirits at the bottom.")
                howRow(num: "5", title: "Win condition", detail: "Destroy the RED enemy rift. Keep the BLUE base alive.")
            }
            .padding(12)
            .background(PanelBackground())

            // Hero select
            VStack(alignment: .leading, spacing: 8) {
                Text("YOUR HERO")
                    .font(.caption.weight(.black))
                    .foregroundStyle(.orange)
                HStack(spacing: 8) {
                    ForEach(ChampionKind.allCases) { c in
                        let unlocked = progress.isChampionUnlocked(c)
                        Button {
                            if unlocked {
                                progress.selectedChampion = c
                                progress.save()
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Image(c.assetName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 48, height: 48)
                                    .padding(6)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(progress.selectedChampion == c
                                                  ? Color.purple.opacity(0.75)
                                                  : Color.white.opacity(0.08))
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(progress.selectedChampion == c ? Color.cyan : .clear, lineWidth: 2)
                                    )
                                Text(c.displayName)
                                    .font(.system(size: 10, weight: .bold))
                                    .foregroundStyle(.white)
                                Text(c.ultimateName)
                                    .font(.system(size: 8))
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .opacity(unlocked ? 1 : 0.35)
                        }
                        .buttonStyle(.plain)
                        .disabled(!unlocked)
                    }
                }
                Button("Spirit helpers…") { showSpirits = true }
                    .font(.caption.bold())
                    .foregroundStyle(.cyan)
            }
            .padding(12)
            .background(PanelBackground())

            Spacer(minLength: 0)
        }
    }

    private func howRow(num: String, title: String, detail: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(num)
                .font(.caption.weight(.black))
                .foregroundStyle(.black)
                .frame(width: 22, height: 22)
                .background(Circle().fill(Color.yellow))
            VStack(alignment: .leading, spacing: 1) {
                Text(title)
                    .font(.subheadline.weight(.bold))
                    .foregroundStyle(.white)
                Text(detail)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.65))
            }
        }
    }

    private var stagesPanel: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("STAGES")
                .font(.title3.weight(.black))
                .foregroundStyle(.white)
            Text("Start with stage 1 — left = your base, right = enemy.")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.55))

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(GameCatalog.stages) { stage in
                        stageCard(stage)
                    }
                }
            }
        }
    }

    private func stageCard(_ stage: ArenaStage) -> some View {
        let unlocked = progress.isStageUnlocked(stage)
        let stars = progress.stars(for: stage.id)
        return Button {
            guard unlocked else { return }
            activeStage = stage
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(stage.accentAsset)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Stage \(stage.id)")
                            .font(.caption2.weight(.bold))
                            .foregroundStyle(.yellow)
                        Text(stage.name)
                            .font(.subheadline.weight(.bold))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                Text(stage.subtitle)
                    .font(.caption2)
                    .foregroundStyle(.white.opacity(0.55))
                    .lineLimit(2)
                HStack {
                    StarRow(stars: stars, size: 12)
                    Spacer()
                    if unlocked {
                        Text("ENTER")
                            .font(.caption.weight(.black))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 7)
                            .background(Capsule().fill(Color.green.opacity(0.9)))
                            .foregroundStyle(.white)
                    } else {
                        Label("Locked", systemImage: "lock.fill")
                            .font(.caption2)
                            .foregroundStyle(.white.opacity(0.4))
                    }
                }
            }
            .padding(12)
            .background(PanelBackground())
            .opacity(unlocked ? 1 : 0.5)
        }
        .buttonStyle(.plain)
        .disabled(!unlocked)
    }
}

struct SpiritSheet: View {
    @EnvironmentObject var progress: PlayerProgress
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                Section("These fight beside your hero (costs Energy in battle)") {
                    ForEach(SpiritKind.allCases) { s in
                        HStack {
                            Image(s.assetName)
                                .resizable()
                                .frame(width: 48, height: 48)
                            VStack(alignment: .leading) {
                                Text(s.displayName).font(.headline)
                                Text("Costs \(s.energyCost) energy · \(Int(s.maxHP)) HP")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            if progress.isSpiritUnlocked(s) {
                                Text("Ready")
                                    .font(.caption.bold())
                                    .foregroundStyle(.green)
                            } else {
                                Button("Unlock 80") {
                                    progress.unlockSpirit(s, cost: 80)
                                }
                                .font(.caption.bold())
                            }
                        }
                    }
                }
            }
            .navigationTitle("Spirit Helpers")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
