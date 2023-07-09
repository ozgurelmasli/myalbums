//
//  UIImageView+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    enum ImageSourceType {
        case url(String, UIImage?)
        case image(UIImage)
    }
    
    func setImage( _ source: ImageSourceType) {
        switch source {
        case .image(let sourceImage):
            self.image = sourceImage
        case .url(let urlString, let placeholder):
            guard let url = URL(string: urlString) else { return }
            remoteSource(url: url, placeholder: placeholder)
        }
    }
    
    private func remoteSource(url: URL, placeholder: UIImage?) {
        let options: KingfisherOptionsInfo = [
            .transition(.fade(0.2))
        ]
        let resource = ImageResource(downloadURL: url, cacheKey: url.absoluteString)
        kf.setImage(with: resource,
                    placeholder: placeholder,
                    options: options)
    }
}
