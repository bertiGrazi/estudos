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
}
