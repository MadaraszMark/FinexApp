import SwiftUI

enum AppTab: CaseIterable {
    case home
    case cards
    case transactions
    case assistant
    case profile

    var icon: String {
        switch self {
        case .home: return "house"
        case .cards: return "creditcard"
        case .transactions: return "list.bullet.rectangle"
        case .assistant: return "sparkles"
        case .profile: return "person"
        }
    }
}
