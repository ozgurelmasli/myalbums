//
//  TNetworkProviderBuilder.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Moya

/// MoyaProviderBuilder Layer
protocol TProviderBuilderProtocol {
    /// MoyaProvider Builder, NetworkLogger is Default Plugin Type
    /// - Parameter target: Network Target Type
    /// - Returns: MoyaProvider<T: NetworkTargetType>
    func build<T>(target: T) -> MoyaProvider<T> where T: NetworkTargetType
}

final class TProviderBuilder: TProviderBuilderProtocol {
    
    func build<T>(target: T) -> MoyaProvider<T> where T : NetworkTargetType {
        let plugins: [PluginType] = [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))] + target.plugins
        let provider = MoyaProvider<T>(plugins: plugins)
        
        return provider
    }
}
