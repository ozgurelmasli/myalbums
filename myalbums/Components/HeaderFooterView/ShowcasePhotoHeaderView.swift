//
//  ShowcasePhotoHeaderView.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class ShowcasePhotoHeaderView: UITableViewHeaderFooterView, ReusableView {
    
    struct ViewModel {
        let sourceUrl: String
    }
    
    private let imageView: UIImageView = .init()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func populate(with viewModel: ViewModel) {
        imageView.setImage(.url(viewModel.sourceUrl, UIImage(systemName: "photo.fill")))
    }
}

private extension ShowcasePhotoHeaderView {
    
    func setupViews() {
        [imageView].forEach(addSubview)
        
        imageView.clipsToBounds = true
        
        imageView.tintColor = .darkGray
        
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
