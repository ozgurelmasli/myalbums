//
//  Array+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index < self.count else { return nil }
        return self[index]
    }
}
