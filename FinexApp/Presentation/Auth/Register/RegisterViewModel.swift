import Foundation
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {

    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""

    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isSuccess = false

    func register() async {
        errorMessage = nil
        isLoading = true

        let request = RegisterRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
            phone: phone.isEmpty ? nil : phone,
            password: password,
            role: "USER"
        )

        do {
            _ = try await AuthAPI.register(request)
            isSuccess = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
