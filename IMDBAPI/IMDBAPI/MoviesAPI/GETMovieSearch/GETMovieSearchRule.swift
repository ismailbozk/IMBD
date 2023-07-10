import Foundation

final class GETMovieSearchRule: APIRule {
    typealias SuccessResponseType = GETMovieSearchResponse

    let query: String

    init(query: String) {
        self.query = query
    }

    func makeRequest() throws -> URLRequest {
        guard let apiKey = IMDBAPIManager.apiKey else {
            throw APIError.accessTokenNotFound
        }

        var url = Current.api.baseURL().appendingPathComponent("movie/popular")
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        components.queryItems?.append(URLQueryItem(name: "query", value: query))
        url = components.url!

        // Create the URL request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        return request
    }

    func decodeSuccessResponse(data: Data) throws -> GETMovieSearchResponse {
        try Current.encoding.jsonDecoder().decode(GETMovieSearchResponse.self, from: data)
    }

    func decodeError4XXResponse(data: Data) throws -> Error {
        try Current.encoding.jsonDecoder().decode(ServerError.self, from: data)
    }
}
