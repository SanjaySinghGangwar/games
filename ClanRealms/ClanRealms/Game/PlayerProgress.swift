import Foundation
import Combine

/// Meta progression for Aether Rift — essence, shards, champion unlocks.
@MainActor
final class PlayerProgress: ObservableObject {
    @Published var essence: Int
    @Published var shards: Int
    @Published var maxStageUnlocked: Int
    @Published var stageStars: [Int: Int]
    @Published var selectedChampion: ChampionKind
    @Published var unlockedSpirits: Set<SpiritKind>
    @Published var highCombo: Int

    private let saveKey = "aether_rift_save_v1"

    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let save = try? JSONDecoder().decode(Save.self, from: data) {
            essence = save.essence
            shards = save.shards
            maxStageUnlocked = save.maxStageUnlocked
            stageStars = save.stageStars
            selectedChampion = ChampionKind(rawValue: save.selectedChampion) ?? .boldrin
            unlockedSpirits = Set(save.unlockedSpirits.compactMap { SpiritKind(rawValue: $0) })
            highCombo = save.highCombo
        } else {
            essence = 120
            shards = 15
            maxStageUnlocked = 1
            stageStars = [:]
            selectedChampion = .boldrin
            unlockedSpirits = [.wisp, .wolf]
            highCombo = 0
        }
    }

    func stars(for stageId: Int) -> Int { stageStars[stageId] ?? 0 }

    func isStageUnlocked(_ stage: ArenaStage) -> Bool {
        stage.id <= maxStageUnlocked
    }

    func isChampionUnlocked(_ c: ChampionKind) -> Bool {
        c.unlockStage <= maxStageUnlocked
    }

    func isSpiritUnlocked(_ s: SpiritKind) -> Bool {
        unlockedSpirits.contains(s)
    }

    func unlockSpirit(_ s: SpiritKind, cost: Int) {
        guard !unlockedSpirits.contains(s), essence >= cost else { return }
        essence -= cost
        unlockedSpirits.insert(s)
        save()
    }

    func applyResult(stage: ArenaStage, stars: Int, loot: EssenceLoot, combo: Int) {
        if stars > 0 {
            essence += loot.essence
            shards += loot.shards
            let prev = stageStars[stage.id] ?? 0
            stageStars[stage.id] = max(prev, stars)
            if stage.id == maxStageUnlocked && maxStageUnlocked < GameCatalog.stages.count {
                maxStageUnlocked += 1
            }
            // Unlock spirits as you climb
            if maxStageUnlocked >= 3 { unlockedSpirits.insert(.golem) }
            if maxStageUnlocked >= 5 { unlockedSpirits.insert(.phoenix) }
        }
        highCombo = max(highCombo, combo)
        save()
    }

    func resetAll() {
        essence = 120
        shards = 15
        maxStageUnlocked = 1
        stageStars = [:]
        selectedChampion = .boldrin
        unlockedSpirits = [.wisp, .wolf]
        highCombo = 0
        save()
    }

    private struct Save: Codable {
        var essence: Int
        var shards: Int
        var maxStageUnlocked: Int
        var stageStars: [Int: Int]
        var selectedChampion: String
        var unlockedSpirits: [String]
        var highCombo: Int
    }

    func save() {
        let save = Save(
            essence: essence,
            shards: shards,
            maxStageUnlocked: maxStageUnlocked,
            stageStars: stageStars,
            selectedChampion: selectedChampion.rawValue,
            unlockedSpirits: unlockedSpirits.map(\.rawValue),
            highCombo: highCombo
        )
        if let data = try? JSONEncoder().encode(save) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
