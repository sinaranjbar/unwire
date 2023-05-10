//
//  AppCoordinator.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    enum Destination {
        case Search
    }
    
    let window: UIWindow?
    
    var navigationController: UINavigationController
    
    var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    var services: Services
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
        self.services = Services()
        super.init()
    }
    
    func start(animated: Bool) {
        guard let window = window else { return }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        goTo(destination: .Search)
    }
    
    func goTo(destination: Destination){
        switch destination {
        case .Search:
            let searchViewController = SearchViewController.make(services.network.musicNetworkService)
            searchViewController.coordinator = self
            navigationController.pushViewController(searchViewController, animated: true)
        }
    }
    
}
