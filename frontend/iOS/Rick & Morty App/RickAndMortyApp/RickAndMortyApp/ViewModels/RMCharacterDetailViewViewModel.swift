//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 13/01/23.
//

import Foundation

final class RMCharacterDetailViewViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
