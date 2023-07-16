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
        ZStack {
            VStack {
                MovieSearchBar(store: store)
                MovieListView(store: store)
            }
            if store.state.loading {
                EmptyView()
                    .foregroundColor(.white.opacity(0.2))
                    .blur(radius: 20)
                ActivityIndicator(isAnimating: $store.state.loading, style: .large)
            }
        }
    }

    public init() {}
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
