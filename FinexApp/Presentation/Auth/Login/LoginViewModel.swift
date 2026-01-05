import Foundation
import Combine

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""

    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false

    func login() async {
        errorMessage = nil
        isLoading = true

        let request = LoginRequest(
            email: email,
            password: password
        )

        do {
            let response = try await AuthAPI.login(request)

            TokenStore.shared.save(token: response.token)

            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
