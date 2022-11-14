//
//  ViewController.swift
//  Expandable_TableViewCells
//
//  Created by Grazi  Berti on 30/10/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //MARK: - Variable
    private var sections = [Section]()

    //MARK: - View
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        //Set up models
        sections = [
            Section(title: "Section 1", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 2", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 3", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
            Section(title: "Section 4", options: [1, 2, 3].compactMap({ return "Cell \($0)" })),
        ]
        
        
        tableView.frame = view.bounds
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = sections[section]
        if section.isOpened {
            return section.options.count + 1
        } else { return 1 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.textLabel?.text = sections[indexPath.section].title
            cell.backgroundColor = .systemRed
        } else {
            cell.textLabel?.text = sections[indexPath.section].options[indexPath.row - 1]
            cell.backgroundColor = .systemPink
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            sections[indexPath.section].isOpened = !sections[indexPath.section].isOpened
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            print("print sub cell")
        }

    }
    
}

