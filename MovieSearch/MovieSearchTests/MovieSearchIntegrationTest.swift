//
//  MovieSearchIntegrationTest.swift
//  MovieSearchTests
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import XCTest
@testable import MovieSearch
import IMDBAPI
import Combine

final class MovieSearchIntegrationTest: XCTestCase {

    override func setUpWithError() throws {
        // GIVEN user is on a valid endpoint
        Current.movieAPI = MockMovieAPI()
    }

    func test_Store_whenUserMakesASearch_happyPath() async throws {
        // GIVEN user trigger landed on app
        let state = AppState.init(movies: [], loading: false, query: "", error: nil)
        let store = Store(state: state, reducer: AppReducer.appReducer(state:action:), middleware: ApiMiddleware.appMiddleware)
        
        // And an expectation for receiving movies from API
        let expectation = XCTestExpectation(description: "Receive movies from API")
        
        // And a cancellable set to store the subscriptions
        var cancellables = Set<AnyCancellable>()
        
        // When a requestMovies action is dispatched with a query
        let action = AppAction.requestMovies(query: "Terminator")
        
        // And the store's state should emit a new value with the movies array, false loading status, and nil error after some time
        store.$state
            .drop(while: { $0.movies.count == 0 }) // Drop until loading finishes
            .first()
            .sink { state in
                XCTAssertEqual(state.movies, MockMovieAPI().movies)
                XCTAssertFalse(state.loading)
                XCTAssertNil(state.error)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        await store.dispatch(action: action)
        
        // Then the store's state should be updated with the loading status and query
        XCTAssertEqual(store.state.loading, true)
        XCTAssertEqual(store.state.query, "Terminator")
        
        await fulfillment(of: [expectation], timeout: 10.0)
    }

}
