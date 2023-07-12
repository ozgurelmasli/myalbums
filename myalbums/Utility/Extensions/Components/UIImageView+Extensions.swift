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
        /// Remote resource, Placeholder Image
        case url(String, UIImage?)
        
        /// Local
        case image(UIImage)
    }
    
    /// Set Image depends on resource type
    /// - Parameter source: Remote or Local
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
