import Foundation

/// This API client is a generic func to perform given requests.
///
/// Though the API itself is not auto-generated, but inspired by an auto-generated API client solution.
/// The concept is usually adopted in some API-driven development techniques. e.i. [gRPC](https://cloud.google.com/blog/products/api-management/understanding-grpc-openapi-and-rest-and-when-to-use-them)
/// The idea is to have a single source of truth for an API and auto-generated all source code for all client&server components. Thus, the machine generates the client and server agreement code and minimizes human error.
final class APIClient {

    class func perform<Rule: APIRule>(with rule: Rule) async throws -> Rule.SuccessResponseType {
        let request = try rule.makeRequest()
        let dataTaskResponse = try await Current.networkSession().dataTask(with: request)
        guard let httpResponse = dataTaskResponse.response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        switch httpResponse.statusCode {
        case 200..<300:
            return try rule.decodeSuccessResponse(data: dataTaskResponse.data)
        case 400..<500:
            throw APIError.error4XX(statusCode: httpResponse.statusCode)
        case 500..<600:
            throw APIError.serverError
        default:
            throw APIError.invalidResponse
        }
    }
}
