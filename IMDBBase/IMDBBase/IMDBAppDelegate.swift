//
//  IMDBAppDelegate.swift
//  IMDBBase
//
//  Created by Ismail Bozkurt on 16/07/2023.
//

import UIKit
import IMDBAPI

@UIApplicationMain
final class IMDBAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        IMDBAPIManager.configure(environment: .development, apiKey: Current.app.apiKey())
        print("App delegate connected")
        return true
    }

    //func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
       // let sceneConfig: UISceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        //  sceneConfig.delegateClass = IMDBSceneDelegate.self
      //  return sceneConfig
    //}
}
