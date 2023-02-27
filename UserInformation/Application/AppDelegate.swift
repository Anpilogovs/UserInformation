//
//  AppDelegate.swift
//  UserInformation
//
//  Created by Сергей Анпилогов on 27.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(rootViewController: MainTableViewController())
        if #available(iOS 13.0, *) {
            navigationController.navigationBar.scrollEdgeAppearance =
            navigationController.navigationBar.standardAppearance
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: MainTableViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
}
