import Foundation

struct RegisterResponse: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
}
