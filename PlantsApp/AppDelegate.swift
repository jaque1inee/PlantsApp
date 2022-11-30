//
//  AppDelegate.swift
//  SecundProjectViewCode
//
//  Created by Jaqueline Oliveira on 25/11/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let initialViewController = ViewController()
        let navController = UINavigationController(rootViewController: initialViewController)
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
        
    }
    
}

