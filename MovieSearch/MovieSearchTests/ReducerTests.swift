//
//  ReducerTests.swift
//  MovieSearchTests
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import XCTest
import IMDBAPI
@testable import MovieSearch

final class ReducerTests: XCTestCase {

    func testAppReducer() {
        // Given an initial app state
        var state = AppState()

        // When a requestMovies action is dispatched with a query
        let action = AppAction.requestMovies(query: "Batman")

        // Then the state should be updated with the loading status and query
        state = AppReducer.appReducer(state: &state, action: action)
        XCTAssertTrue(state.loading)
        XCTAssertEqual(state.query, "Batman")

        // When a receiveMovies action is dispatched with an array of movies and nil error
        let movies = [createMockMovie()]
        let action2 = AppAction.receiveMovies(movies: movies, error: nil)

        // Then the state should be updated with the movies array, false loading status, and nil error
        state = AppReducer.appReducer(state: &state, action: action2)
        XCTAssertEqual(state.movies, movies)
        XCTAssertFalse(state.loading)
        XCTAssertNil(state.error)

        // When an updateQuery action is dispatched with a new query
        let action3 = AppAction.updateQuery(query: "Superman")

        // Then the state should be updated with the new query
        state = AppReducer.appReducer(state: &state, action: action3)
        XCTAssertEqual(state.query, "Superman")
    }

    func createMockMovie(id: Int = 1,
                         title: String = "Mock Movie",
                         overview: String = "Mock Overview",
                         posterPath: String = "/image.jpg") -> Movie {
        return Movie(id: id, title: title, overview: overview, posterPath: posterPath)
    }
}
