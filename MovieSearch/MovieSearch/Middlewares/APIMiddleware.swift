//
//  APIMiddleware.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation
import IMDBAPI

final class ApiMiddleware {
    static func appMiddleware(store: Store,
                              action: AppAction,
                              next: @escaping (AppAction) -> Void) {
        switch action {
        case let .requestMovies(query):
            // Call the next function with the current action to update the loading status and query
            next(action)

            Task {
                do {
                    let response = try await Current.movieAPI.movieSearch(query: query)
                    await store.dispatch(action: .receiveMovies(movies: response.results, error: nil))
                } catch {
                    await store.dispatch(action: .receiveMovies(movies: [], error: error))
                }
            }
        default:
            // Call the next function with the current action to continue the chain
            next(action)
        }
    }
}
