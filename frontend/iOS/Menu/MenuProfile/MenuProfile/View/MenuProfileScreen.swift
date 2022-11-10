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
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var upArrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
                                                                    /// depois que precionado, ele aparece
        button.addTarget(self, action: #selector(tappedBack(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = "Menu"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.backgroundColor = .white
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .purple
        
        configLayout()
        configConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupDelegateTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    @objc
    func tappedBack(_ sender: UIButton) {
        print(#function)
    }
    
    fileprivate func configLayout() {
        self.addSubview(headerView)
        headerView.addSubview(self.upArrowButton)
        headerView.addSubview(self.titleLabel)
        self.addSubview(self.tableView)
    }
    
    fileprivate func configConstrains() {
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 50),
            
            self.upArrowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.upArrowButton.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor, constant: 0),
            self.upArrowButton.heightAnchor.constraint(equalToConstant: 25),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.upArrowButton.trailingAnchor, constant: 20),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor, constant: 0),
            
            self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
