import Foundation
@testable import IMDBAPI

final class MockAPIRule: APIRule {
    typealias SuccessResponseType = MockResponse
    func makeRequest() throws -> URLRequest {
        let url = URL(string: "www.imdb.com")!
        return URLRequest(url: url)
    }

    func decodeSuccessResponse(data: Data) throws -> MockResponse {
        try JSONDecoder().decode(MockResponse.self, from: data)
    }

    func decodeError4XXResponse(data: Data) throws -> Error {
        try JSONDecoder().decode(ServerError.self, from: data)
    }
}

struct MockResponse: Codable {
    let message: String
}
