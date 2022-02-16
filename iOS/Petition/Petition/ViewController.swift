//
//  ViewController.swift
//  Petition
//
//  Created by Grazielli Berti on 16/02/22.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    //MARK: Variable
    var petitions = [Petition]()
    let cellHeight: CGFloat = 50
    
    //MARK: Views
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PetitionTableViewCell.self, forCellReuseIdentifier: PetitionTableViewCell.reuseIdentifier)
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
        loadData()
    }
    
    fileprivate func loadData() {
        let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parseOurJSONIntoArray(json: data)
                print(data)
            }
        }
    }
    
    fileprivate func parseOurJSONIntoArray(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            print(jsonPetitions)
            tableView.reloadData()
        }
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
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PetitionTableViewCell.reuseIdentifier, for: indexPath) as? PetitionTableViewCell else { return UITableViewCell() }
//        let petition = petitions[indexPath.row]
//        cell.titleLabel.text = petition.title
//        cell.detailLabel.text = petition.body
        cell.configureCell(data: petitions[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UIViewController: UITableViewDelegate {
}
