//
//  MenuProfileTableViewCell.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 11/11/22.
//

import UIKit

class MenuProfileTableViewCell: UITableViewCell {
    //MARK: - Variable
    static let identifier: String = "MenuProfileTableViewCell"
    let screen: MenuProfileTableViewCellScreen = MenuProfileTableViewCellScreen()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        setupLayout()
        configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
    }
    
    private func configConstrains() {
        NSLayoutConstraint.activate([
            self.screen.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
    
    public func setupCell(title: String) {
        self.screen.titleLabel.text = title
    }
}
