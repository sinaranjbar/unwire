//
//  SearchViewModel.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation
import Combine

class SearchViewModel: ViewModelProtocol {
    @Published private (set) var datasource: [MusicModel] = [MusicModel]()
    @Published private (set) var showError: Bool = false
    
    var title: String = "search".localized
    var errorMessage: String?
    var musicRepository: MusicRepository
    var networkService: MusicNetworkService
    
    private var cancellables = Set<AnyCancellable>()
    
    init(musicNetworkService: MusicNetworkService) {
        self.networkService = musicNetworkService
        self.musicRepository = MusicRepository()
    }
    
    func searchItem(term: String) {
        self.networkService.term = term
        musicRepository.searchTerm(musicNetworkService: networkService)
        
        musicRepository.$musics.sink { musics in
            self.handleSuccess(data: musics)
        }
        .store(in: &cancellables)
        
        musicRepository.$error.sink { error in
            guard let error = error else { return }
            self.handleFailure(error: error)
        }
        .store(in: &cancellables)
    }
}

private extension SearchViewModel {
    func handleSuccess(data: [MusicModel]) {
        datasource = data
    }
    
    func handleFailure(error: NetworkError) {
        errorMessage = "\(error)"
        datasource = []
        showError = true
    }
}
