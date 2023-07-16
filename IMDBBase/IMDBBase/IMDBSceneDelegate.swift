//
//  IMDBSceneDelegate.swift
//  IMDBBase
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import Foundation
import UIKit
import IMDBUI
import MovieSearch

class IMDBSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }

        print("Scene connected")
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let mainScreen = ContentView()
        let navigationController = IMDBNavigationController()
        navigationController.setInitialView(view: mainScreen)
        MovieSearch.Gateway.coordinatorContext = { navigationController }

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
