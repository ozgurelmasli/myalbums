//
//  TNetwork.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 8.07.2023.
//

import Moya

/// Network Layer
protocol TNetworkProtocol {
    /// Network Request func
    /// - Parameter target: NetworkTargetType
    /// - Returns: Encodable & Decodable type
    func request<T,R>(target: T) async throws -> R? where T: NetworkTargetType, R: Decodable, R: Encodable
}

final class TNetwork: TNetworkProtocol {
    
    private let providerBuilder: TProviderBuilderProtocol
    
    init(providerBuilder: TProviderBuilderProtocol = TProviderBuilder()) {
        self.providerBuilder = providerBuilder
    }
    
    func request<T,R>(target: T) async throws -> R? where T: NetworkTargetType, R: Decodable, R: Encodable {
        let provider = providerBuilder.build(target: target)
        do {
            let result: R? = try await provider.request(target)
            return result
        } catch let error as TServiceError {
            throw error
        } catch {
            throw TServiceError.somethingWentWrong
        }
    }
}
