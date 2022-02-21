//
//  NewsViewController.swift
//  Petition
//
//  Created by Grazielli Berti on 16/02/22.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
    //MARK: Variable
    var viewModel = NewsViewModel()
    let cellHeight: CGFloat = 50
    
    //MARK: Views
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        
        setupView()
        configureConstrains()
        //loadData()
    }
    
    fileprivate func setupView() {
        view.addSubview(tableView)
    }
    
    fileprivate func configureConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath) as? NewsTableViewCell else { return UITableViewCell() }
        let petition = viewModel.loadData()[indexPath.row]
        cell.titleLabel.text = (petition as AnyObject).title
        cell.detailLabel.text = (petition as AnyObject).body
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UIViewController: UITableViewDelegate {
}
