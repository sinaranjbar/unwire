//
//  Environment.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

enum Environment {
    static let successStatusCodeRange: Range<Int> = 200 ..< 300
    static let requestDefaultTimeout: TimeInterval = 60
}

enum HttpHeaderKey {
    static let contentType = "Content-Type"
}

enum HttpMethod: String {
    case get = "GET"
}

enum MimeType: String {
    case json = "application/json"
}
