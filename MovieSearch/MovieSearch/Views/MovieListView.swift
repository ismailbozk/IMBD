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
//    var movies: [Movie]
    var body: some View {
//        Text("s")
        List(store.state.movies) { movie in
            HStack {
                Text(movie.title)
                    .padding()
            }
        }
//        List(movies) { movie in
//            HStack {
//                Text(movie.title)
//                    .padding()
//            }
//        }
    }
}

//struct MovieListView_Previews: PreviewProvider {
//    let store = Store(state: AppState(movies: [Movie(id: 1, title: "Terminator", overview: "desc", posterPath: "/img.jpg")]),
//                      reducer: AppReducer.appReducer(state:action:),
//                      middleware: ApiMiddleware.appMiddleware)
//    static var previews: some View {
//        MovieListView(store: WorldStateManager.store, movies: [Movie(id: 1, title: "Terminator", overview: "desc", posterPath: "/img.jpg")])
//    }
//}
