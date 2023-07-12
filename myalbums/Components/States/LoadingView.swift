//
//  LoadingView.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import UIKit

final class LoadingView: UIView {
    
    static var isLoading: Bool = false
    
    static let viewTag: Int = 125925191
    
    struct ViewModel {
        let title: String
    }
    
    private let container: UIStackView = {
        let container = UIStackView()
        container.alignment = .center
        container.axis = .vertical
        container.spacing = BaseConstants.padding
        
        return container
    }()
    
    private let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        
        return indicator
    }()
    
    private let titleLabel: TLabel = {
        let label = TLabel()
        label.style = .smallTitle
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func populate(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        indicator.startAnimating()
    }
}

private extension LoadingView {
    
    func setupViews() {
        accessibilityIdentifier = "LoadingViewIdentifier"
        backgroundColor = .white
        self.tag = LoadingView.viewTag
        
        [container].forEach(addSubview)
        [indicator, titleLabel].forEach(container.addArrangedSubview)
        
        container.snp.makeConstraints { $0.centerX.centerY.equalToSuperview() }
    }
}
