//
//  NetworkTargetType.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 8.07.2023.
//

import Moya

/// Extensions Layer for Default Moya TargetType
protocol NetworkTargetType: TargetType {
    var plugins: [PluginType] { get }
}

extension NetworkTargetType {
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var plugins: [PluginType] {
        return []
    }
    
    var sampleData: Data {
        return Data()
    }
}
