//
//  CardViewTableViewCell.swift
//  AppMusicBF
//
//  Created by Grazi  Berti on 22/11/22.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    //MARK: - Variable
    static let identifier: String = "CardViewTableViewCell"
    
    //MARK: - View
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
