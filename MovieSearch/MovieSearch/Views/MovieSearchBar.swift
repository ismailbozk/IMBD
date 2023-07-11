//
//  MovieSearchBar.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 11/07/2023.
//

import SwiftUI

struct MovieSearchBar: View {
    @StateObject var store: Store

    var body: some View {
        HStack {
            TextField("Type Movie, Cast or", text: $store.state.query)
                .textFieldStyle(.roundedBorder)
            Button("Search") {
                store.dispatch(action: .requestMovies(query: store.state.query))
            }.buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct MovieSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchBar(store: WorldStateManager.store)
    }
}
