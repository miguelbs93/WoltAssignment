import Foundation

enum APIError: Error, LocalizedError {
    case invalidResponse
    case httpStatus(code: Int)
    case decoding(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "Invalid response from server."
        case .httpStatus(let code):
            return "Server returned status code \(code)."
        case .decoding(let error):
            return "Decoding error: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}
