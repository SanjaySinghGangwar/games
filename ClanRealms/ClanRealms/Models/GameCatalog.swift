import Foundation
import CoreGraphics

// MARK: - Original game: AETHER RIFT
// You pilot a clan champion in a living arena, summon spirit allies,
// and close enemy rifts. Not a base-raider — a dynamic arena brawler.

struct EssenceLoot: Equatable {
    var essence: Int
    var shards: Int
}

// MARK: - Champions (player-controlled)

enum ChampionKind: String, CaseIterable, Identifiable {
    case boldrin, lumen, lyra, borin

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .boldrin: return "Boldrin"
        case .lumen: return "Lumen"
        case .lyra: return "Lyra"
        case .borin: return "Borin"
        }
    }

    var title: String {
        switch self {
        case .boldrin: return "Iron Warden"
        case .lumen: return "Arc Mage"
        case .lyra: return "Wind Scout"
        case .borin: return "Forge Titan"
        }
    }

    var assetName: String {
        switch self {
        case .boldrin: return "hero_knight"
        case .lumen: return "hero_wizard"
        case .lyra: return "hero_archer"
        case .borin: return "hero_dwarf"
        }
    }

    var maxHP: CGFloat {
        switch self {
        case .boldrin: return 420
        case .lumen: return 260
        case .lyra: return 280
        case .borin: return 500
        }
    }

    var damage: CGFloat {
        switch self {
        case .boldrin: return 28
        case .lumen: return 42
        case .lyra: return 32
        case .borin: return 36
        }
    }

    var moveSpeed: CGFloat {
        switch self {
        case .boldrin: return 170
        case .lumen: return 155
        case .lyra: return 210
        case .borin: return 140
        }
    }

    var attackRange: CGFloat {
        switch self {
        case .boldrin: return 48
        case .lumen: return 160
        case .lyra: return 180
        case .borin: return 52
        }
    }

    var attackCooldown: TimeInterval {
        switch self {
        case .boldrin: return 0.55
        case .lumen: return 0.75
        case .lyra: return 0.45
        case .borin: return 0.7
        }
    }

    var ultimateName: String {
        switch self {
        case .boldrin: return "Bulwark"
        case .lumen: return "Nova"
        case .lyra: return "Rain"
        case .borin: return "Quake"
        }
    }

    var spriteSize: CGFloat { 64 }
    var unlockStage: Int {
        switch self {
        case .boldrin: return 1
        case .lyra: return 1
        case .lumen: return 2
        case .borin: return 3
        }
    }
}

// MARK: - Spirit summons

enum SpiritKind: String, CaseIterable, Identifiable {
    case wisp, wolf, golem, phoenix

    var id: String { rawValue }

    var displayName: String {
        switch self {
        case .wisp: return "Wisp"
        case .wolf: return "Spirit Wolf"
        case .golem: return "Stonekin"
        case .phoenix: return "Emberling"
        }
    }

    var assetName: String {
        switch self {
        case .wisp: return "ghost"
        case .wolf: return "wolf"
        case .golem: return "golem"
        case .phoenix: return "baby_dragon"
        }
    }

    var energyCost: Int {
        switch self {
        case .wisp: return 20
        case .wolf: return 35
        case .golem: return 55
        case .phoenix: return 70
        }
    }

    var maxHP: CGFloat {
        switch self {
        case .wisp: return 60
        case .wolf: return 110
        case .golem: return 280
        case .phoenix: return 150
        }
    }

    var damage: CGFloat {
        switch self {
        case .wisp: return 12
        case .wolf: return 20
        case .golem: return 18
        case .phoenix: return 30
        }
    }

    var moveSpeed: CGFloat {
        switch self {
        case .wisp: return 130
        case .wolf: return 170
        case .golem: return 90
        case .phoenix: return 150
        }
    }

    var attackRange: CGFloat {
        switch self {
        case .wisp: return 100
        case .wolf: return 36
        case .golem: return 40
        case .phoenix: return 90
        }
    }

    var attackCooldown: TimeInterval { 0.7 }
    var spriteSize: CGFloat {
        switch self {
        case .golem: return 58
        case .phoenix: return 52
        default: return 42
        }
    }
    var isFlying: Bool { self == .phoenix || self == .wisp }
}

// MARK: - Enemies from rifts

enum FoeKind: String, CaseIterable {
    case slime, bat, bee, spider, skeleton, goblin, orc, ghost, water, darkKnight, hatchling, adultDragon

    var displayName: String {
        switch self {
        case .slime: return "Slime"
        case .bat: return "Night Bat"
        case .bee: return "Stinger"
        case .spider: return "Webber"
        case .skeleton: return "Bone"
        case .goblin: return "Rift Goblin"
        case .orc: return "Brute"
        case .ghost: return "Wail"
        case .water: return "Tide"
        case .darkKnight: return "Riftblade"
        case .hatchling: return "Drake"
        case .adultDragon: return "Wyrm"
        }
    }

    var assetName: String {
        switch self {
        case .slime: return "slime"
        case .bat: return "bat"
        case .bee: return "bee"
        case .spider: return "spider"
        case .skeleton: return "skeleton"
        case .goblin: return "goblin"
        case .orc: return "orc"
        case .ghost: return "ghost"
        case .water: return "water_elemental"
        case .darkKnight: return "dark_knight"
        case .hatchling: return "baby_dragon"
        case .adultDragon: return "adult_dragon"
        }
    }

    var maxHP: CGFloat {
        switch self {
        case .slime: return 45
        case .bat: return 35
        case .bee: return 40
        case .spider: return 70
        case .skeleton: return 90
        case .goblin: return 80
        case .orc: return 160
        case .ghost: return 75
        case .water: return 140
        case .darkKnight: return 320
        case .hatchling: return 200
        case .adultDragon: return 600
        }
    }

    var damage: CGFloat {
        switch self {
        case .slime: return 8
        case .bat: return 10
        case .bee: return 12
        case .spider: return 14
        case .skeleton: return 16
        case .goblin: return 15
        case .orc: return 24
        case .ghost: return 18
        case .water: return 20
        case .darkKnight: return 32
        case .hatchling: return 28
        case .adultDragon: return 40
        }
    }

    var moveSpeed: CGFloat {
        switch self {
        case .bat, .bee: return 150
        case .slime: return 70
        case .orc, .adultDragon: return 85
        case .darkKnight: return 100
        default: return 110
        }
    }

    var attackRange: CGFloat {
        switch self {
        case .bat, .bee, .ghost: return 90
        case .adultDragon, .hatchling: return 100
        default: return 36
        }
    }

    var attackCooldown: TimeInterval { 0.85 }
    var spriteSize: CGFloat {
        switch self {
        case .adultDragon: return 78
        case .darkKnight, .orc: return 58
        case .hatchling: return 54
        default: return 40
        }
    }
    var isBoss: Bool { self == .darkKnight || self == .adultDragon }
    var essenceReward: Int {
        isBoss ? 40 : 6
    }
}

// MARK: - Arena stages / waves

struct WaveSpec {
    let foes: [FoeKind]
    let delay: TimeInterval
}

struct ArenaStage: Identifiable {
    let id: Int
    let name: String
    let subtitle: String
    let waves: [WaveSpec]
    let riftHP: CGFloat
    let wellHP: CGFloat
    let timeLimit: TimeInterval
    let rewards: EssenceLoot
    let accentAsset: String

    var isFinale: Bool { id >= 6 }
}

enum GameCatalog {
    static let stages: [ArenaStage] = [
        ArenaStage(
            id: 1, name: "First Rift", subtitle: "Learn the pull of the aether",
            waves: [
                WaveSpec(foes: [.slime, .slime, .bat], delay: 0),
                WaveSpec(foes: [.bee, .slime, .bat, .bee], delay: 12),
                WaveSpec(foes: [.goblin, .slime, .goblin], delay: 24),
            ],
            riftHP: 800, wellHP: 600, timeLimit: 120,
            rewards: EssenceLoot(essence: 80, shards: 10),
            accentAsset: "portal"
        ),
        ArenaStage(
            id: 2, name: "Howling Vein", subtitle: "Wolves of the void slip through",
            waves: [
                WaveSpec(foes: [.spider, .bat, .bat], delay: 0),
                WaveSpec(foes: [.spider, .goblin, .spider], delay: 10),
                WaveSpec(foes: [.skeleton, .skeleton, .ghost], delay: 22),
                WaveSpec(foes: [.orc, .goblin, .goblin], delay: 36),
            ],
            riftHP: 1100, wellHP: 700, timeLimit: 140,
            rewards: EssenceLoot(essence: 120, shards: 18),
            accentAsset: "td_detail_tree_large"
        ),
        ArenaStage(
            id: 3, name: "Bone Choir", subtitle: "Dead things learn new songs",
            waves: [
                WaveSpec(foes: [.skeleton, .ghost, .skeleton], delay: 0),
                WaveSpec(foes: [.spider, .orc, .goblin], delay: 12),
                WaveSpec(foes: [.water, .ghost, .water], delay: 26),
                WaveSpec(foes: [.darkKnight], delay: 42),
            ],
            riftHP: 1400, wellHP: 800, timeLimit: 160,
            rewards: EssenceLoot(essence: 180, shards: 28),
            accentAsset: "td_tower_round_crystals"
        ),
        ArenaStage(
            id: 4, name: "Tide Fracture", subtitle: "The arena floods with spirits",
            waves: [
                WaveSpec(foes: [.water, .water, .bat, .bee], delay: 0),
                WaveSpec(foes: [.orc, .skeleton, .ghost, .goblin], delay: 14),
                WaveSpec(foes: [.hatchling, .spider, .spider], delay: 28),
                WaveSpec(foes: [.darkKnight, .orc, .orc], delay: 45),
            ],
            riftHP: 1700, wellHP: 900, timeLimit: 170,
            rewards: EssenceLoot(essence: 240, shards: 40),
            accentAsset: "water_elemental"
        ),
        ArenaStage(
            id: 5, name: "Ember Gate", subtitle: "Heat pours from the other side",
            waves: [
                WaveSpec(foes: [.hatchling, .orc, .goblin], delay: 0),
                WaveSpec(foes: [.darkKnight, .skeleton, .ghost], delay: 16),
                WaveSpec(foes: [.hatchling, .hatchling, .orc, .orc], delay: 32),
                WaveSpec(foes: [.adultDragon], delay: 50),
            ],
            riftHP: 2100, wellHP: 1000, timeLimit: 180,
            rewards: EssenceLoot(essence: 320, shards: 55),
            accentAsset: "adult_dragon"
        ),
        ArenaStage(
            id: 6, name: "Heart of the Rift", subtitle: "Close it — or become it",
            waves: [
                WaveSpec(foes: [.darkKnight, .orc, .ghost, .water], delay: 0),
                WaveSpec(foes: [.hatchling, .darkKnight, .skeleton], delay: 15),
                WaveSpec(foes: [.adultDragon, .orc, .orc], delay: 32),
                WaveSpec(foes: [.adultDragon, .darkKnight, .hatchling], delay: 55),
            ],
            riftHP: 2800, wellHP: 1200, timeLimit: 200,
            rewards: EssenceLoot(essence: 500, shards: 90),
            accentAsset: "portal"
        ),
    ]
}

