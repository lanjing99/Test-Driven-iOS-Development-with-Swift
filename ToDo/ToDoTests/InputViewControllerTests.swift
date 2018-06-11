//
//  *@项目名称:  ToDo
//  *@文件名称:  InputViewControllerTests.swift
//  *@Date 2018/6/11
//  *@Author lanjing
//

import XCTest
import UIKit
@testable import ToDo

class InputViewControllerTests: XCTestCase {
    var storyBoard : UIStoryboard!
    var inputViewController : InputViewController!
//    var viewController = storyBoard.
    override func setUp() {
        super.setUp()
        storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        inputViewController = storyBoard.instantiateViewController(withIdentifier: "InputViewController") as! InputViewController
        inputViewController.loadViewIfNeeded()


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testUseAtcion(){
        let saveButton = inputViewController.saveButton
        guard let actions = saveButton?.actions(forTarget: inputViewController, forControlEvent: .touchUpInside) else{
            XCTFail()
            return
        }
        XCTAssertTrue(actions.contains("save:"))
    }
    
}
