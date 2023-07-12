//
//  ReloadUICompatible.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import Foundation

protocol ReloadUICompatible: AnyObject {
    func reloadUI()
}

extension ReloadUICompatible {
    func reloadUI() { }
}
