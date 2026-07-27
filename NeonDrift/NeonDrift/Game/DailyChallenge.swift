import Foundation

enum DailyModifier: String, CaseIterable {
    case gemRush
    case glassCannon
    case overdrive
    case magnetOnly
    case goldFever
    case bossHunt

    var title: String {
        switch self {
        case .gemRush: return "Gem Rush"
        case .glassCannon: return "Glass Cannon"
        case .overdrive: return "Overdrive"
        case .magnetOnly: return "Magnet Field"
        case .goldFever: return "Gold Fever"
        case .bossHunt: return "Boss Hunt"
        }
    }

    var blurb: String {
        switch self {
        case .gemRush: return "Crystals everywhere. Score target higher."
        case .glassCannon: return "1 shield only. Score is worth more."
        case .overdrive: return "Faster cosmos. Survive the rush."
        case .magnetOnly: return "Start with long magnet. Hit score goal."
        case .goldFever: return "Gold crystals dominate the field."
        case .bossHunt: return "Bosses spawn earlier. Defeat 1+ boss."
        }
    }

    var symbol: String {
        switch self {
        case .gemRush: return "diamond.fill"
        case .glassCannon: return "bolt.shield"
        case .overdrive: return "gauge.with.dots.needle.67percent"
        case .magnetOnly: return "dot.radiowaves.left.and.right"
        case .goldFever: return "star.fill"
        case .bossHunt: return "flame.fill"
        }
    }
}

struct DailyChallenge: Equatable {
    let dayKey: String
    let modifier: DailyModifier
    let targetScore: Int
    let reward: Int

    static func today(reference: Date = Date()) -> DailyChallenge {
        let cal = Calendar.current
        let comps = cal.dateComponents([.year, .month, .day], from: reference)
        let key = String(format: "%04d-%02d-%02d", comps.year ?? 0, comps.month ?? 0, comps.day ?? 0)
        var hasher = Hasher()
        hasher.combine(key)
        let seed = abs(hasher.finalize())
        let mods = DailyModifier.allCases
        let mod = mods[seed % mods.count]
        let target = 2500 + (seed % 7) * 400
        let reward = 25 + (seed % 5) * 10
        return DailyChallenge(dayKey: key, modifier: mod, targetScore: target, reward: reward)
    }
}

final class DailyChallengeStore: ObservableObject {
    static let shared = DailyChallengeStore()

    @Published private(set) var challenge: DailyChallenge
    @Published private(set) var completedToday: Bool
    @Published private(set) var bestToday: Int

    private let defaults = UserDefaults.standard
    private let completedKey = "NeonDriftDailyCompleted"
    private let bestKey = "NeonDriftDailyBest"
    private let dayKeyKey = "NeonDriftDailyDay"

    private init() {
        let today = DailyChallenge.today()
        challenge = today
        let savedDay = defaults.string(forKey: dayKeyKey) ?? ""
        if savedDay != today.dayKey {
            defaults.set(today.dayKey, forKey: dayKeyKey)
            defaults.set(false, forKey: completedKey)
            defaults.set(0, forKey: bestKey)
            completedToday = false
            bestToday = 0
        } else {
            completedToday = defaults.bool(forKey: completedKey)
            bestToday = defaults.integer(forKey: bestKey)
        }
    }

    func refreshIfNeeded() {
        let today = DailyChallenge.today()
        if today.dayKey != challenge.dayKey {
            challenge = today
            defaults.set(today.dayKey, forKey: dayKeyKey)
            defaults.set(false, forKey: completedKey)
            defaults.set(0, forKey: bestKey)
            completedToday = false
            bestToday = 0
        }
    }

    /// Returns reward crystals granted (0 if already claimed / failed).
    @discardableResult
    func registerRun(score: Int, bossesDefeated: Int, bank: inout Int) -> Int {
        refreshIfNeeded()
        if score > bestToday {
            bestToday = score
            defaults.set(bestToday, forKey: bestKey)
        }
        guard !completedToday else { return 0 }

        let ok: Bool
        switch challenge.modifier {
        case .bossHunt:
            ok = bossesDefeated >= 1 && score >= challenge.targetScore / 2
        default:
            ok = score >= challenge.targetScore
        }
        guard ok else { return 0 }

        completedToday = true
        defaults.set(true, forKey: completedKey)
        bank += challenge.reward
        defaults.set(bank, forKey: "NeonDriftBank")
        return challenge.reward
    }
}
