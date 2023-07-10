import Foundation

public enum APIError: Swift.Error, Equatable {
    case accessTokenNotFound
    case invalidRequest
    case invalidResponse
    case error4XX(statusCode: Int)
    case serverError
}
