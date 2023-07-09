//
//  AlbumDataSource.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

final class AlbumDataSource: NSObject {
    var didSelectHandler: IndexPathHandler?
    var rows: [AlbumTableViewCell.ViewModel] = []
}

extension AlbumDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectHandler?(indexPath)
    }
}

extension AlbumDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        if let item = rows[safe: indexPath.row] {
            cell.populate(with: item)
        }
        return cell
    }
}
