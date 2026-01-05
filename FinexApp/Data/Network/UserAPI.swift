import Foundation

enum UserAPI {
    static func me() async throws -> UserResponse {
        try await APIClient.shared.get(path: "/users/me", requiresAuth: true)
    }
}

