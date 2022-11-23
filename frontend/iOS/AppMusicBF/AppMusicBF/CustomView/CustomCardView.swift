//
//  CustomCardView.swift
//  AppMusicBF
//
//  Created by Grazi  Berti on 22/11/22.
//

import UIKit

enum ViewMode {
    case fullMode
    case cardMode
}

class CustomCardView: UIView {
    //MARK: Variable
    var statusCard: ViewMode?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerTraillingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var dataViewModel: CardViewModel?
    
    //MARK: - View
    
    /// card view
    lazy var cardContainerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        //clipsToBounds = Senão colocar, ele não irá aceitar que arredonde as nossas bordas.
        view.clipsToBounds = true
        view.layer.shadowOpacity = 1
        //clipsToBounds = Dimensionar o tamanho da nossa sombra.
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        view.layer.shadowRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// image card
    lazy var cardImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    /// view color in card
    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// border image user
    lazy var profileBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// user image
    lazy var cardProfileImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    /// add image user button
    lazy var addProfileImageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// music category
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// date category
    lazy var cardCateoryDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// title
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// likes and time
    lazy var likeAndTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// description in case for fullMode
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        /// texto se reagusta independente de quantas linhas tiver.
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(statusCard: ViewMode, dataViewModel: CardViewModel) {
        let frame = CGRect.zero
        self.statusCard = statusCard
        self.dataViewModel = dataViewModel
        super.init(frame: frame)
        self.addSubviews()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(self.cardContainerView)
        self.cardContainerView.addSubview(cardImage)
        self.cardContainerView.addSubview(overlayView)
        self.cardContainerView.addSubview(profileBorderView)
        self.cardContainerView.addSubview(cardProfileImage)
        self.cardContainerView.addSubview(cardCategoryTitleLabel)
        self.cardContainerView.addSubview(cardCateoryDateLabel)
        self.cardContainerView.addSubview(cardTitle)
        self.cardContainerView.addSubview(likeAndTitleLabel)
        self.cardContainerView.addSubview(descriptionTitleLabel)
        
        self.updateLayout(for: self.statusCard ?? .cardMode)
    }
    
    private func setupConstraints() {
        self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        /// quando não estamos trabalhando de uma forma nativa sem está dentro da lista do NSLayout.active
        self.containerLeadingConstraints?.isActive = true
        
        self.containerLeadingConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        self.containerLeadingConstraints?.isActive = true
        
        self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 15)
        self.containerBottomConstraints?.isActive = true
        
        self.containerTraillingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        self.containerTraillingConstraints?.isActive = true
        
        self.overlayView.pin(to: self.cardContainerView)
        self.cardImage.pin(to: self.cardContainerView)
        
        NSLayoutConstraint.activate([
            self.profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
            self.profileBorderView.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor, constant: 0),
            self.profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            self.profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBorderView.trailingAnchor, constant: 4),
            self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 4),
            self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            self.cardProfileImage.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor, constant: 0),
            self.cardProfileImage.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor, constant: 0),
            self.cardProfileImage.widthAnchor.constraint(equalToConstant: 40),
            self.cardProfileImage.heightAnchor.constraint(equalToConstant: 40),
            
            self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
            self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor, constant: 0),
            
            self.cardCateoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
            self.cardCateoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor, constant: 0),
            
            self.cardTitle.topAnchor.constraint(equalTo: self.cardCateoryDateLabel.bottomAnchor, constant: 20),
            self.cardTitle.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.cardTitle.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
        ])

    }
    
    private func updateLayout(for mode: ViewMode) {
        if mode == .fullMode {
            self.containerLeadingConstraints?.constant = 0
            self.containerTopConstraints?.constant = 0
            self.containerTraillingConstraints?.constant = 0
            self.containerBottomConstraints?.constant = 0
            self.descriptionTitleLabel.isHidden = false
        } else {
            self.containerLeadingConstraints?.constant = 30
            self.containerTopConstraints?.constant = 15
            self.containerTraillingConstraints?.constant = -15
            self.containerBottomConstraints?.constant = -30
            self.descriptionTitleLabel.isHidden = true
        }
    }
}
