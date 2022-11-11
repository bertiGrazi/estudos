//
//  MenuProfileTableViewCellScreen.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 11/11/22.
//

import UIKit

class MenuProfileTableViewCellScreen: UIView {
    
    //MARK: - View
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray.withAlphaComponent(0.1)
        
        setupLayout()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        addSubview(self.titleLabel)
        addSubview(self.lineView)
    }
    
    fileprivate func setupConstrains() {
        NSLayoutConstraint.activate([
            self.titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.lineView.heightAnchor.constraint(equalToConstant: 0.8)
        ])
    }
}
