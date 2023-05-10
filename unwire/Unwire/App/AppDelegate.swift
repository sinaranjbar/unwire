//
//  AppDelegate.swift
//  unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setup()
        return true
    }
    
    private func setup(){
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = NavigationController()
        appCoordinator = AppCoordinator(navigationController: navigationController, window: window)
        appCoordinator.start()
    }

}

