import Foundation
import SwiftUI

struct CricketTeam: Identifiable, Equatable {
    let id: String
    let name: String
    let short: String
    let primary: Color
    let secondary: Color
    /// 0...1 batting strength for AI
    let batSkill: Double
    /// 0...1 bowling strength for AI
    let bowlSkill: Double
}

enum TeamLibrary {
    static let all: [CricketTeam] = [
        CricketTeam(id: "ind", name: "Blue Panthers", short: "BLP", primary: Color(red: 0.1, green: 0.35, blue: 0.85), secondary: .orange, batSkill: 0.82, bowlSkill: 0.78),
        CricketTeam(id: "aus", name: "Gold Rangers", short: "GLD", primary: Color(red: 0.95, green: 0.75, blue: 0.1), secondary: Color(red: 0.1, green: 0.2, blue: 0.45), batSkill: 0.8, bowlSkill: 0.8),
        CricketTeam(id: "eng", name: "Royal Crowns", short: "RYC", primary: Color(red: 0.75, green: 0.12, blue: 0.18), secondary: Color(white: 0.95), batSkill: 0.76, bowlSkill: 0.77),
        CricketTeam(id: "sa", name: "Protea Force", short: "PRF", primary: Color(red: 0.05, green: 0.45, blue: 0.25), secondary: Color(red: 0.95, green: 0.85, blue: 0.2), batSkill: 0.78, bowlSkill: 0.81),
        CricketTeam(id: "nz", name: "Black Caps XI", short: "BCX", primary: Color(white: 0.12), secondary: Color(white: 0.9), batSkill: 0.77, bowlSkill: 0.79),
        CricketTeam(id: "wi", name: "Caribbean Fire", short: "CRF", primary: Color(red: 0.75, green: 0.15, blue: 0.2), secondary: Color(red: 0.95, green: 0.8, blue: 0.15), batSkill: 0.84, bowlSkill: 0.72)
    ]

    static func team(id: String) -> CricketTeam {
        all.first { $0.id == id } ?? all[0]
    }
}

enum MatchFormat: String, CaseIterable, Identifiable {
    case superOver = "Super Over"
    case t5 = "T5"
    case t10 = "T10"

    var id: String { rawValue }

    var overs: Int {
        switch self {
        case .superOver: return 1
        case .t5: return 5
        case .t10: return 10
        }
    }

    var wickets: Int {
        switch self {
        case .superOver: return 2
        case .t5, .t10: return 10
        }
    }

    var blurb: String {
        switch self {
        case .superOver: return "1 over · sudden death"
        case .t5: return "5 overs · quick clash"
        case .t10: return "10 overs · full fight"
        }
    }
}

enum ShotDirection: Int, CaseIterable, Identifiable {
    case fineLeg, squareLeg, midwicket, longOn, straight, longOff, cover, point, thirdMan

    var id: Int { rawValue }

    var label: String {
        switch self {
        case .fineLeg: return "Fine Leg"
        case .squareLeg: return "Square Leg"
        case .midwicket: return "Midwicket"
        case .longOn: return "Long On"
        case .straight: return "Straight"
        case .longOff: return "Long Off"
        case .cover: return "Cover"
        case .point: return "Point"
        case .thirdMan: return "Third Man"
        }
    }

    /// Angle on shot wheel (radians from up)
    var angle: Double {
        Double(rawValue) / Double(ShotDirection.allCases.count) * (.pi * 2) - .pi / 2
    }

    /// Risk of aerial catch if mistimed
    var aerialRisk: Double {
        switch self {
        case .longOn, .longOff, .midwicket, .straight: return 0.55
        case .cover, .squareLeg: return 0.4
        default: return 0.28
        }
    }
}
