//
//  ResultCompatible.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 11.07.2023.
//

import UIKit

protocol ResultCompatible {
    
    /// Default usage
    func showResult(title: String, message: String, buttonTitle: String?, actionHandler: VoidHandler?)
}

extension UIViewController: ResultCompatible {
    
    func showResult(
        title: String,
        message: String,
        buttonTitle: String?,
        actionHandler: VoidHandler?
    ) {
        let viewModel = ResultViewModel(title: title, message: message, buttonTitle: buttonTitle ?? .stringResources.core_result_default_button_title())
        viewModel.actionButtonHandler = actionHandler
        let viewController = ResultViewController(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: true)
    }
}
