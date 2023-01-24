//
//  RMCharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 13/01/23.
//

import UIKit

/// Controller to show info about single character
final class RMCharacterDetailViewController: UIViewController {
    private let viewModel: RMCharacterDetailViewViewModel

    private let detailView: RMCharacterDetailView
    
    init(viewModel: RMCharacterDetailViewViewModel) {
        self.viewModel = viewModel
        self.detailView = RMCharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(didTapShare)
        )
        addConstrains()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    @objc
    func didTapShare() {
        print(#function)
    }
    
    fileprivate func addConstrains() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionTypes = viewModel.sections[section]
        switch sectionTypes {
        case .photo:
            return 1
        case .information(viewModel: let viewModel):
            return viewModel.count
        case .episodes(viewModels: let viewModel):
            return viewModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionTypes = viewModel.sections[indexPath.section]
        switch sectionTypes {
        case .photo(viewModel: let viewModel):
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifer, for: indexPath) as? RMCharacterPhotoCollectionViewCell else { fatalError() }
            cell.configure(with: viewModel)
            cell.backgroundColor = .systemPink
            return cell
        case .information(viewModel: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifer, for: indexPath) as? RMCharacterInfoCollectionViewCell else { fatalError() }
            cell.configure(with: viewModel[indexPath.row])
            cell.backgroundColor = .systemPurple
            return cell
        case .episodes(viewModels: let viewModel):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifer, for: indexPath) as? RMCharacterEpisodeCollectionViewCell else { fatalError() }
            cell.configure(with: viewModel[indexPath.row])
            cell.backgroundColor = .systemOrange
            return cell
        }
        
    }
}
