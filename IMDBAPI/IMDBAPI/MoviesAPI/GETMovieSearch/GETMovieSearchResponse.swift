import Foundation

public typealias GETMovieSearchResponse = [Movie]

public struct Movie: Codable, Identifiable, Equatable {
    public let id: Int
    public let title: String
    public let overview: String
    public let posterPath: String

    public init(id: Int, title: String, overview: String, posterPath: String) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
}
