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
        
        cache.memoryStorage.config.totalCostLimit = 1024 * 1024 * 10
        cache.diskStorage.config.sizeLimit = 1024 * 1024 * 100
    }
}
