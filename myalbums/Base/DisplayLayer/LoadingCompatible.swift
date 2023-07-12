//
//  LoadingCompatible.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

protocol LoadingCompatible: AnyObject {
    func startLoading()
    func stopLoading()
}

extension UIViewController: LoadingCompatible {
    
    func startLoading() {
        guard !LoadingView.isLoading else { return }
        
        let loadingViewModel = LoadingView.ViewModel(title: .stringResources.core_loading_title())
        let loadingView = LoadingView()
        loadingView.populate(with: loadingViewModel)
        
        self.view.addSubview(loadingView)
        loadingView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.isHidden = true
        }
        
        LoadingView.isLoading = true
    }
    
    func stopLoading() {
        guard let loadingView = self.view.viewWithTag(LoadingView.viewTag) else { return }
        loadingView.removeFromSuperview()
        
        if let navigationController = self.navigationController {
            navigationController.navigationBar.isHidden = false
        }
        
        LoadingView.isLoading = false
    }
}
