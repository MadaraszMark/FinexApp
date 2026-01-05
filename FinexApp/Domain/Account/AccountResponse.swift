import Foundation

struct AccountResponse: Decodable {
    let id: Int
    let userId: Int
    let accountNumber: String
    let balance: Decimal
    let currency: String
    let accountType: String
    let cardNumber: String
    let status: String
    let createdAt: String
}
