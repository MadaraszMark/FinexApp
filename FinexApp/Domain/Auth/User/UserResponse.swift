import Foundation

struct UserResponse: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
    let phone: String?
    let role: String
}

