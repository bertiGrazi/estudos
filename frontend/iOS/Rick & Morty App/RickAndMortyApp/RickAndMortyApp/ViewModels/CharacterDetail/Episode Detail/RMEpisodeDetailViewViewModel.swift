//
//  RMEpisodeDetailViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import Foundation

final class RMEpisodeDetailViewViewModel {
    private let endpointUrl: URL?
    
    init(endpointUrl: URL?) {
        self.endpointUrl = endpointUrl
        fetchEpisodeData()
    }
    
    private func fetchEpisodeData() {
        guard let url = endpointUrl,
              let request = RMRequest(url: url) else {
            print(#function)
            return
        }

        RMService.shared.execute(request,
                                 expecting: RMEpisode.self) { result in
            switch result {
            case .success(let sucess):
                print(String(describing: sucess))
            case .failure(let failure):
                break
            }
        }
        
    }
}
