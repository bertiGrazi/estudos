//
//  SwiftTutorialsViewController.swift
//  Pagination
//
//  Created by Grazi  Berti on 24/11/22.
//

import UIKit

class SwiftTutorialsViewController: UIViewController {

    var recordsArray: [Int] = Array()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        tableView.dataSource = self
//        tableView.delegate = self
    }
}
//
//extension SwiftTutorialsViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
//}
