//
//  MockNetwork.swift
//  myalbumsTests
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

@testable import myalbums
import XCTest

final class MockNetwork: TNetworkProtocol {
    
    var mockData: Data?
    var error: TServiceError?
    
    var isRequestCalled: Bool = false
    var requestCallCount: Int = 0
    
    func request<T, R>(target: T) async throws -> R? where T : NetworkTargetType, R : Decodable, R : Encodable {
        isRequestCalled = true
        requestCallCount += 1
        
        if let data = mockData {
            do {
               return try JSONDecoder().decode(R.self, from: data)
            } catch {
                throw TServiceError.decodeError
            }
        }

        throw error ?? .somethingWentWrong
    }
}
