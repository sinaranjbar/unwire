//
//  ImageCacheService.swift
//  Unwire
//
//  Created by Sina Ranjbar on 5/11/23.
//

import Foundation
import UIKit

final class ImageCacheService {
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    private let urlSession: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.urlSession = session
    }
    
    func loadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            completion(cacheImage)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        urlSession.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            self?.imageCache.setObject(image, forKey: urlString as AnyObject)
            
            DispatchQueue.main.async {
                completion(image)
            }
        }.resume()
    }
    
}
