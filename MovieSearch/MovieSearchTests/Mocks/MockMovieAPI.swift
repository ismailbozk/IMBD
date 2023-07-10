import Foundation
import IMDBAPI
@testable import MovieSearch
import XCTest

final class MockMovieAPI: MovieAPIProtocol {
    let expectation = XCTestExpectation(description: "Receive movies from API")

    func movieSearch(query: String) async throws -> IMDBAPI.GETMovieSearchResponse {
        // wait 1 seconds
        try await Task.sleep(nanoseconds: 1_000_000_000)

        return movies
    }

    var movies: [Movie] {
        [
            Movie(id: 1, title: "Terminator", overview: "desc 1", posterPath: "/image.jpg"),
            Movie(id: 2, title: "Terminator 2", overview: "desc 12", posterPath: "/image2.jpg")
        ]
    }
}
