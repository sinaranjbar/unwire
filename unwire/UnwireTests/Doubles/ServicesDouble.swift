//
//  ServicesDouble.swift
//  UnwireTests
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
@testable import Unwire

final class ServicesDouble: ServicesProtocol {
    var network: NetworkServices
    var imageCacheService: ImageCacheService
    
    init(){
        network = NetworkServices()
        imageCacheService = ImageCacheService(session: URLSessionMock())
    }
}
