//
//  SearchViewModel.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

class SearchViewModel: ViewModelProtocol {
    var title: String = "Search"
    
    var showError: Bool = false
    
    var errorMessage: String?
    
    var datasource: [MusicModel] = [MusicModel]()
    
    var musicRepository: MusicRepository
    
    var networkService: MusicNetworkService
    
    init(musicNetworkService: MusicNetworkService) {
        self.networkService = musicNetworkService
        self.musicRepository = MusicRepository()
    }
    
    func searchItem(term: String) {
        self.networkService.term = term
        musicRepository.searchTerm(musicNetworkService: networkService)
    }
}
