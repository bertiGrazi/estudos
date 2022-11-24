//
//  ViewController.swift
//  Pagination
//
//  Created by Grazi  Berti on 23/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let apiCaller = APICaller()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var data = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        apiCaller.fetchData(pagination: false, completion: { [weak self] result  in
            switch result {
            case .success(let data):
                self?.data.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        })
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    private func createSpinnerFottoer() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (tableView.contentSize.height-100 - scrollView.frame.size.height) {
            /// fetch more data
            guard !apiCaller.isPaginating else {
                /// we are alreary fetching more data
                return
            }
            self.tableView.tableFooterView = createSpinnerFottoer()
            apiCaller.fetchData(pagination: true) { result in
                DispatchQueue.main.async {
                    self.tableView.tableFooterView = nil
                }
                switch result {
                case .success(let moreData):
                    self.data.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
        }
    }
}
