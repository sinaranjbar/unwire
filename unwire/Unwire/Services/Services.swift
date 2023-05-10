//
//  Services.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

import Foundation

protocol ServicesProtocol: AnyObject {
    var network: NetworkServices { get }
}

struct NetworkServices {
    let musicNetworkService: MusicNetworkService
    
    init() {
        self.musicNetworkService = MusicNetworkService()
    }
}

final class Services: ServicesProtocol {
    var network: NetworkServices
    
    init() {
        network = NetworkServices()
    }
}
