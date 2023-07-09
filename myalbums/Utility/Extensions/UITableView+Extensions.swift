//
//  UITableView+Extensions.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

protocol ReusableView {
    /// ReusableIdentifier
    static var identifier: String { get }
}
extension ReusableView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {
    /// 'dequeueReusableCell' for 'ReusableView'
    /// - Parameter indexPath: IndexPath
    /// - Returns: UITableViewCell
    func dequeueCell<T: UITableViewCell & ReusableView>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Cell couldn't dequeue")
        }
        return cell
    }
    
    /// 'dequeueReusableHeaderFooterView' for 'ReusableView'
    /// - Returns: UITableViewHeaderFooterView
    func dequeueHeaderFooterView<T: UITableViewHeaderFooterView & ReusableView>() -> T {
        guard let headerFooterView = dequeueReusableHeaderFooterView(withIdentifier: T.identifier) as? T else {
            fatalError("HeaderFooter couldn't dequeue")
        }
        return headerFooterView
    }
    
    /// TableView register for 'ReusableView'
    /// - Parameter _:  'ReusableView' type
    func register<T: UITableViewCell & ReusableView>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// TableView registerHeaderFooter for 'ReusableView'
    /// - Parameter _:  'ReusableView' type
    func registerHeaderFooter<T: UITableViewHeaderFooterView & ReusableView>( _: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: T.identifier)
    }
}
