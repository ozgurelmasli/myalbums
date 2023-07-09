//
//  AlbumTableViewCell.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class AlbumTableViewCell: UITableViewCell, ReusableView {
    
    struct ViewModel {
        let title: String
        let userId: String
    }
    
    private let titleLabel: TLabel = {
        let label = TLabel()
        label.style = .largeTitle
        
        return label
    }()
    
    private let userIdLabel: TLabel = {
        let label = TLabel()
        label.style = .smallTitle
        
        return label
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.tintColor = .red
        
        return imageView
    }()
    
    private let userContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = BaseConstants.spacing
        
        return stackView
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = BaseConstants.spacing
        stackView.setLayoutMargins()
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        [container].forEach(contentView.addSubview)
        [userImageView, userIdLabel].forEach(userContainer.addArrangedSubview)
        [titleLabel, userContainer].forEach(container.addArrangedSubview)
        
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func populate(with viewModel: ViewModel) {
        titleLabel.text = viewModel.title
        userIdLabel.text = viewModel.userId
    }
}
