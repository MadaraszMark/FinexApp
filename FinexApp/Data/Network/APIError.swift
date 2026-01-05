import Foundation

enum APIError: LocalizedError {

    case invalidResponse
    case httpError(code: Int, data: Data)
    case network(Error)
    case decodingFailed
    case unauthorized

    var errorDescription: String? {
        switch self {

        case .invalidResponse:
            return "Érvénytelen válasz a szervertől."
        case .unauthorized:
            return "A munkamenet lejárt. Jelentkezz be újra."

        case .httpError(let code, _):
            switch code {
            case 400:
                return "Hibás kérés."
            case 401:
                return "Nincs jogosultságod."
            case 409:
                return "Az email cím már foglalt."
            case 500:
                return "Szerverhiba történt."
            default:
                return "Hiba történt (\(code))."
            }

        case .network:
            return "Nem sikerült csatlakozni a szerverhez."

        case .decodingFailed:
            return "Nem sikerült feldolgozni a szerver válaszát."
        }
    }
}

