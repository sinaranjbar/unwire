//
//  SessionMock.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire

class NetworkProviderMock: NetworkProviderProtocol {
    var urlSession: Unwire.SessionProtocol
    
    var service: Unwire.NetworkService
    
    init(urlSession: SessionProtocol, service: NetworkService){
        self.urlSession = urlSession
        self.service = service
    }
    
    func request<T>(dataType: T.Type, onQueue: DispatchQueue, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        let task = urlSession.dataTask(service.urlRequest, dataType: dataType) { result in
            onQueue.async {
                completion(result)
            }
        }
        task.resume()
    }
    

    
}
