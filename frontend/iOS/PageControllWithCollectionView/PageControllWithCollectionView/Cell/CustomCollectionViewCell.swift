//
//  CustomCollectionViewCell.swift
//  PageControllWithCollectionView
//
//  Created by Grazi  Berti on 11/12/22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CustomCollectionViewCell"
    
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
        contentView.addSubview(title)
    }
    
    fileprivate func setupLayoutConstrainer() {
        NSLayoutConstraint.activate([
            self.title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            self.title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
        ])
    }
    
    func configCell(data: NameUser) {
        self.title.text = data.nameUser
    }
}
