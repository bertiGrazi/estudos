//
//  RMEpisodeDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import UIKit

/// VC to show details about single episode
class RMEpisodeDetailViewController: UIViewController {
    private let viewModel:RMEpisodeDetailViewViewModel
    
    // MARK: - Init
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemGreen
    }

}