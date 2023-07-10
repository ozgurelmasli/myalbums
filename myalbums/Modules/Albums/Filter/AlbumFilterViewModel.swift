//
//  AlbumFilterViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 10.07.2023.
//

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

private extension AlbumFilterViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            guard
                let row = indexPath?.row,
                let userId = self?.userIds[safe: row]
            else { return }
            self?.onSelect?(userId)
            self?.view?.dismiss()
        }
    }
    
    func getUserList() {
        dataSource.rows = userIds.map { .init(userId: "\($0)", isActiveFilter: $0 == selectedUserId)}
        view?.reloadUI?()
    }
}
