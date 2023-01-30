//
//  RMLocationViewController.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 02/01/23.
//

import UIKit

/// Controller to show and search for Location
final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title =  "Location"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(didTapSearch)
        )
    }
    
    @objc
    private func didTapSearch() {
        print(#function)
    }

}
