//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemListDataProviderTest.swift
//  *@Date 2018/6/7
//  *@Author lanjing
//

import XCTest
@testable import ToDo

extension ItemListDataProviderTest{
    class MockTableView: UITableView{
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MockItemCell: ItemCell{
        var configCellGotCalled = false
        override func bindData(_ item: ToDoItem, checked: Bool = false){
            super.bindData(item)
            configCellGotCalled = true
        }
    }
}


class ItemListDataProviderTest: XCTestCase {
    
    var dp:ItemListDataProvider!
    var tableView: UITableView!
    var itemListViewController: ItemListViewController!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dp = ItemListDataProvider()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        itemListViewController = sb.instantiateInitialViewController() as! ItemListViewController
        itemListViewController.loadViewIfNeeded()
        tableView = itemListViewController.tableView
        tableView.dataSource = dp
        tableView.delegate = dp
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func mockTable(withDataSource dataSource:UITableViewDataSource) -> MockTableView{
        let table = MockTableView.init(frame: CGRect.init(x: 0, y: 0, width: 320, height: 480), style: .plain)
        table.register(MockItemCell.self, forCellReuseIdentifier: "ItemCell")
        table.dataSource = dataSource
        return table
    }
    
    
    func testNumberOfSectionsIsTow(){
        XCTAssertTrue(tableView.numberOfSections == 2)
    }
    
    func testNumberOfRowsInFirstSection(){
        let item = ToDoItem.init(title: "name")
        dp.itemManager.add(item)
        XCTAssertTrue(tableView.numberOfRows(inSection: 0) == 1)
        let item1 = ToDoItem.init(title: "name1")
        dp.itemManager.add(item1)
        tableView.reloadData()   //需要重新加载tableView才能测试到
        XCTAssertTrue(tableView.numberOfRows(inSection: 0) == 2)
    }
    
    func testNumberOfRowsInSecondSection(){
        let item = ToDoItem.init(title: "name")
        dp.itemManager.add(item)
        dp.itemManager.check(item)
        XCTAssertTrue(tableView.numberOfRows(inSection: 1) == 1)
        let item1 = ToDoItem.init(title: "name1")
        dp.itemManager.add(item1)
        dp.itemManager.check(item1)
        tableView.reloadData()   //需要重新加载tableView才能测试到
        XCTAssertTrue(tableView.numberOfRows(inSection: 1) == 2)
    }
    
    func testCellForFow(){
        dp.itemManager.add(ToDoItem(title: "name"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is ItemCell)
    }
    
    func testMockTableView(){
        let table = mockTable(withDataSource: dp)
        
        dp.itemManager.add(ToDoItem.init(title: "name"))
        table.reloadData()
        _ = table.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(table.cellGotDequeued == true)
    }
    
    func testMockTableViewCell(){
        
        let table = mockTable(withDataSource: dp)
        
        dp.itemManager.add(ToDoItem.init(title: "name"))
        table.reloadData()
        let cell = table.cellForRow(at: IndexPath(row: 0, section: 0)) as! MockItemCell
        
        XCTAssertTrue(cell.configCellGotCalled)
        XCTAssertEqual(cell.item!, ToDoItem.init(title: "name"))
        
    }
    
    func testDoneItemCell(){
        
        let table = mockTable(withDataSource: dp)
        dp.itemManager.add(ToDoItem.init(title: "name"))
        dp.itemManager.check(ToDoItem.init(title: "name"))
        table.reloadData()
        let cell = table.cellForRow(at: IndexPath(row: 0, section: 1)) as! MockItemCell
        
        XCTAssertTrue(cell.configCellGotCalled)
        XCTAssertEqual(cell.item!, ToDoItem.init(title: "name"))
        
    }
    
    func testCheckItemInSection0(){
        let item = ToDoItem.init(title: "test")
        dp.itemManager.add(item)
        tableView.reloadData()
        
        tableView.dataSource?.tableView?(tableView, commit: .delete, forRowAt: IndexPath(row: 0, section: 0))
        tableView.reloadData()
        
        XCTAssertTrue(dp.itemManager.toDoCount == 0)
        XCTAssertTrue(dp.itemManager.doneCount == 1)
        XCTAssertTrue(tableView.numberOfRows(inSection: 0) == 0)
        XCTAssertTrue(tableView.numberOfRows(inSection: 1) == 1)
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 1)) as! ItemCell
        XCTAssertEqual(cell.item, item)
        
    }
    
    
    
    
    
    //test tableview delegate
    func testDeleteButtonTitleInSection0(){
        let title = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(title, "Check")
    }
    
    func testDeleteButtonTitleInSection1(){
        let title = tableView.delegate?.tableView?(tableView, titleForDeleteConfirmationButtonForRowAt: IndexPath(row: 0, section: 1))
        XCTAssertEqual(title, "Uncheck")
    }

}

















