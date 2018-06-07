//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemListViewControllerTest.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//  *@Copyright © :  2014-2018 X-Financial Inc.   All rights reserved.
//  *注意：本内容仅限于小赢科技有限责任公内部传阅，禁止外泄以及用于其他的商业目的。
//

import XCTest
@testable import ToDo

class ItemListViewControllerTest: XCTestCase {
    
    var itemListViewController: ItemListViewController!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let sb = UIStoryboard(name: "Main", bundle: nil)
        itemListViewController = sb.instantiateInitialViewController() as! ItemListViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTableViewNotNilAfterLoad(){
        
        itemListViewController.loadViewIfNeeded()
        XCTAssertNotNil(itemListViewController.tableView)
    }
    
    func testTableViewDataSource(){
        itemListViewController.loadViewIfNeeded()
        XCTAssertEqual(itemListViewController.tableView.dataSource as? ItemListDataProvider,
                       itemListViewController.tableView.delegate as? ItemListDataProvider)
    }
    
}
