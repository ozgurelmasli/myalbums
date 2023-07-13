//
//  TLabel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class TLabel: UILabel {
    
    var style: Style = .largeTitle {
        didSet { setStyle() }
    }
    
    private enum Constants {
        static let size28: CGFloat = 28
        static let size16: CGFloat = 16
    }
    
    enum Style {
        /// black, 40
        case largeTitle
        /// medium, 16
        case smallTitle
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
}

private extension TLabel {
    
    func commonInit() {
        numberOfLines = 0
        lineBreakMode = .byCharWrapping

        setStyle()
    }
    
    func setStyle() {
        switch style {
        case .largeTitle:
            textColor = .black
            font = .font(.black, size: Constants.size28)
        case .smallTitle:
            textColor = .black.withAlphaComponent(0.6)
            font = .font(.medium, size: Constants.size16)
        }
    }
}
