//
//  RMCharacterCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 05/01/23.
//

import UIKit

/// Single cell for a character
final class RMCharacterCollectionViewCell: UICollectionViewCell {
    //MARK: - Variable
    
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    //MARK: - Layout UI
    
    private let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameCharacterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let statusCharacterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(characterImageView, nameCharacterLabel, statusCharacterLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusCharacterLabel.heightAnchor.constraint(equalToConstant: 50),
            nameCharacterLabel.heightAnchor.constraint(equalToConstant: 50),
            
            statusCharacterLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusCharacterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            statusCharacterLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            nameCharacterLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameCharacterLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameCharacterLabel.bottomAnchor.constraint(equalTo: statusCharacterLabel.topAnchor, constant: -3),
            
            characterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: nameCharacterLabel.topAnchor),
            
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        characterImageView.image = nil
        nameCharacterLabel.text = nil
        statusCharacterLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
        nameCharacterLabel.text = viewModel.characterName
        statusCharacterLabel.text = viewModel.characterStatusText
        viewModel.fetchImage {[weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                break
            }
        }
    }
}
