//
//  UIImage+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

extension UIImage {
    
    /// Image Resources
    static let imageResources = AssetResources.images()
    
    //MARK: -> SF Symbols
    
    /// Album User Icon
    static let ic_album_user_circle = UIImage(systemName: "person.crop.circle.fill")
    
    /// Album Filter Active Icon
    static let ic_filter_active = UIImage(systemName: "checkmark.circle.fill")
    
    /// Showcase Placeholder Image
    static let img_showcase_placeholder = UIImage(systemName: "photo.fill")
    
    /// Photo Placeholder Image
    static let img_photo_placeholder = UIImage(systemName: "photo.on.rectangle")
}
