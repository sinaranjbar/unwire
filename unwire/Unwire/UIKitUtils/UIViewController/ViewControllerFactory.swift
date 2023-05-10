//
//  ViewControllerFactory.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import UIKit

protocol ViewControllerFactory: UIViewController {
    associatedtype Dependencies

    typealias ViewController = Self

    static var storyboard: UIStoryboard { get }

    var dependencies: Dependencies! { get set }
    
    var coordinator: AppCoordinator? { get set }
}

extension ViewControllerFactory {
    static func make(_ dependencies: Dependencies) -> ViewController {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? ViewController else { return ViewController()}
        viewController.dependencies = dependencies
        return viewController
    }
}
