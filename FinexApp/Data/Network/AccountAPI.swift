protocol AccountAPIProtocol {
    func fetchAccount(id: Int) async throws -> AccountResponse
    func fetchMyAccount() async throws -> AccountResponse
}

final class AccountAPI: AccountAPIProtocol {
    private let client: APIClient

    init(client: APIClient = .shared) {
        self.client = client
    }

    func fetchAccount(id: Int) async throws -> AccountResponse {
        return try await client.get(path: "/accounts/\(id)", requiresAuth: true)
    }

    func fetchMyAccount() async throws -> AccountResponse {
        return try await client.get(path: "/accounts/me", requiresAuth: true)
    }
}
