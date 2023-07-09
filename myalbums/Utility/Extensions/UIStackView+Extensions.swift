//
//  UIStackView+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

extension UIStackView {
    
    func setLayoutMargins( _ edgeInsets: UIEdgeInsets = BaseConstants.edgeInsets) {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = edgeInsets
    }
}
