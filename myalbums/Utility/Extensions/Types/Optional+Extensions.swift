//
//  Optional+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

extension Optional where Wrapped == String {
    
    var orEmpty: String {
        switch self {
        case .none:
            return ""
        case .some(let wrapped):
            return wrapped
        }
    }
}


extension Optional where Wrapped == Int {
    
    var orZero: Int {
        switch self {
        case .none:
            return .zero
        case .some(let wrapped):
            return wrapped
        }
    }
}
