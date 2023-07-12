//
//  PhotoDataSource.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class PhotoDataSource: NSObject {
    /// didSelectRowAt func handler
    var didSelectHandler: IndexPathHandler?
    
    /// PhotoTableViewCell rows
    var rows: [PhotoTableViewCell.ViewModel] = []
    
    /// ShowcasePhotoHeaderView header
    var headerViewModel: ShowcasePhotoHeaderView.ViewModel?
}

extension PhotoDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectHandler?(indexPath)
    }
}

extension PhotoDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        if let item = rows[safe: indexPath.row] {
            cell.populate(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: ShowcasePhotoHeaderView = tableView.dequeueHeaderFooterView()
        if let headerViewModel = headerViewModel {
            headerView.populate(with: headerViewModel)
        }
        return headerView
    }
}
