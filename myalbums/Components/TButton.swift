//
//  TButton.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class TButton: UIButton {
    
    private var viewModel: ViewModel?
    
    private enum Constants {
        static let defaultHeight: CGFloat = 60.0
    }
    
    struct ViewModel {
        var title: String?
        var image: UIImage? = nil
        var style: Style = .clearBlack
        var onTap: VoidHandler?
    }
    
    enum Style {
        /// Color -> .clear, TextColor -> .Black, Font -> Medium, 18
        case clearBlack
        
        /// Color -> .black, TextColor -> .white, Font -> Medium, 18
        case primary
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        self.viewModel = viewModel
        clearPopulate()
        
        setImage(viewModel.image, for: .normal)
        setTitle(viewModel.title.orEmpty, for: .normal)
        setStyle()
    }
    
    private func clearPopulate() {
        setTitle(nil, for: .normal)
        setImage(nil, for: .normal)
        backgroundColor = .clear
        layer.borderColor = nil
        layer.borderWidth = .zero
    }
}

private extension TButton {
    
    private func commonInit() {
        snp.makeConstraints { $0.height.equalTo(Constants.defaultHeight) }

        addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        guard let style = viewModel?.style else { return }
        switch style {
        case .clearBlack:
            setTitleColor(.white, for: .normal)
            backgroundColor = .clear
            titleLabel?.font = .font(.medium, size: 18)
        case .primary:
            setTitleColor(.white, for: .normal)
            backgroundColor = .black
            layer.cornerRadius = BaseConstants.radius
            titleLabel?.font = .font(.medium, size: 18)
        }
    }
    
    @objc
    private func didButtonTapped() {
        viewModel?.onTap?()
    }
}
