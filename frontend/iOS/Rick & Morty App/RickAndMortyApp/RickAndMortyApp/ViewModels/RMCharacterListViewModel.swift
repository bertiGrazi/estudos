//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 04/01/23.
//

import Foundation
import UIKit

protocol RMCharacterListViewModelDelegate: AnyObject {
    func didLoadInitialCharacter()
    func didSelectCharacter(_ character: RMCharacter)
}

final class RMCharacterListViewModel: NSObject {
    
    public weak var delegate: RMCharacterListViewModelDelegate?
    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
    
    func fetchCharacters() {
        RMService.shared.execute(
            .listCharacterRequests,
            expecting: RMGetAllCharactersResponse.self
        ) { result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                DispatchQueue.main.async {
                    self.delegate?.didLoadInitialCharacter()
                }
                //let info = responseModel.info.next
                self.characters = results
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else { fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width-30)/2
        return CGSize(
            width: width,
            height: width * 1.5
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
}
