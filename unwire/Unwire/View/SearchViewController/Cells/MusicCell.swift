//
//  MusicCell.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
import UIKit
import Combine

class MusicCell: UITableViewCell {
    var imageCacheService: ImageCacheService?
    
    private (set) var cancellables = Set<AnyCancellable>()
    
    
    @IBOutlet var artworkInageView: UIImageView!
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.artworkInageView.image = UIImage()
    }
    
    func setImage(_ item: MusicModel){
        imageCacheService?.loadImage(urlString: item.artworkUrl100, completion: { image in
            self.artworkInageView.image = image
        })
    }
}

extension MusicCell: TableViewCell {
    func configureCellWith(_ item: MusicModel, imageCacheService: ImageCacheService?) {
        self.imageCacheService = imageCacheService
        setImage(item)
        collectionNameLabel.text = "\(item.collectionName) - \(item.artistName)"
        releaseDateLabel.text = item.releaseDate
        trackNameLabel.text = item.trackName
        artworkInageView.clipsToBounds = true
        artworkInageView.layer.cornerRadius = 8
    }
    
}
