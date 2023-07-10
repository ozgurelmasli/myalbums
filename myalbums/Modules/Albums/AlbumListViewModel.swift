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
    
    private func filterButtonTapped() {
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
    
    private func filterAlbums() {
        guard let selectedUserId = filteredUserId else {
            resetFilter()
            return
        }
        dataSource.rows = albums.filter { $0.userId == selectedUserId }.map { .init(title: $0.title ?? "", userId: "\($0.userId ?? 0)") }
        view?.reloadUI?()
    }
    
    private func resetFilter() {
        dataSource.rows = albums.map { .init(title: $0.title ?? "", userId: "\($0.userId ?? 0)") }
        view?.reloadUI?()
    }
}

//MARK: -> Album List Request
private extension AlbumListViewModel {
    
    /// GET Album List
    func getAlbumsList() {
        let service = AlbumsService.getAlbums
        Task {
            do {
                let albumList: [Album]? = try await network.request(target: service)
                handleResponse(albumList)
            } catch let error as TServiceError {
                print(error)
            }
        }
    }
    
    /// Handle Album List Response
    func handleResponse( _ albumList: [Album]?) {
        guard let albumList = albumList else {
            //TODO: -> throw
            return
        }
        self.albums = albumList
        dataSource.rows = albumList.map { .init(title: $0.title ?? "", userId: "\($0.userId ?? 0)") }
        view?.reloadUI?()
    }
}

private extension AlbumListViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            guard
                let row = indexPath?.row,
                let album = self?.albums[safe: row]
            else { return }
            self?.navigateToPhotos(album)
        }
    }
    
    func navigateToPhotos( _ selectedAlbum: Album) {
        let viewModel = PhotoListViewModel(album: selectedAlbum)
        let controller = PhotoListController(viewModel: viewModel)
        view?.navigateTo(controller)
    }
}

