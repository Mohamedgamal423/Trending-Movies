//
//  AppDelegate.swift
//  Trending Movies
//
//  Created by Mohamed on 28/11/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navcontroller = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = navcontroller
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

