import Foundation
import Combine

@MainActor
final class AuthSession: ObservableObject {

    @Published private(set) var isAuthenticated: Bool = false

    init() {
        restoreSession()
    }

    func restoreSession() {
        isAuthenticated = TokenStore.shared.hasToken
    }

    func loginSucceeded() {
        isAuthenticated = true
    }

    func logout() {
        TokenStore.shared.clear()
        isAuthenticated = false
    }
}
