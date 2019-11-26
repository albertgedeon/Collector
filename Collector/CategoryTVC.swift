//
//  CategoryTVC.swift
//  Collector
//
//  Created by Albert Gedeon on 11/21/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

class CategoryTVC: UITableViewController, UITextFieldDelegate, CategoryDelegate{
    
    let model = Model();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        model.categoryDelegate = self;
    }

    @IBAction func displayAlertForNewCategory(_ sender: Any) {
        let alertController = UIAlertController.init(title: "Create Category", message: "Please enter name for Category", preferredStyle: UIAlertController.Style.alert);
        
        alertController.addTextField { (textField) in
            textField.delegate = self;
            textField.autocapitalizationType = .words;
            textField.returnKeyType = .done;
            textField.placeholder = "Category Name";
        }
        
        alertController.addAction(UIAlertAction.init(title: "Add", style: UIAlertAction.Style.default, handler: { (alertAction) in
            if let name = alertController.textFields?[0].text {
                if name.count > 0 {
                    self.model.createCategory(name: name)
                }
                else{
                    self.displayErrorAlert(message: "Category Name has to contain Characters");
                }
            }
        }));
        alertController.addAction(UIAlertAction.init(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (alertAction) in
            
        }));
        
        if let navController = self.navigationController {
            navController.present(alertController, animated: true, completion: nil);
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell){
            if let itemTVC:ItemsTVC = segue.destination as? ItemsTVC {
                itemTVC.currentCategory = model.currentCategories[indexPath.row];
                itemTVC.model = model;
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.currentCategories.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") ??
             UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CategoryCell");
        
        let currentCategory = model.currentCategories[indexPath.row];
        
        tableViewCell.textLabel?.text = currentCategory.name;
        
        return tableViewCell;
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
    
    func categoryCreated(category: Category) {
        self.tableView.reloadData();
    }
    
    func categoryUpdated(category: Category) {
        self.tableView.reloadData();
    }
    
    func categoryDeleted(categroy: Category) {
        self.tableView.reloadData();
    }
    
    func displayErrorAlert(message:String){
        let alertController = UIAlertController.init(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert);
        alertController.addAction(UIAlertAction.init(title: "Okay", style: UIAlertAction.Style.cancel, handler: { (alertAction) in
            
        }));
        if let navController = self.navigationController {
            navController.present(alertController, animated: true, completion: nil);
        }
    }
}
