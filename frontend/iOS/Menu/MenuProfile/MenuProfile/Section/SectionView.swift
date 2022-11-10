//
//  SectionView.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 10/11/22.
//

import UIKit

class SectionView: UIView {

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.tintColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var referencebutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var arroImageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = .purple
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        self.addSubview(referencebutton)
        self.addSubview(arroImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(lineView)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            self.referencebutton.topAnchor.constraint(equalTo: self.topAnchor),
            self.referencebutton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.referencebutton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.referencebutton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.arroImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.arroImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            self.arroImageView.heightAnchor.constraint(equalToConstant: 5),
            
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    public func setupSection(description: String) {
        self.descriptionLabel.text = description
    }
    
    public func expandButton(value: Bool) {
        if value {
            self.arroImageView.image = UIImage(systemName: "chevron.compact.up")
        } else {
            self.arroImageView.image = UIImage(systemName: "chevron.compact.down")
        }
    }
}
