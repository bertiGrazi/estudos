//
//  RMEpisodeDetailView.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 26/01/23.
//

import Foundation
import UIKit

final class RMEpisodeDetailView: UIView {
    private var viewModel: RMEpisodeDetailViewViewModel?
    
    private var collectionView: UICollectionView?
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        //self.collectionView = createCollectionView()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    private func createCollectionView() -> UICollectionView {
//
//    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
    
    public func configure(with viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
    }
}
