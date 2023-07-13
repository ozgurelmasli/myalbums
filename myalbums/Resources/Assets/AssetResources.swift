//
//  AssetResources.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Kingfisher

final class AssetResources {
    
    static func configure() {
        let cache = ImageCache.default
        
        // Time interval 2 minutes.
        cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 10
        cache.diskStorage.config.sizeLimit = 1024 * 1024 * 100
    }
    
    /// Color Resources
    static func colors() -> _R.color {
        return R.color
    }
    
    /// Image Resources
    static func images() -> _R.image {
        return R.image
    }
}
