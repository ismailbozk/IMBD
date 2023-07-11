//
//  MovieSearchView.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 11/07/2023.
//

import SwiftUI

public struct MovieSearchView: View {
    @StateObject var store: Store = WorldStateManager.store

    public var body: some View {
        VStack {
            MovieSearchBar(store: store)
            MovieListView(store: store)
        }
    }

    public init() {}
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
