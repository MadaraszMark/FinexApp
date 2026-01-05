import Foundation

struct RegisterRequest: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String?
    let password: String
    let role: String
}
