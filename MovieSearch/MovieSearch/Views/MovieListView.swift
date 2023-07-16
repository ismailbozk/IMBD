//
//  MovieListView.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import SwiftUI
import IMDBAPI

struct MovieListView: View {
    @StateObject var store: Store

    var body: some View {
        List(store.state.movies) { movie in
            HStack {
                Text(movie.title)
                    .padding()
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                store.dispatch(action: .selectMovie(movie: movie))
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var movies = [Movie(id: 1, title: "Terminator", overview: "desc", posterPath: "/img.jpg")]
    static var store = Store(state: AppState(movies: movies),
                      reducer: AppReducer.appReducer(state:action:),
                           middlewares: [ApiMiddleware.appMiddleware, NavigationMiddleware.appMiddleware])
    static var previews: some View {
        MovieListView(store: WorldStateManager.store)
    }
}
