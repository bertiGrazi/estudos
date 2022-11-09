//
//  MenuProfileScreen.swift
//  MenuProfile
//
//  Created by Grazi  Berti on 09/11/22.
//

import UIKit

class MenuProfileScreen: UIView {
    //MARK: - Variable
    
    //MARK: - View
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemGray
        
        configLayout()
        configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configLayout() {
        self.addSubview(menuView)
    }
    
    fileprivate func configConstrains() {
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
