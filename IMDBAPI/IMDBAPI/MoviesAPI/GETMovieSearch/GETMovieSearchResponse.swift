import Foundation

public typealias GETMovieSearchResponse = [Movie]

public struct Movie: Codable, Identifiable {
    public let id: Int
    public let title: String
    public let overview: String
    public let posterPath: String
}
