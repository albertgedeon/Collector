//
//  CategoryModel.swift
//  Collector
//
//  Created by Albert Gedeon on 11/21/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import Foundation
import UIKit

protocol CategoryDelegate: class {
    func categoryCreated(category:Category);
    func categoryUpdated(category:Category);
    func categoryDeleted(categroy:Category);
}

protocol ItemDelegate: class {
    func itemCreated(category:Category, item:Item);
    func itemUpdated(category:Category, item:Item);
    func itemDeleted(categroy:Category, item:Item);
}

class Category {
    var name:String;
    var items = [Item]();
    
    init(name:String){
        self.name = name;
    }
}

struct Item{
    var title:String = "";
    var description:String = "";
    var rating:Int = 0;
    var photoURL:URL?;
    var image:UIImage?;
    
    init(title: String, description:String, rating:Int, image:UIImage){
        self.title = title;
        self.description = description;
        self.rating = rating;
        self.image = image;
    }
}

class Model{
    var currentCategories = [Category]();
    weak var categoryDelegate:CategoryDelegate?;
    weak var itemDelegate:ItemDelegate?;
    
    func createCategory(name:String){
        let newCategory = Category(name: name);
        currentCategories.append(newCategory);
        self.categoryDelegate?.categoryCreated(category: newCategory);
    }
    
    func deleteCategory(categoryToDelete:Category) {
        for index in 0 ..< currentCategories.count{
            let currentCategory = currentCategories[index];
            if currentCategory.name == categoryToDelete.name {
                currentCategories.remove(at: index);
                self.categoryDelegate?.categoryDeleted(categroy: currentCategory);
                return;
            }
        }
    }
    
    func getCategories() -> Array<Category>{
        return currentCategories;
    }
    
    func addItemToCategory(category:inout Category, item:Item){
        category.items.append(item);
        self.itemDelegate?.itemCreated(category: category, item: item);
    }
    
    func deleteItemFromCategory(category:inout Category, itemToDelete:Item){
        for index in 0 ..< category.items.count{
            let currentItem = category.items[index];
            if currentItem.title == itemToDelete.title {
                category.items.remove(at: index);
                self.itemDelegate?.itemDeleted(categroy: category, item: currentItem);
                return;
            }
        }
    }
    
    func getItemsFromCategory(category:Category) -> Array<Item>{
        return category.items;
    }
}
