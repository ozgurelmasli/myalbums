//
//  PhotoTableViewCell.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class PhotoTableViewCell: UITableViewCell, ReusableView {
    
    struct ViewModel {
        let thumbnailUrl: String
        let title: String
    }
    
    private let titleLabel: TLabel = {
        let label = TLabel()
        label.style = .smallTitle
        
        return label
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.setLayoutMargins()
        stackView.spacing = BaseConstants.spacing

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
        [photoImageView, titleLabel].forEach(container.addArrangedSubview)
        
        photoImageView.snp.makeConstraints { make in
            make.height.width.equalTo(75)
        }
        
        container.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func populate(with viewModel: ViewModel) {
        photoImageView.setImage(.url(viewModel.thumbnailUrl, .img_photo_placeholder))
        titleLabel.text = viewModel.title
    }
}
