//
//  *@项目名称:  ToDo
//  *@文件名称:  InputViewControllerTests.swift
//  *@Date 2018/6/11
//  *@Author lanjing
//

import XCTest
import UIKit
import CoreLocation

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
    
    func test_Geocoder_FetchesCoordinates() {
        let address = "Infinite Loop 1, Cupertino"
        let expect = expectation(description: "Geocoder")
        CLGeocoder().geocodeAddressString(address) {
                (placemarks, error) -> Void in
            
            if error != nil {
                 expect.fulfill()
                return
            }
            let coordinate = placemarks?.first?.location?.coordinate
            guard let latitude = coordinate?.latitude else {
                    XCTFail()
                    return
                
            }
            guard let longitude =  coordinate?.longitude else {
                    XCTFail()
                    return
            }
            XCTAssertEqual(latitude, 37.3316, accuracy: 0.001)
            XCTAssertEqual(longitude, -122.0300, accuracy: 0.001)
            expect.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
    }
}
