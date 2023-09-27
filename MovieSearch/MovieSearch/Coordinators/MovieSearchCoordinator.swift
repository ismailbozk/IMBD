//
//  MovieSearchCoordinator.swift
//  IMDBBase
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import SwiftUI
import IMDBUI
import IMDBAPI

struct MovieDetailContext {
    let movie: Movie
}

enum MovieSearchRoute: IMDBUI.Route {
    case selectMovie(context: MovieDetailContext)
}

final class MovieSearchCoordinator: Coordinator {

    private let navigationContext: NavigationContext

    init(context: NavigationContext) {
        self.navigationContext = context
    }

    func navigate(_ route: MovieSearchRoute) {
        switch route {
        case .selectMovie(let context):
            let detailScreen = MovieDetailView(movie: context.movie)
            navigationContext.push(view: detailScreen, animated: true)
        }
    }
}
