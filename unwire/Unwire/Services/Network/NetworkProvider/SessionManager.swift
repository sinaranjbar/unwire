//
//  Session.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

typealias CodableResponse<T: Codable> = (Result<T, Error>) -> Void

class SessionManager: SessionProtocol {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func dataTask<T: Decodable>(_ request: URLRequest,
                                dataType: T.Type,
                                completion: @escaping CodableResponse<T> ) -> URLSessionDataTask {
        return session.dataTask(with: request) { [weak self] data, response, error in
            completion(Result<T, Error> {
                guard let self = self else {
                    throw NetworkError.connectionError
                }
                
                if let requestError = error {
                    throw NetworkError.unknownError
                }
                
                try self.validate(response: response, statusCodes: Environment.successStatusCodeRange)
                return try self.decode(data: data, type: dataType)
            })
        }
    }
}

private extension SessionManager {
    func validate(response: URLResponse?, statusCodes: Range<Int>) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }
        
        if !statusCodes.contains(httpResponse.statusCode) {
            throw NetworkError.unknownError
        }
    }
    
    func decode<T: Decodable>(data: Data?, type: T.Type) throws -> T {
        guard let data = data, !data.isEmpty else {
            throw NetworkError.contentEmptyData
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.contentDecoding(error: error)
        }
    }
}
