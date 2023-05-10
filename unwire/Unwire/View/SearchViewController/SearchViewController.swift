//
//  SearchViewController.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, ViewControllerFactory {
    typealias Dependencies = String
    
    weak var coordinator: AppCoordinator?
    
    static var storyboard: UIStoryboard = .main
    
    var dependencies: String!
    
}
