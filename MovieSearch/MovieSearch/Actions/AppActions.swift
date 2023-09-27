//
//  AppActions.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation
import IMDBAPI

enum AppAction {
    case requestMovies(query: String)
    case receiveMovies(movies: [Movie], error: Error?)
    case updateQuery(query: String)
    case selectMovie(movie: Movie)
    case navigateBackToSearch
}

extension AppAction: Equatable {
    static func == (lhs: AppAction, rhs: AppAction) -> Bool {
        switch (lhs, rhs) {
        case (.requestMovies(let lq), .requestMovies(let rq)):
            return lq == rq
        case (.receiveMovies(let lm, let le), .receiveMovies(let rm, error: let re)):
            return lm == rm &&
            ((le == nil) == (re == nil))
        case (.updateQuery(let lq), .updateQuery(let rq)):
            return lq == rq
        case (.selectMovie(let lm), .selectMovie(let rm)):
            return lm == rm
        case (.navigateBackToSearch, .navigateBackToSearch):
            return true
        case (_, _):
            return false
        }
    }
}
