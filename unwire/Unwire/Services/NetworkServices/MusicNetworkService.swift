//
//  MusicNetworkService.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

struct MusicNetworkService: NetworkService {
    var baseURL: String {
        CommonNetworkService.baseURL
    }
    
    var method: HttpMethod {
        .get
    }
    
    var httpBody: Encodable? {
        nil
    }
    
    var headers: [String: String]? {
        [HttpHeaderKey.contentType: MimeType.json.rawValue]
    }
    
    var queryParameters: [URLQueryItem]? {
        var params = CommonNetworkService.queryItems
        params.append(URLQueryItem(name: "term", value: term))
        params.append(URLQueryItem(name: "media", value: media.rawValue))
        return params
    }
    
    var timeout: TimeInterval? {
        30
    }

    var term: String = ""
    
    var media: CommonNetworkService.Media = .music
    
    var path: String {
        "/search"
    }
}
