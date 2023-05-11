//
//  MusicRepositoryMock.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation

@testable import Unwire

class MusicRepositoryMock: MusicRepository {
    
    var musicList: MusicList = {
        var musics = MusicList()
        if let path = Bundle.main.path(forResource: "sample_music", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode(MusicList.self, from: data) {
                    musics = decoded
                }
            } catch {
                
            }
        }
        return musics
    }()
    
    var failure: Bool = false
    
    override func searchTerm(musicNetworkService: Unwire.MusicNetworkService) {
        switch failure {
        case true:
            self.error = .connectionError
        case false:
            self.musics = musicList.results
        }
        client = NetworkProviderMock(urlSession: SessionManager(session: URLSessionMock()), service: musicNetworkService)
    }
    
}
