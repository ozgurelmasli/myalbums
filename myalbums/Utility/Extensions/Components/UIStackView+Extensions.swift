//
//  UIStackView+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

extension UIStackView {
    
    /// Set Layout Margin with edgeInsets
    /// - Parameter edgeInsets
    func setLayoutMargins( _ edgeInsets: UIEdgeInsets = BaseConstants.edgeInsets) {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = edgeInsets
    }
}
