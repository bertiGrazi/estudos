//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import Foundation

protocol RMEpisodeDetailViewViewModelDelegate: AnyObject {
    func didFetchEpisodeDetails()
}

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    
    
    private var dataTuple: (RMEpisode, [RMCharacter])? {
        didSet {
            delegate?.didFetchEpisodeDetails()
        }
    }
    
    public weak var delegate: RMEpisodeDetailViewViewModelDelegate?
    
    //MARK: - Init
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    // Fetching episode model
    public func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            print(#function)
            return
        }

        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.fetchRelatedCharacters(episode: model)
            case .failure(let failure):
                break
            }
        }
    }
    
    private func fetchRelatedCharacters(episode: RMEpisode) {
        let requests: [RMRequest] = episode.characters.compactMap({
            return URL(string: $0)
        }).compactMap({
            return RMRequest(url: $0)
        })
        
        // 10 of parallel request
        
        // Notified onde all done
        
        let group = DispatchGroup()
        var characters: [RMCharacter] = []
        for request in requests {
            group.enter() //+20
            RMService.shared.execute(request,
                                     expecting: RMCharacter.self) { result in
                defer {
                    group.leave() //-20
                }
                
                switch result {
                case .success(let model):
                    characters.append(model)
                case .failure(let failure):
                    break
                }
            }
        }
        group.notify(queue: .main) {
            self.dataTuple = (episode, characters)
        }
    }
}
