//
//  SearchViewController.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, ViewControllerFactory {
    typealias Dependencies = MusicNetworkService
    
    weak var coordinator: AppCoordinator?
    
    static var storyboard: UIStoryboard = .main
    
    var dependencies: MusicNetworkService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
