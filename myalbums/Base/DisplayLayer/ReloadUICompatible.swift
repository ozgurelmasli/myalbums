//
//  ReloadUICompatible.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import Foundation

@objc protocol ReloadUICompatible: AnyObject {
    @objc optional func reloadUI()
}
