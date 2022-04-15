//
//  ReceiptsViewController.swift
//  VirtualClock
//
//  Created by Grazielli Berti on 23/02/22.
//

import UIKit

class ReceiptsViewController: UIViewController {
    //MARK: - Variable
    var viewModel = ReceiptsViewModel()
    
    //MARK: - View
    let viewPicture: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let receiptsTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ReceiptsTableViewCell.self, forCellReuseIdentifier: ReceiptsTableViewCell.reuseIdentifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        receiptsTableView.dataSource = self
        receiptsTableView.delegate = self
        
        setupView()
        setupControllers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        receiptsTableView.reloadData()
    }
    
    fileprivate func setupView() {
        view.addSubview(viewPicture)
        view.addSubview(receiptsTableView)
    }
    
    fileprivate func setupControllers() {
        NSLayoutConstraint.activate([
            viewPicture.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            viewPicture.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            viewPicture.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            viewPicture.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            viewPicture.heightAnchor.constraint(equalToConstant: 200),
            
            receiptsTableView.topAnchor.constraint(equalTo: viewPicture.bottomAnchor, constant: 0),
            receiptsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            receiptsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            receiptsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

//MARK: - UITableViewDataSource
extension ReceiptsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.businessModel.fetchRegistryList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReceiptsTableViewCell.reuseIdentifier, for: indexPath) as? ReceiptsTableViewCell else {  fatalError("error ao criar ReceiptsTableViewCell") }
        
        let receipts = viewModel.businessModel.fetchRegistryList()[indexPath.row]
        cell.configCell(receipts)
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recibos"
    }
}

//MARK: - UITableViewDelegate
extension ReceiptsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
