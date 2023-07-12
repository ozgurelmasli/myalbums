//
//  AlbumListViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import UIKit

protocol AlbumListViewModelProtocol: BaseViewModelProtocol {
    var view: AlbumListDisplayLayer? { get set }
    var dataSource: AlbumDataSource { get }
    
    func getFilterButtonViewModel() -> TButton.ViewModel
}

final class AlbumListViewModel: AlbumListViewModelProtocol {
    
    weak var view: AlbumListDisplayLayer?
    
    let dataSource: AlbumDataSource = .init()
    
    private let network: TNetworkProtocol
    private var albums: [Album] = []
    private var filteredUserId: Int? = nil

    init(network: TNetworkProtocol = TNetwork()) {
        self.network = network
    }
    
    func viewDidLoad() {
        bind()
        getAlbumsList()
    }
    
    func getFilterButtonViewModel() -> TButton.ViewModel {
        let buttonImage: UIImage? = filteredUserId == nil ? .imageResources.ic_unactive_filter() : .imageResources.ic_active_filter()
        let buttonViewModel = TButton.ViewModel(title: nil,
                                                image: buttonImage) { [weak self] in
            self?.filterButtonTapped()
        }
        return buttonViewModel
    }
}

//MARK: -> Action Handlers
private extension AlbumListViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            self?.didRowSelect(indexPath)
        }
    }
    
    func didRowSelect( _ indexPath: IndexPath?) {
        guard let row = indexPath?.row, let album = albums[safe: row] else { return }
        
        let viewModel = PhotoListViewModel(album: album)
        let controller = PhotoListController(viewModel: viewModel)
        view?.navigateTo(controller)
    }
    
    func filterButtonTapped() {
        let userIds = self.albums.compactMap { $0.userId }
        let uniques = Set(userIds).sorted()
        
        let filterViewModel = AlbumFilterViewModel(userIds: uniques, selectedUserId: filteredUserId)
        filterViewModel.onSelect = { [weak self] selectedUserId in
            if self?.filteredUserId == selectedUserId {
                self?.filteredUserId = nil
            } else {
                self?.filteredUserId = selectedUserId
            }
            self?.filterAlbums()
        }
        let controller = AlbumFilterController(viewModel: filterViewModel)
        view?.present(controller)
    }
}

//MARK: -> Filter actions
private extension AlbumListViewModel {
    
    func filterAlbums() {
        guard let selectedUserId = filteredUserId else {
            resetFilter()
            return
        }
        dataSource.rows = albums
            .filter { $0.userId == selectedUserId }
            .map { .init(title: $0.title.orEmpty, userId: $0.userId.orZero.toString) }
        view?.reloadUI?()
    }
    
    func resetFilter() {
        dataSource.rows = albums
            .map { .init(title: $0.title.orEmpty, userId: $0.userId.orZero.toString) }
        view?.reloadUI?()
    }
}

//MARK: -> Album List Request
private extension AlbumListViewModel {
    
    /// GET Album List
    func getAlbumsList() {
        view?.startLoading()
        let service = AlbumsService.getAlbums
        Task {
            do {
                let albumList: [Album]? = try await network.request(target: service)
                handleResponse(albumList)
            } catch let error as TServiceError {
                DispatchQueue.main.async {
                    self.view?.showResult(title: .stringResources.core_default_error_title(), message: error.message, buttonTitle: nil, actionHandler: nil)
                }
            }
        }
    }
    
    /// Handle Album List Response
    func handleResponse( _ albumList: [Album]?) {
        guard let albumList = albumList else {
            return
        }
        self.albums = albumList
        dataSource.rows = albumList.map { .init(title: $0.title.orEmpty, userId: $0.userId.orZero.toString) }
        DispatchQueue.main.async {
            self.view?.stopLoading()
            self.view?.reloadUI?()
        }
    }
}
