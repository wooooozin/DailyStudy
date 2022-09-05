//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        let newItem1 = Item()
        newItem1.title = "Find Mike1"
        itemArray.append(newItem1)
        let newItem2 = Item()
        newItem2.title = "Find Mike2"
    }
    
    // MARK: - Actions

    @IBAction func didTapAddTodo(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            guard let text = textField.text else { return }
            let newItem = Item()
            newItem.title = text
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            self.tableView.reloadData()
        }
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.isDone ? .checkmark : .none
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TodoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        
        tableView.reloadData()

        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
