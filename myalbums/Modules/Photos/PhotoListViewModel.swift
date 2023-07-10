//
//  PhotoListViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

protocol PhotoListViewModelProtocol: BaseViewModelProtocol {
    var view: PhotoListDisplayLayer? { get set }
    var navigationTitle: String { get }
    var dataSource: PhotoDataSource { get }
}

final class PhotoListViewModel: PhotoListViewModelProtocol {
    
    weak var view: PhotoListDisplayLayer?
    
    let dataSource: PhotoDataSource = .init()

    var navigationTitle: String {
        return album.title.orEmpty
    }
    
    private let network: TNetworkProtocol
    private let album: Album
    private var photos: [Photo] = []
    
    init(network: TNetworkProtocol = TNetwork(), album: Album) {
        self.network = network
        self.album = album
    }
    
    func viewDidLoad() {
        bind()
        getPhotoList()
    }
}

private extension PhotoListViewModel {
    
    func bind() {
        dataSource.didSelectHandler = { [weak self] indexPath in
            guard
                let row = indexPath?.row,
                let tappedPhoto = self?.photos[safe: row]
            else { return }
            let previewViewModel = PhotoPreviewViewModel(imageUrl: tappedPhoto.url.orEmpty)
            let controller = PhotoPreviewController(viewModel: previewViewModel)
            self?.view?.present(controller)
        }
    }
    
    /// GET Photo List
    func getPhotoList() {
        let service = PhotosService.getPhotos
        Task {
            do {
                let photoList: [Photo]? = try await network.request(target: service)
                handleResponse(photoList)
            } catch let error as TServiceError {
                print(error)
            }
        }
    }
    
    func handleResponse( _ photoList: [Photo]?) {
        guard let photoList = photoList, !photoList.isEmpty else {
            // TODO: empty
            return
        }
        self.photos = filterByAlbumId(photoList)
        dataSource.rows = photos.map { PhotoTableViewCell.ViewModel(thumbnailUrl: $0.thumbnailUrl.orEmpty, title: $0.title.orEmpty) }
        dataSource.headerViewModel = .init(sourceUrl: (photos.randomElement()?.url).orEmpty)
        view?.reloadUI?()
    }
    
    func filterByAlbumId( _ photos: [Photo]) -> [Photo] {
        guard let albumId = album.id else { return photos }
        
        return photos.filter {
            $0.albumId == albumId
        }
    }
}
