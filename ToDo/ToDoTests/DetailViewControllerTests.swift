//
//  *@项目名称:  ToDo
//  *@文件名称:  DetailViewControllerTests.swift
//  *@Date 2018/6/11
//  *@Author lanjing
//

import XCTest
@testable import ToDo

class DetailViewControllerTests: XCTestCase {
    var storyboard: UIStoryboard!
    var detailViewController: DetailViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasTitleLabel(){
        let titleLabel = detailViewController.titleLabel!
        XCTAssertTrue(titleLabel.isDescendant(of: detailViewController.view))
    }
    
    
}
