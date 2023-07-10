//
//  MovieListView.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import SwiftUI

struct MovieListView: View {
    @StateObject var store: Store

    var body: some View {
        HStack {
            Text("PArent: \(store.state.loading ? "YES" : "NO")")
            M1(state: $store.state)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {

    static var previews: some View {
        MovieListView(store: WorldStateManager.store)
    }
}

struct M1: View {
    @Binding var state: AppState

    var body: some View {
        VStack {
            Text("isloading: \(state.loading ? "YES" : "NO")")
            Button("Toggle") {
                state.loading.toggle()
            }
        }
    }
}
