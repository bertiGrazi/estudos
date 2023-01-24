//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 23/01/23.
//

import Foundation

final class RMCharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    init (
        value: String,
        title: String
    ) {
        self.value = value
        self.title = title
    }
}
