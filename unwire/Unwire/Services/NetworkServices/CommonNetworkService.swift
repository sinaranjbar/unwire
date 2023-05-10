//
//  CommonNetworkService.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

enum CommonNetworkService {
    enum Media: String {
        case music
    }
    
    static let supportedLanguages = Set(Bundle.main.localizations)
    
    static var baseURL: String {
        let apiBaseURL: String = "itunes.apple.com"
        return "https://\(apiBaseURL)/"
    }
    
    static var country: String {
        return "dk"
    }
    
    static var queryItems: [URLQueryItem] {
        let country = URLQueryItem(name: "country", value: country)
        return [country]
    }
}
