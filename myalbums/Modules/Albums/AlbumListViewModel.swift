//
//  AlbumListViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

protocol AlbumListViewModelProtocol: BaseViewModelProtocol {
    var view: AlbumListDisplayLayer? { get set }
    var dataSource: AlbumDataSource { get }
}

final class AlbumListViewModel: AlbumListViewModelProtocol {
    
    weak var view: AlbumListDisplayLayer?
    
    let dataSource: AlbumDataSource = .init()
    
    private let network: TNetworkProtocol
    private var albums: [Album] = []

    init(network: TNetworkProtocol = TNetwork()) {
        self.network = network
    }
    
    func viewDidLoad() {
        bind()
        getAlbumsList()
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
        view?.reloadUI()
    }
}

private extension AlbumListViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            guard let album = self?.albums[safe: indexPath.row] else { return }
            self?.navigateToPhotos(album)
        }
    }
    
    func navigateToPhotos( _ selectedAlbum: Album) {
        let viewModel = PhotoListViewModel(album: selectedAlbum)
        let controller = PhotoListController(viewModel: viewModel)
        view?.navigateTo(controller)
    }
}

