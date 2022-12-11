//
//  CustomCollectionViewCell.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 11/12/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomCollectionViewCell"
    
    lazy var viewTitle: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupLayoutConstrainer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLayout() {
        contentView.addSubview(viewTitle)
        viewTitle.addSubview(title)
    }
    
    fileprivate func setupLayoutConstrainer() {
        NSLayoutConstraint.activate([
            
            self.viewTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            self.viewTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            self.viewTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            self.viewTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            self.viewTitle.widthAnchor.constraint(equalToConstant: 50),
            self.viewTitle.heightAnchor.constraint(equalToConstant: 100),
            
            self.title.centerXAnchor.constraint(equalTo: viewTitle.centerXAnchor, constant: 0),
            self.title.centerYAnchor.constraint(equalTo: viewTitle.centerYAnchor, constant: 0),
        ])
    }
    
    func configCell(data: NameUser) {
        self.title.text = data.nameUser
    }
}
