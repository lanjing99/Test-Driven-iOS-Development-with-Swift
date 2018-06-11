//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemCellTests.swift
//  *@Date 2018/6/11
//  *@Author lanjing 
//

import XCTest
@testable import ToDo

extension ItemCellTests{
    class FakeDataSource: NSObject, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell.init()
        }
        
        
    }
}


class ItemCellTests: XCTestCase {
    
    var storyBoard: UIStoryboard!
    var viewController: ItemListViewController!
    var tableView: UITableView!
    var cell: ItemCell!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyBoard.instantiateInitialViewController() as! ItemListViewController
        viewController.loadViewIfNeeded()
        tableView = viewController.tableView
        tableView?.dataSource = FakeDataSource.init()
        cell = tableView?.dequeueReusableCell(withIdentifier: "ItemCell", for: IndexPath(row: 0, section: 0)) as! ItemCell
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCellHasTitleLabel(){
        
        XCTAssertNotNil(cell.textLabel != nil)
    }
    
    func testCellTitle(){
        let item = ToDoItem.init(title: "TODO")
        cell.bindData(item)
        XCTAssertEqual(cell.textLabel?.text, "TODO")
    }
    
    func testCheckedCellTitle(){
        let item = ToDoItem.init(title: "TODO")
        cell.bindData(item, checked:true)
        let at = cell.titleLabel.attributedText
        //FIX 判断一下UI的属性
        XCTAssertEqual(at?.string , "TODO")
    }
    
}



















