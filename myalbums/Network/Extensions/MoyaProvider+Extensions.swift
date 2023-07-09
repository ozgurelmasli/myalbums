//
//  MoyaProvider+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Moya

extension MoyaProvider {
    
    /// Network Request Func with Swift Concurrency
    /// - Parameter target: Network Target Type
    /// - Returns: Generic Decodable Type
    func request<T: Decodable>(_ target: Target) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            self.request(target) { result in
                switch result {
                case .success(let response):
                    guard let decodedData = try? JSONDecoder().decode(T.self, from: response.data) else {
                        continuation.resume(throwing: TServiceError.decodeError)
                        return
                    }
                    continuation.resume(returning: decodedData)
                case .failure(let error):
                    let error: TServiceError = .init(code: error.errorCode, message: error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
