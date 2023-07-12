//
//  NavigationCompatible.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

/// Navigation Display Layer Functions
protocol NavigationCompatible: AnyObject {
    func navigateTo( _ controller: UIViewController)
    func present( _ controller: UIViewController)
    func dismiss()
}

extension NavigationCompatible {
    func navigateTo( _ controller: UIViewController) { }
    func present( _ controller: UIViewController) { }
    func dismiss() { }
}

extension UIViewController: NavigationCompatible {
    func navigateTo(_ controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func present(_ controller: UIViewController) {
        present(controller, animated: true)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
}
