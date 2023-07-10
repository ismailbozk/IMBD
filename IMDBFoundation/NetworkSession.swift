import Foundation

@available(macOS 10.15.0, *)
public protocol NetworkSession {
    typealias DataTaskResponse = (data: Data, response: URLResponse)
    func dataTask(with request: URLRequest) async throws -> DataTaskResponse
}
