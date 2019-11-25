//
//  ItemsTVC.swift
//  Collector
//
//  Created by Albert Gedeon on 11/22/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

class ItemsTVC: UITableViewController{
    var currentCategory:Category?;
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCategory?.items.count ?? 0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") ??
            UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CategoryCell");
        
        if let currentItem = currentCategory?.items[indexPath.row] {
            tableViewCell.textLabel?.text = currentItem.title;
        }
        return tableViewCell;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addItemVC:AddItemVC = segue.destination as? AddItemVC {
            addItemVC.currentCategory = self.currentCategory;
        }
    }
}
