//
//  PhotoListViewModel.swift
//  myalbums
//
//  Created by Özgür Elmaslı on 9.07.2023.
//

import Foundation

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
            self?.didRowSelect(indexPath)
        }
    }
    
    func didRowSelect( _ indexPath: IndexPath?) {
        guard let row = indexPath?.row, let photo = photos[safe: row] else { return }
        
        let previewViewModel = PhotoPreviewViewModel(imageUrl: photo.url.orEmpty)
        let controller = PhotoPreviewController(viewModel: previewViewModel)
        view?.present(controller)
    }
}

private extension PhotoListViewModel {
    
    func getPhotoList() {
        let service = PhotosService.getPhotos
        Task {
            do {
                let photoList: [Photo]? = try await network.request(target: service)
                handleResponse(photoList)
            } catch let error as TServiceError {
                DispatchQueue.main.async {
                    self.view?.showResult(title: .stringResources.core_default_error_title(), message: error.message, buttonTitle: nil, actionHandler: nil)
                }
            }
        }
    }
    
    func handleResponse( _ photoList: [Photo]?) {
        guard let photoList = photoList, !photoList.isEmpty else {
            return
        }
        
        photos = filterByAlbumId(photoList)
        dataSource.rows = photos.map { PhotoTableViewCell.ViewModel(thumbnailUrl: $0.thumbnailUrl.orEmpty, title: $0.title.orEmpty) }
        dataSource.headerViewModel = ShowcasePhotoHeaderView.ViewModel(sourceUrl: (photos.randomElement()?.url).orEmpty)
        
        DispatchQueue.main.async {
            self.view?.reloadUI?()
        }
    }
}

//MARK: -> Filter Actions
private extension PhotoListViewModel {
    
    func filterByAlbumId( _ photos: [Photo]) -> [Photo] {
        guard let albumId = album.id else { return photos }
        
        return photos.filter {
            $0.albumId == albumId
        }
    }
}
