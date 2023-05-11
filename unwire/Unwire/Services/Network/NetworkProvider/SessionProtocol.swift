//
//  SessionProtocol.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

protocol SessionProtocol {
    func dataTask<T: Decodable>(_ request: URLRequest,
                                dataType: T.Type,
                                completion: @escaping CodableResponse<T>) -> URLSessionDataTask
}
