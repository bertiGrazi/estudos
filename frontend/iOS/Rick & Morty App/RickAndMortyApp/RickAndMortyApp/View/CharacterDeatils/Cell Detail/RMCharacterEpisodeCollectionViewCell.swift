//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Grazi  Berti on 23/01/23.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifer = "RMCharacterEpisodeCollectionViewCell"
    
    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let airDateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderColor = UIColor.systemYellow.cgColor.copy(alpha: 0.3)
        contentView.layer.borderWidth = 2
        contentView.addSubviews(seasonLabel, nameLabel, airDateLabel)
        
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            seasonLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            seasonLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor, constant: 0),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
            
            airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            airDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            airDateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { [weak self] dataCharacter in
            //Main Queue
//            print(String(describing: dataCharacter.name))
//            print(String(describing: dataCharacter.air_date))
//            print(String(describing: dataCharacter.episode))
            self?.nameLabel.text = dataCharacter.name
            self?.seasonLabel.text = "Episode "+dataCharacter.episode
            self?.airDateLabel.text = "Aired on "+dataCharacter.air_date
        }
        viewModel.fetchEpisode()
    }
}
