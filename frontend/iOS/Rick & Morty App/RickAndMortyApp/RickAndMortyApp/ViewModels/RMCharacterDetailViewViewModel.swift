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
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
    public func fetchCharacterData() {
        print(character.url)
        guard let url = requestUrl,
              let request = RMRequest(url: url) else {
            print("Failed to create")
            return
        }
        RMService.shared.execute(request,
                                 expecting: RMCharacter.self) { result in
            
            switch result {
            case .success(let sucess):
                print(String(describing: sucess))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
