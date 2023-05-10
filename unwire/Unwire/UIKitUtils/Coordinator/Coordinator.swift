//
//  Coordinator.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController {get set}
    var parentCoordinator: Coordinator? {get set}
    var childCoordinators: [Coordinator] {get set}
    func start(animated: Bool)
    func finish()
}


extension Coordinator {
    func start(){
        start(animated: true)
    }
    
    func childDidFinish(_ child: Coordinator){
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child{
            childCoordinators.remove(at: index)
            break
        }
    }
    
    func finish(){}
}
