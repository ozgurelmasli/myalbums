//
//  PhotoPreviewController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

protocol PhotoPreviewDisplayLayer: BaseDisplayLayer { }

final class PhotoPreviewController: UIViewController {
    
    private let imageView: UIImageView = .init()
    private let closeButton: TButton = .init()
    
    private var viewModel: PhotoPreviewViewModelProtocol
    
    init(viewModel: PhotoPreviewViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}

private extension PhotoPreviewController {
    
    func setupViews() {
        view.backgroundColor = .black
        
        closeButton.populate(with: viewModel.getCloseButtonViewModel())
        imageView.setImage(.url(viewModel.imageSourceUrl, nil))
        
        [imageView, closeButton].forEach(view.addSubview)
        
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(600)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(BaseConstants.padding)
            make.trailing.equalToSuperview().inset(BaseConstants.padding)
            make.bottom.equalTo(view.snp_bottomMargin)
        }
    }
}

extension PhotoPreviewController: PhotoPreviewDisplayLayer { }
