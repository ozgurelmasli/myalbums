//
//  AlbumListController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit
import SnapKit

protocol AlbumListDisplayLayer: BaseDisplayLayer { }

final class AlbumListController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AlbumTableViewCell.self)
        tableView.accessibilityIdentifier = "albumListIdentifier"
        return tableView
    }()
    
    private let filterButton: TButton = .init()
    
    private var viewModel: AlbumListViewModelProtocol
    
    init(viewModel: AlbumListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViews()
        viewModel.viewDidLoad()
    }
}

private extension AlbumListController {
    
    func setupViews() {
        title = .stringResources.album_list_title()
        view.backgroundColor = .white
        
        tableView.delegate = viewModel.dataSource
        tableView.dataSource = viewModel.dataSource
        
        let barButtonItem = UIBarButtonItem(customView: filterButton)
        filterButton.accessibilityIdentifier = "filterButtonIdentifier"
        navigationItem.rightBarButtonItem = barButtonItem
        
        [tableView].forEach(view.addSubview)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}


extension AlbumListController: AlbumListDisplayLayer {
    
    func reloadUI() {
        tableView.reloadData()
        filterButton.populate(with: viewModel.getFilterButtonViewModel())
    }
}
