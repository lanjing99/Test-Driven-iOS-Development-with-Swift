//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemManagerTests.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//

import XCTest

@testable import ToDo


class ItemManagerTests: XCTestCase {
    
    var manager: ItemManager!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        manager = ItemManager.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testManagerInit(){
        XCTAssertTrue(manager.toDoCount == 0, "set init todo count")
    }

    func testMangerAddItem(){
        let item = ToDoItem.init(title: "Shopping")
        manager.add(item)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
        
        XCTAssertEqual(item, manager.item(at: 0), "should get equal toDoItem")
    }
    
    func testAddItem(){
        let item = ToDoItem.init(title: "Shopping")
        manager.add(item)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
    }
    
    func testAddDuplicateItem(){
        let item = ToDoItem.init(title: "Shopping")
        manager.add(item)
        manager.add(item)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
    }
    
    func testCheckItem(){
        let item = ToDoItem.init(title: "Shopping")
        manager.add(item)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
        manager.check(item)
        XCTAssertTrue(manager.toDoCount == 0, "add one to do item")
        XCTAssertTrue(manager.doneCount == 1, "add one to do item")
        XCTAssertEqual(item, manager.doneItem(at: 0), "should get equal toDoItem")
        
    }
    
    func testRemoveItems(){
        let first = ToDoItem.init(title: "first")
        let second = ToDoItem.init(title: "second")
        manager.add(first)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
        XCTAssertEqual(first, manager.item(at: 0), "should get equal toDoItem")
        manager.add(second)
        XCTAssertTrue(manager.toDoCount == 2, "add one to do item")
        XCTAssertEqual(second, manager.item(at: 1), "should get equal toDoItem")
        
        manager.check(first)
        XCTAssertTrue(manager.toDoCount == 1, "add one to do item")
        XCTAssertEqual(second, manager.item(at: 0), "should get equal toDoItem")
        XCTAssertTrue(manager.doneCount == 1, "add one to do item")
        XCTAssertEqual(first, manager.doneItem(at: 0), "should get equal toDoItem")
        
        manager.check(second)
        XCTAssertTrue(manager.toDoCount == 0, "add one to do item")
        XCTAssertTrue(manager.doneCount == 2, "add one to do item")
        XCTAssertEqual(first, manager.doneItem(at: 0), "should get equal toDoItem")
        XCTAssertEqual(second, manager.doneItem(at: 1), "should get equal toDoItem")
        
    }
    
    func testRemoveAllItems(){
        let first = ToDoItem.init(title: "first")
        let second = ToDoItem.init(title: "second")
        manager.add(first)
        manager.add(second)
        XCTAssertTrue(manager.toDoCount == 2)
        manager.check(first)
        manager.removeAll()
        XCTAssertTrue(manager.toDoCount == 0)
        XCTAssertTrue(manager.doneCount == 0)
        
    }
    
}
