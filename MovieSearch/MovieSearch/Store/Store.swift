//
//  Store.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation
import IMDBUI

class Store: ObservableObject {
    @Published var state: AppState
    let reducer: (inout AppState, AppAction) -> AppState
    let middlewares: [((Store, AppAction, @escaping (AppAction) -> Void) -> Void)]

    init(state: AppState,
         reducer: @escaping (inout AppState, AppAction) -> AppState,
         middlewares: [((Store, AppAction, @escaping (AppAction) -> Void) -> Void)] = []
    ) {
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }

    @MainActor
    func dispatch(action: AppAction) {
        // Call the middleware if provided

        self.state = reducer(&self.state, action)

        for middleware in middlewares {
            middleware(self, action) { [weak self] newAction in
                // Update the state by calling the reducer with the current state and the new action
                guard let self else {
                    return
                }
                self.state = self.reducer(&self.state, newAction)
            }
        }
    }
}
