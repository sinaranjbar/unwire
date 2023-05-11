//
//  NetworkError.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case unknownError
    case connectionError
    case notFound
    case contentDecoding(error: Error)
    case contentEmptyData
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .connectionError:
            return "Internet Connection Error"
        case .notFound:
            return "Request not found"
        case let .contentDecoding(error):
            return "Error while decoding with \(error)"
        case .contentEmptyData:
            return "The contyent data is empty"
        default:
            return "Network Error with` \(self)` thrown"
        }
    }
}
