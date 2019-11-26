//
//  ItemsTVC.swift
//  Collector
//
//  Created by Albert Gedeon on 11/22/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

class ItemsTVC: UITableViewController, ItemDelegate{
    var currentCategory:Category?;
    var model:Model?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.tableView.register(UINib(nibName: "ItemTVCell", bundle: Bundle.main), forCellReuseIdentifier: "ItemTVCell")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        self.model?.itemDelegate = self;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCategory?.items.count ?? 0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTVCell") as? ItemTVCell{
            if let currentItem = currentCategory?.items[indexPath.row] {
                cell.itemTitle?.text = currentItem.title;
                cell.itemDescription?.text = currentItem.description;
                cell.itemRating?.text = "Rating: " + String(currentItem.rating);
                cell.itemImageView?.image = currentItem.image;
                
                return cell;
            }
        }
        //Should not really get here
        return tableView.dequeueReusableCell(withIdentifier: "ItemTVCell")!;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addItemVC:AddItemVC = segue.destination as? AddItemVC {
            addItemVC.currentCategory = self.currentCategory;
            addItemVC.model = model;
        }
    }
    
    func itemCreated(category: Category, item: Item) {
        self.tableView.reloadData();
    }
    
    func itemUpdated(category: Category, item: Item) {
        self.tableView.reloadData();
    }
    
    func itemDeleted(categroy: Category, item: Item) {
        self.tableView.reloadData();
    }
}
