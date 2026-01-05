import Foundation
import Combine

enum MoneyFormatter {
    static func format(amount: Decimal, currency: String) -> String {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.currencyCode = currency
        f.currencySymbol = currency == "HUF" ? "Ft" : currency
        f.maximumFractionDigits = currency == "HUF" ? 0 : 2
        f.locale = Locale(identifier: "hu_HU")

        return f.string(from: amount as NSDecimalNumber) ?? "\(amount) \(currency)"
    }
}

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - UI state
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var firstName: String = ""
    @Published var lastName: String = ""

    var fullName: String {
        let name = "\(lastName) \(firstName)".trimmingCharacters(in: .whitespacesAndNewlines)
        return name.isEmpty ? "..." : name
    }

    @Published var balanceText: String = "—"
    @Published var isBalanceLoading: Bool = false
    @Published var balanceErrorMessage: String?

    // MARK: - Dependencies
    private let accountAPI: AccountAPIProtocol

    // MARK: - Init (DI)
    init(accountAPI: AccountAPIProtocol) {
        self.accountAPI = accountAPI
    }

    // MARK: - Actions
    func loadMe() async {
        errorMessage = nil
        isLoading = true
        defer { isLoading = false }

        do {
            let me = try await UserAPI.me()
            firstName = me.firstName
            lastName = me.lastName
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func loadBalance() async {
        balanceErrorMessage = nil
        isBalanceLoading = true
        defer { isBalanceLoading = false }

        do {
            let account = try await accountAPI.fetchMyAccount()
            balanceText = MoneyFormatter.format(
                amount: account.balance,
                currency: account.currency
            )
        } catch {
            balanceErrorMessage = error.localizedDescription
            balanceText = "—"
        }
    }
}

