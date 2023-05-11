//
//  MusicRepositoryTests.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import XCTest
@testable import Unwire

class SearchViewModelTests: XCTestCase {
    var services: ServicesDouble!
    
    override func setUp() {
        services = ServicesDouble()
    }
    
    override func tearDown() {
        services = nil
    }
    
    func test_searchTerm_success(){
        let viewModel = SearchViewModel(musicNetworkService: services.network.musicNetworkService, musicRepository: MusicRepositoryMock())
        viewModel.searchItem(term: "eminem")
        XCTAssertEqual(viewModel.musicRepository.client?.service.path, "/search")
        let music = viewModel.musicRepository.$musics.collect(1)
        let musicList = try! awaitPublisher(music)
        XCTAssertEqual(musicList.last?.count, 50)
    }
    
    func test_searchTerm_failure(){
        let repository = MusicRepositoryMock()
        repository.failure = true
        let viewModel = SearchViewModel(musicNetworkService: services.network.musicNetworkService, musicRepository: repository)
        viewModel.searchItem(term: "")
        XCTAssertEqual(viewModel.musicRepository.client?.service.path, "/search")
        let music = viewModel.musicRepository.$musics.collect(1)
        let musicList = try! awaitPublisher(music)
        XCTAssertEqual(musicList.last?.count, 0)
        
        let error = viewModel.musicRepository.$error.collect(1)
        let networkError = try! awaitPublisher(error)
        XCTAssertEqual(networkError.last!!, NetworkError.connectionError)
    }
    
}
