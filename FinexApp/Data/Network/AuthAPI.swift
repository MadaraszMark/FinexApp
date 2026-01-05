import Foundation

enum AuthAPI {

    static func register(_ request: RegisterRequest) async throws -> RegisterResponse {
        try await APIClient.shared.post(
            path: "/auth/register",
            body: request
        )
    }
    static func login(_ request: LoginRequest) async throws -> LoginResponse {
            try await APIClient.shared.post(
                path: "auth/login",
                body: request
            )
        }
}
