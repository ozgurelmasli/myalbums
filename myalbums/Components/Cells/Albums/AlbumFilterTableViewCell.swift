//
//  AlbumFilterTableViewCell.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

final class AlbumFilterTableViewCell: UITableViewCell, ReusableView {

    struct ViewModel {
        let userId: String
        let isActiveFilter: Bool
    }
    
    private let userIdLabel: TLabel = {
        let label = TLabel()
        label.style = .smallTitle
        
        return label
    }()
    
    private let checkmarkImageView: UIImageView = {
        let imageView = UIImageView(image: .ic_filter_active)
        imageView.tintColor = .colorResources.darkGreenColor()
        
        return imageView
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView(image: .ic_album_user_circle)
        imageView.tintColor = .colorResources.darkRedColor()
        
        return imageView
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = BaseConstants.spacing
        stackView.setLayoutMargins(BaseConstants.edgeInsets)
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(with viewModel: ViewModel) {
        userIdLabel.text = viewModel.userId
        checkmarkImageView.isHidden = !viewModel.isActiveFilter
    }
}

private extension AlbumFilterTableViewCell {
    
    func setupViews() {
        [container].forEach(contentView.addSubview)
        [userImageView, userIdLabel, checkmarkImageView].forEach(container.addArrangedSubview)
        
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
        checkmarkImageView.snp.makeConstraints { $0.width.height.equalTo(BaseConstants.iconSize) }
    }
}
