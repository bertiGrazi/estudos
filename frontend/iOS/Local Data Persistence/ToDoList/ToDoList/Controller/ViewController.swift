//
//  ViewController.swift
//  ToDoList
//
//  Created by Grazi  Berti on 30/11/22.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itensArray = [Item]()
    let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

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
        
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itensArray = items
//        }
        
        setupNavigation()
        loadItems()
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

            self.saveItems()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        //self.defaults.set(self.itensArray, forKey: "TodoListArray")
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - Model Manupulation Methods
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itensArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itensArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("\(error)")
            }
        }
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
        
        self.saveItems()
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
