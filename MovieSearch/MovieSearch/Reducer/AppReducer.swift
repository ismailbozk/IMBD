//
//  AppReducer.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation

final class AppReducer {
    class func appReducer(state: inout AppState, action: AppAction) -> AppState {
        switch action {
        case let .requestMovies(query):
            state.loading = true
            state.query = query
            state.error = nil
            return state
        case let .receiveMovies(movies, error):
            state.loading = false
            state.movies = movies
            state.error = error
            return state
        case let .updateQuery(query):
            state.loading = true
            state.query = query
            state.error = nil
            return state
        case .selectMovie(movie: _):
            return state
        case .navigateBackToSearch:
            return state
        }
    }
}
