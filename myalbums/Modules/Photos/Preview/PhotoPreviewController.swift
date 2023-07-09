//
//  PhotoPreviewController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

protocol PhotoPreviewDisplayLayer: AnyObject {
    func dismiss()
}

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
        
        view.backgroundColor = .black
        [imageView, closeButton].forEach(view.addSubview)
        
        imageView.setImage(.url(viewModel.imageSourceUrl, nil))
        
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(600)
        }
        closeButton.populate(with: viewModel.getCloseButtonViewModel())
        closeButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(BaseConstants.padding)
            make.trailing.equalToSuperview().inset(BaseConstants.padding)
            make.bottom.equalTo(view.snp_bottomMargin)
        }
    }
}

extension PhotoPreviewController: PhotoPreviewDisplayLayer {
    
    func dismiss() {
        dismiss(animated: true)
    }
}
