//
//  IMDBBaseApp.swift
//  IMDBBase
//
//  Created by Ismail Bozkurt on 09/07/2023.
//

import SwiftUI
import IMDBAPI

@main
struct IMDBBaseApp: App {
    init() {
        IMDBAPIManager.configure(environment: .development, apiKey: Current.app.apiKey())
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
