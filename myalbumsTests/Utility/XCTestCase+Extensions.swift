//
//  XCTestCase+Extensions.swift
//  myalbumsTests
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import XCTest

enum MockFiles: String {
    case albumsResponse = "mock_albums_response"
    case photosResponse = "mock_photos_response"
}

enum TestError: Error {
    case fileNotFound
}

extension XCTestCase {
    
    /// Mock data from files
    /// - Parameter mockFile: Mock File
    /// - Returns: Data
    func getMockData( _ mockFile: MockFiles) throws -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: mockFile.rawValue, withExtension: "json") else {
            XCTFail("Missing File: \(mockFile.rawValue).json")
            throw TestError.fileNotFound
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw error
        }
    }
}
