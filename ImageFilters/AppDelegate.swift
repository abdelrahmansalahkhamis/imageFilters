//
//  AppDelegate.swift
//  ImageFilters
//
//  Created by abdrahman on 04/06/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: HomeVC())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }


}

