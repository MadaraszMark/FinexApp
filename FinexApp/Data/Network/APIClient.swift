import Foundation

final class APIClient {

    static let shared = APIClient()
    private init() {}

    private let baseURL = URL(string: "http://192.168.1.20:8080")!

    func post<T: Decodable, U: Encodable>(
        path: String,
        body: U,
        requiresAuth: Bool = false
    ) async throws -> T {

        let cleanPath = path.hasPrefix("/") ? String(path.dropFirst()) : path
        let url = baseURL.appendingPathComponent(cleanPath)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)

        if requiresAuth {
            guard let token = TokenStore.shared.loadToken() else {
                throw APIError.unauthorized
            }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let http = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            guard 200..<300 ~= http.statusCode else {
                if http.statusCode == 401 {
                    TokenStore.shared.deleteToken()
                }
                throw APIError.httpError(code: http.statusCode, data: data)
            }

            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)

        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.network(error)
        }
    }
    
    func get<T: Decodable>(
        path: String,
        requiresAuth: Bool = false
    ) async throws -> T {

        let cleanPath = path.hasPrefix("/") ? String(path.dropFirst()) : path
        let url = baseURL.appendingPathComponent(cleanPath)

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        if requiresAuth {
            guard let token = TokenStore.shared.loadToken() else {
                throw APIError.unauthorized
            }
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let http = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }

            guard 200..<300 ~= http.statusCode else {
                if http.statusCode == 401 {
                    TokenStore.shared.deleteToken()
                }
                throw APIError.httpError(code: http.statusCode, data: data)
            }

            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)

        } catch let error as APIError {
            throw error
        } catch {
            throw APIError.network(error)
        }
    }

    
}
