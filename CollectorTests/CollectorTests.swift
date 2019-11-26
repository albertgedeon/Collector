//
//  CollectorTests.swift
//  CollectorTests
//
//  Created by Albert Gedeon on 11/21/19.
//  Copyright © 2019 Albert Gedeon. All rights reserved.
//

import XCTest
@testable import Collector

class CollectorTests: XCTestCase {

    let model = Model();
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        XCTAssert(model.getCategories().count == 0);
        
        model.createCategory(name: "TestCreate");
        XCTAssert(model.getCategories().count == 1);
        
        var currentCategory = model.getCategories()[0];
        XCTAssert(currentCategory.items.count == 0);
        
        model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
        XCTAssert(currentCategory.items.count == 1);
        
        XCTAssert(currentCategory.name == "TestCreate");
        let item = currentCategory.items[0];
        
        XCTAssert(item.title == "TestItem1");
        XCTAssert(item.description == "TestItemDescription");
        XCTAssert(item.rating != 4);
        
        model.deleteCategory(categoryToDelete: currentCategory);
        XCTAssert(model.getCategories().count == 0);
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            model.createCategory(name: "TestCreate1");
            model.createCategory(name: "TestCreate2");
            model.createCategory(name: "TestCreate3");
            model.createCategory(name: "TestCreate4");
            model.createCategory(name: "TestCreate5");
            
            var currentCategory = model.getCategories()[0];
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1Cat1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem2Cat1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem3Cat1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem4Cat1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem5Cat1", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            
            currentCategory = model.getCategories()[1];
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1Cat2", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem2Cat2", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem3Cat2", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem4Cat2", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem5Cat2", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            
            currentCategory = model.getCategories()[2];
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1Cat3", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem2Cat3", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem3Cat3", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem4Cat3", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem5Cat3", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            
            currentCategory = model.getCategories()[3];
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1Cat4", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem2Cat4", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem3Cat4", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem4Cat4", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem5Cat4", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            
            currentCategory = model.getCategories()[4];
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem1Cat5", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem2Cat5", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem3Cat5", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem4Cat5", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
            model.addItemToCategory(category: &currentCategory, item: Item(title: "TestItem5Cat5", description: "TestItemDescription", rating: 5, image: ImageGenerator.createTestImage()));
        }
    }

}
