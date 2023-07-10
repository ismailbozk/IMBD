//
//  AppState.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation
import IMDBAPI

/// App state for the movie search module
struct AppState {
    var movies: [IMDBAPI.Movie] = []
    var loading: Bool = false
    var query: String = ""
    var error: Error? = nil
}

extension AppState: Equatable {
    static func == (lhs: AppState, rhs: AppState) -> Bool {
        lhs.loading == rhs.loading &&
        lhs.query == rhs.query &&
        lhs.movies == rhs.movies &&
        (lhs.error == nil) == (rhs.error == nil)
    }
}
