//
//  ResultViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import Foundation

protocol ResultViewModelProtocol {
    var view: ResultDisplayLayer? { get set }
    var title: String { get }
    var message: String? { get }
    
    func actionButtonViewModel() -> TButton.ViewModel
}

final class ResultViewModel: ResultViewModelProtocol {

    weak var view: ResultDisplayLayer?
    
    var actionButtonHandler: VoidHandler?
    
    let title: String
    
    let message: String?
    
    let buttonTitle: String

    init(title: String, message: String?, buttonTitle: String) {
        self.title = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    func actionButtonViewModel() -> TButton.ViewModel {
        var viewModel = TButton.ViewModel()
        viewModel.title = buttonTitle
        viewModel.style = .primary
        viewModel.onTap = { [weak self] in
            self?.view?.dismiss()
            self?.actionButtonHandler?()
        }
        
        return viewModel
    }

}
