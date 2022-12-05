//
//  ViewController.swift
//  ToDoList
//
//  Created by Grazi  Berti on 30/11/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itensArray = [Item]()
    

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        title = "Todoey"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = view.bounds
        
        
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = true
        itensArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itensArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Argentina"
        itensArray.append(newItem3)
        
        let newItem4 = Item()
        newItem4.title = "Brasil"
        itensArray.append(newItem4)
        
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addButtonPressed))
    }
    
    @objc
    func addButtonPressed() {
        var textField = UITextField()
        
        let alert = UIAlertController(
            title: "Add New Todoey Item",
            message: "",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itensArray.append(newItem)
            self.tableView.reloadData()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - TableView DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = itensArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itensArray[indexPath.row].done = !itensArray[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
