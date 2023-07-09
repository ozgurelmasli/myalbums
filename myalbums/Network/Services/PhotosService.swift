//
//  PhotosService.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Moya

enum PhotosService {
    case getPhotos
}

extension PhotosService: NetworkTargetType {
    var path: String {
        switch self {
        case .getPhotos:
            return "photos"
        }
    }
    
    var method: Method {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getPhotos:
            return .requestPlain
        }
    }
}
