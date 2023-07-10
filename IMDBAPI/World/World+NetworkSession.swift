import Foundation
import IMDBFoundation

extension URLSession: NetworkSession {
    public func dataTask(with request: URLRequest) async throws -> NetworkSession.DataTaskResponse {
        let (data, response) = try await data(for: request)
        return NetworkSession.DataTaskResponse(data: data, response: response)
    }
}
