//
//  AlbumFilterViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

import Foundation

protocol AlbumFilterViewModelProtocol: BaseViewModelProtocol {
    var view: AlbumFilterDisplayLayer? { get set }
    var onSelect: IntHandler? { get set }
    var dataSource: AlbumFilterDataSource { get }
}

final class AlbumFilterViewModel: AlbumFilterViewModelProtocol {
    
    weak var view: AlbumFilterDisplayLayer?
    
    var onSelect: IntHandler?
    
    let dataSource: AlbumFilterDataSource = .init()
    
    private let userIds: [Int]
    private let selectedUserId: Int?
    
    init(userIds: [Int], selectedUserId: Int?) {
        self.userIds = userIds
        self.selectedUserId = selectedUserId
    }
    
    func viewDidLoad() {
        bind()
        getUserList()
    }
}

//MARK: -> Data Prep
private extension AlbumFilterViewModel {
    
    func getUserList() {
        dataSource.rows = userIds.map { .init(userId: $0.toString, isActiveFilter: $0 == selectedUserId)}
        
        view?.reloadUI()
    }
}

//MARK: -> Action Handlers
private extension AlbumFilterViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            self?.didRowSelect(indexPath)
        }
    }
    
    func didRowSelect( _ indexPath: IndexPath?) {
        guard let row = indexPath?.row, let userId = userIds[safe: row] else { return }
        
        onSelect?(userId)
        view?.dismiss()
    }
}
