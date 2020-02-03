//
//  CustomImage.swift
//  TopNews
//
//  Created by Student Loaner 3 on 1/25/20.
//  Copyright © 2020 Maximo Hinojosa. All rights reserved.
//

import Foundation
import UIKit

class CustomImage: UIImageView {
    var imageUrlString: String?
    
    public static func image(data: Data) -> CustomImage {
        let image = UIImage(data: data)
        let imageView = CustomImage(image: image)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}
let imageCache = NSCache<AnyObject, AnyObject>()


extension CustomImage {
    func loadImage(urlString: String?) {
        guard let urlString = urlString else { return }
        let url = URL(string: urlString)
        self.image = nil

        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("ERROR: \(error)")
                return
            }
            let imageToCache = UIImage(data: data!)
            DispatchQueue.main.async {
                
//                if self.imageUrlString == urlString {
//                    self.image = imageToCache
//                }
                self.image = imageToCache

                imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
            }
        }.resume()
    }
}
