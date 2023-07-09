//
//  AlbumsService.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Moya

enum AlbumsService {
    case getAlbums
}

extension AlbumsService: NetworkTargetType {
    var path: String {
        switch self {
        case .getAlbums:
            return "albums"
        }
    }
    
    var method: Method {
        switch self {
        case .getAlbums:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAlbums:
            return .requestPlain
        }
    }
}
