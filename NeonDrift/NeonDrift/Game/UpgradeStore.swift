import Foundation

enum UpgradeID: String, CaseIterable, Identifiable {
    case hull
    case magnetCore
    case scoreAmp
    case gemFortune
    case thrusters
    case luckyDrop

    var id: String { rawValue }

    var title: String {
        switch self {
        case .hull: return "Reinforced Hull"
        case .magnetCore: return "Magnet Core"
        case .scoreAmp: return "Score Amplifier"
        case .gemFortune: return "Gem Fortune"
        case .thrusters: return "Vector Thrusters"
        case .luckyDrop: return "Lucky Drops"
        }
    }

    var detail: String {
        switch self {
        case .hull: return "+1 max shield per level"
        case .magnetCore: return "Start run with magnet time"
        case .scoreAmp: return "+12% score per level"
        case .gemFortune: return "+1 bank gem chance on pickups"
        case .thrusters: return "Faster steering response"
        case .luckyDrop: return "More gold crystals & power-ups"
        }
    }

    var symbol: String {
        switch self {
        case .hull: return "shield.lefthalf.filled"
        case .magnetCore: return "dot.radiowaves.left.and.right"
        case .scoreAmp: return "chart.line.uptrend.xyaxis"
        case .gemFortune: return "diamond.fill"
        case .thrusters: return "airplane"
        case .luckyDrop: return "sparkles"
        }
    }

    var maxLevel: Int { 3 }

    func cost(for level: Int) -> Int {
        // level is current level; cost to buy next
        let base: Int
        switch self {
        case .hull: base = 40
        case .magnetCore: base = 35
        case .scoreAmp: base = 45
        case .gemFortune: base = 30
        case .thrusters: base = 35
        case .luckyDrop: base = 50
        }
        return base + level * base
    }
}

final class UpgradeStore: ObservableObject {
    static let shared = UpgradeStore()

    @Published private(set) var levels: [UpgradeID: Int] = [:]

    private let defaults = UserDefaults.standard
    private let keyPrefix = "NeonDriftUpgrade."

    private init() {
        for id in UpgradeID.allCases {
            levels[id] = defaults.integer(forKey: keyPrefix + id.rawValue)
        }
    }

    func level(of id: UpgradeID) -> Int {
        min(id.maxLevel, levels[id] ?? 0)
    }

    func canBuy(_ id: UpgradeID, bank: Int) -> Bool {
        let lv = level(of: id)
        guard lv < id.maxLevel else { return false }
        return bank >= id.cost(for: lv)
    }

    @discardableResult
    func buy(_ id: UpgradeID, bank: inout Int) -> Bool {
        let lv = level(of: id)
        guard lv < id.maxLevel else { return false }
        let cost = id.cost(for: lv)
        guard bank >= cost else { return false }
        bank -= cost
        let next = lv + 1
        levels[id] = next
        defaults.set(next, forKey: keyPrefix + id.rawValue)
        defaults.set(bank, forKey: "NeonDriftBank")
        objectWillChange.send()
        return true
    }

    // MARK: - Derived bonuses

    var bonusMaxShields: Int { level(of: .hull) }

    var startMagnetSeconds: CGFloat {
        CGFloat(level(of: .magnetCore)) * 2.5
    }

    var scoreMultiplier: CGFloat {
        1.0 + 0.12 * CGFloat(level(of: .scoreAmp))
    }

    var extraBankChance: Double {
        0.18 * Double(level(of: .gemFortune))
    }

    var thrusterBoost: CGFloat {
        1.0 + 0.12 * CGFloat(level(of: .thrusters))
    }

    var luckyFactor: Double {
        1.0 + 0.35 * Double(level(of: .luckyDrop))
    }
}
