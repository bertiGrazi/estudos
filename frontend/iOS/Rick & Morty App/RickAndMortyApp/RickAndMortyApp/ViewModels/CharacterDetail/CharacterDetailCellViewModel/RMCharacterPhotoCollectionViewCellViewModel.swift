//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 23/01/23.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel {
    private let imageURL: URL?
    
    init (imageUrl: URL?) {
        self.imageURL = imageUrl
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(imageURL, completion: completion)
    }
}
