//
//  AppCoordinationTests.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire
import XCTest

class AppCoordinatorTest: XCTestCase {
    var sut: AppCoordinator?
    var window: UIWindow?
    
    override func tearDownWithError() throws {
        sut = nil
        window = nil
        try? super.tearDownWithError()
    }
    
    override func setUp() {
        let nav = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        sut = AppCoordinator(navigationController: nav, window: window)
    }
    
    override func tearDown() {
        sut = nil
        window = nil
    }
    
    
    func test_gotoSearch() throws{
        sut?.goTo(destination: .Search)
        let searchViewController = sut?.navigationController.viewControllers[0] as? SearchViewController
        XCTAssertNotNil(searchViewController, "Check if vc vsc is detailVC")
    }
}
