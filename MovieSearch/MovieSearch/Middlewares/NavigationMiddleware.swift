//
//  NavigationMiddleware.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import IMDBAPI

final class NavigationMiddleware {
    static var coordinator = MovieSearchCoordinator(context: Gateway.coordinatorContext())
    static func appMiddleware(store: Store,
                              action: AppAction,
                              next: @escaping (AppAction) -> Void) {
        switch action {
        case .selectMovie(let movie):
            coordinator.navigate(.selectMovie(context: MovieDetailContext(movie: movie)))
        case .navigateBackToSearch:
            coordinator.navigate(.dismissMovieDetails)
        default:
            break
        }
        next(action)
    }
}
