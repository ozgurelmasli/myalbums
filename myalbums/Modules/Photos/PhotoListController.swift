//
//  PhotoListController.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

protocol PhotoListDisplayLayer: AnyObject {
    func reloadUI()
    func navigateTo(_ controller: UIViewController)
}

final class PhotoListController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.sectionHeaderHeight = UIScreen.main.bounds.width * (3/4)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotoTableViewCell.self)
        tableView.registerHeaderFooter(ShowcasePhotoHeaderView.self)
        return tableView
    }()
    
    private let viewModel: PhotoListViewModelProtocol
    
    init(viewModel: PhotoListViewModelProtocol) {
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

private extension PhotoListController {
    
    func setupViews() {
        title = viewModel.navigationTitle
        view.backgroundColor = .white
        
        tableView.delegate = viewModel.dataSource
        tableView.dataSource = viewModel.dataSource
        
        [tableView].forEach(view.addSubview)
        tableView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}

extension PhotoListController: PhotoListDisplayLayer {
    
    func reloadUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func navigateTo(_ controller: UIViewController) {
        self.present(controller, animated: true)
    }
}
