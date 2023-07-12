//
//  AlbumFilterController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import UIKit

protocol AlbumFilterDisplayLayer: BaseDisplayLayer {}

final class AlbumFilterController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AlbumFilterTableViewCell.self)
        tableView.accessibilityIdentifier = "filterTableViewIdentifier"
        return tableView
    }()
    
    private var viewModel: AlbumFilterViewModelProtocol
    
    init(viewModel: AlbumFilterViewModelProtocol) {
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
        viewModel.viewDidLoad?()
    }
}

private extension AlbumFilterController {
    
    func setupViews() {
        view.backgroundColor = .white
        
        tableView.delegate = viewModel.dataSource
        tableView.dataSource = viewModel.dataSource
        
        [tableView].forEach(view.addSubview)
        
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension AlbumFilterController: AlbumFilterDisplayLayer {
    
    func reloadUI() {
        self.tableView.reloadData()
    }
}
