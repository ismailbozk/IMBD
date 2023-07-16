//
//  NavigationMiddleware.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import IMDBAPI

final class NavigationMiddleware {
    static func appMiddleware(store: Store,
                              action: AppAction,
                              next: @escaping (AppAction) -> Void) {
        switch action {
        case .selectMovie(let movie):
            let coordinator = MovieSearchCoordinator(context: Gateway.coordinatorContext())
            coordinator.navigate(.selectMovie(context: MovieDetailContext(movie: movie)))
        default:
            break
        }
        next(action)
    }
}
