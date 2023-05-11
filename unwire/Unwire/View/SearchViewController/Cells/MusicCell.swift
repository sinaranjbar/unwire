//
//  MusicCell.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
import UIKit

class MusicCell: UITableViewCell {
    @IBOutlet var artworkInageView: UIImageView!
    
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
}

extension MusicCell: TableViewCell {
    func configureCellWith(_ item: MusicModel) {
        collectionNameLabel.text = "\(item.collectionName) - \(item.artistName)"
        releaseDateLabel.text = item.releaseDate
        trackNameLabel.text = item.trackName
    }
}
