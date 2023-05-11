//
//  MusicList.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation

struct MusicList: Codable {
    let resultCount: Int
    let results: [MusicModel]
    
    enum CodingKeys: String, CodingKey {
      case results, resultCount
    }
    
    init(resultCount: Int = 0, results: [MusicModel] = []) {
        self.resultCount = resultCount
        self.results = results
    }
}
