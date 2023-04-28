//
//  AppDelegate.swift
//  Verregular
//
//  Created by Miroslav Deryuga on 22.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // необходимо указать, что тот экран с кот стартует прил и есть класс вью контроллер. инициализируем виндоу и навигейшн контроллер
        self.window = UIWindow(frame: UIScreen.main.bounds)
    
        if let window = window {
            let navigationController = UINavigationController()
            navigationController.viewControllers = [HomeViewController()]
            window.rootViewController = navigationController
            window.makeKeyAndVisible() // to make window visible on screen
        }
        return true
    }
}

