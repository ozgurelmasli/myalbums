//
//  UIFont+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

extension UIFont {
    
    enum Style: String {
        case regular = "Regular"
        case black   = "Black"
        case heavy   = "Heavy"
        case medium  = "Medium"
    }
    
    static func font( _ style: Style, size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-\(style.rawValue)", size: size) ?? .systemFont(ofSize: size)
    }
}
