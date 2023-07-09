//
//  PhotoPreviewViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Foundation

protocol PhotoPreviewViewModelProtocol {
    var view: PhotoPreviewDisplayLayer? { get set }
    var imageSourceUrl: String { get }
    
    func getCloseButtonViewModel() -> TButton.ViewModel
}

final class PhotoPreviewViewModel: PhotoPreviewViewModelProtocol {
    
    weak var view: PhotoPreviewDisplayLayer?
    
    var imageSourceUrl: String {
        return imageUrl
    }
    
    private let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    func getCloseButtonViewModel() -> TButton.ViewModel {
        let buttonViewModel = TButton.ViewModel(
            title: .stringResources.core_close_button_title(),
            style: .clearBlack) { [weak self] in
                self?.view?.dismiss()
            }
        
        return buttonViewModel
    }
}
