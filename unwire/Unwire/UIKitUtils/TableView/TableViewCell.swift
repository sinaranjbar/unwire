//
//  TableViewCell.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import UIKit

protocol TableViewCell: UITableViewCell {
    associatedtype CellViewModel
    func configureCellWith(_ item: CellViewModel, imageCacheService: ImageCacheService?)
    var imageCacheService: ImageCacheService? { get }
}
