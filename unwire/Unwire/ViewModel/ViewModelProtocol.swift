//
//  ViewModelProtocol.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/10/23.
//

protocol ViewModelProtocol {
    associatedtype DataItem
    associatedtype NetworkItem
    
    var title: String { get }
    var datasource: DataItem { get }
    var showError: Bool { get }
    var errorMessage: String? { get }
    var networkService: NetworkItem { get }
    
}
