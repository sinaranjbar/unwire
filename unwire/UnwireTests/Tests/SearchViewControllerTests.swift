//
//  SearchViewControllerTests.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire
import XCTest

class SearchViewControllerTests: XCTestCase {
    var sut: SearchViewController!
    var services: ServicesDouble!
    
    override func setUp() {
        super.setUp()
        services = ServicesDouble()
        sut = .make((network: services.network.musicNetworkService, imageCacheService: services.imageCacheService))
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    
    func test_tableDataSource_initial_empty() {
        sut.loadViewIfNeeded()
        let numberOfRows = sut.tableViewDataSource.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 0)
    }
    
    func test_tableDataSource_load() {
        let viewModel = SearchViewModel(musicNetworkService: services.network.musicNetworkService, musicRepository: MusicRepositoryMock())
        sut.loadViewIfNeeded()
        sut.viewModel = viewModel
        sut.loadData("eminem")
        
        let music = viewModel.$datasource.collect(1)
        let _ = try! awaitPublisher(music)
        let numberOfRows = sut.tableViewDataSource.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 50)
        
        let firstCell = sut.tableViewDataSource.tableView(sut.tableView, cellForRowAt: IndexPath(item: 0, section: 0))
        XCTAssertTrue(firstCell is MusicCell)
    }
    
    func test_searchBar_placeholder() {
        sut.loadViewIfNeeded()
        let placeholder = sut.searchBar.searchBar.placeholder
        XCTAssertEqual(placeholder, "search".localized)
    }
    
}
