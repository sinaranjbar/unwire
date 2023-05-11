//
//  NetworkProviderProtocol.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

protocol NetworkProviderProtocol {
    var urlSession: SessionProtocol { get }
    var service: NetworkService { get }
    
    func request<T: Codable>(dataType: T.Type,
                             onQueue: DispatchQueue,
                             completion: @escaping (Result<T, Error>) -> Void)
}

final class NetworkProvider: NetworkProviderProtocol {
    private (set) var urlSession: SessionProtocol
    
    private (set) var service: NetworkService
    
    init(urlSession: SessionProtocol = SessionManager(), service: NetworkService){
        self.urlSession = urlSession
        self.service = service
    }
    
    func request<T>(dataType: T.Type,
                    onQueue: DispatchQueue = .main,
                    completion: @escaping (Result<T, Swift.Error>) -> Void) where T: Codable {
        let task = urlSession.dataTask(service.urlRequest, dataType: dataType) { result in
            onQueue.async {
                completion(result)
            }
        }
        task.resume()
    }
}
