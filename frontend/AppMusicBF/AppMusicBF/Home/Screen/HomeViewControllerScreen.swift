//
//  HomeViewControllerScreen.swift
//  AppMusicBF
//
//  Created by Grazi  Berti on 22/11/22.
//

import UIKit

class HomeViewControllerScreen: UIView {
    //MARK: - View
    lazy var tableview: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.tableview.delegate = delegate
        self.tableview.dataSource = dataSource
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.tableview)
        self.setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstrains() {
        self.tableview.pin(to: self) /// tudo é zero
    }
}
