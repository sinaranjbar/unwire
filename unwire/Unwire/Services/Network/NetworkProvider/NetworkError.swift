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
            return "internet_connection_error".localized
        case .notFound:
            return "request_not_found".localized
        case let .contentDecoding(error):
            return "error_while_decoding_with".localized + " \(error)"
        case .contentEmptyData:
            return "the_content_data_is_empty".localized
        default:
            return "network_error".localized
        }
    }
}
