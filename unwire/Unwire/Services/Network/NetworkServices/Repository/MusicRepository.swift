//
//  MusicRepository.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation
import Combine

class MusicRepository: MusicRepositoryProtocol {
    var client: NetworkProviderProtocol?
    
    @Published var musics = [MusicModel]()
    @Published var error: NetworkError?

    func searchTerm(musicNetworkService: MusicNetworkService) {
        client = NetworkProvider(service: musicNetworkService)
        client?.request(dataType: MusicList.self, onQueue: .main, completion: { result in
            do {
                self.musics = try result.get().results
            } catch {
                self.error = error as? NetworkError
            }
        })
    }
    
}
