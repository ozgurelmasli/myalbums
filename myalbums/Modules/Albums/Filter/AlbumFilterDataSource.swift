//
//  AlbumFilterDataSource.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

final class AlbumFilterDataSource: NSObject {
    /// didSelectRowAt func handler
    var didSelectHandler: IndexPathHandler?

    /// AlbumFilterTableViewCell rows
    var rows: [AlbumFilterTableViewCell.ViewModel] = []
}

extension AlbumFilterDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        didSelectHandler?(indexPath)
    }
}

extension AlbumFilterDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AlbumFilterTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        if let item = rows[safe: indexPath.row] {
            cell.populate(with: item)
        }
        return cell
    }
}
