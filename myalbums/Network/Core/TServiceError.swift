//
//  TServiceError.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 8.07.2023.
//

/// Custom Error Type
struct TServiceError: Error {
    /// Error Code
    var code: Int
    /// Error message
    var message: String
    
    /// Unexpected Case Error Type
    static let somethingWentWrong: TServiceError = .init(code: 999, message: .stringResources.core_something_went_wrong_error_message())
    /// Decode Error
    static let decodeError: TServiceError = .init(code: 998, message: .stringResources.core_decode_error_message())
}
