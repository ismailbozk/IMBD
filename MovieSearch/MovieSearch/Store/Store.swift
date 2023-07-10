//
//  Store.swift
//  MovieSearch
//
//  Created by Ismail Bozkurt on 10/07/2023.
//

import Foundation

class Store: ObservableObject {
    @Published var state: AppState
    let reducer: (inout AppState, AppAction) -> AppState
    let middleware: ((Store, AppAction, @escaping (AppAction) -> Void) -> Void)?

    init(state: AppState,
         reducer: @escaping (inout AppState, AppAction) -> AppState,
         middleware: ((Store, AppAction, @escaping (AppAction) -> Void) -> Void)? = nil) {
        self.state = state
        self.reducer = reducer
        self.middleware = middleware
    }

    @MainActor
    func dispatch(action: AppAction) {
        // Call the middleware if provided

        self.state = reducer(&self.state, action)

        middleware?(self, action) { [weak self] newAction in
            // Update the state by calling the reducer with the current state and the new action
            guard let self else {
                return
            }
            self.state = self.reducer(&self.state, newAction)
        }
    }
}
