//
//  *@项目名称:  ToDo
//  *@文件名称:  LocationTest.swift
//  *@Date 2018/6/6
//  *@Author lanjing
//

import XCTest
import CoreLocation

@testable import ToDo

class LocationTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEqual(){
        let location1 = Location.init(name: "abcd")
        let location2 = Location.init(name: "abcd")
        XCTAssertEqual(location1, location2)
        
        let cordinate1 = CLLocationCoordinate2D.init(latitude: 0.1, longitude: 0.1)
        let cordinate2 = CLLocationCoordinate2D.init(latitude: 0.1, longitude: 0.1)
        let location3 = Location.init(name: "abcd", cordinate: cordinate1)
        let location4 = Location.init(name: "abcd", cordinate: cordinate2)
        XCTAssertEqual(location3, location4)
    }
    
    func testNotEqual(){
        let location1 = Location.init(name: "abcd")
        let location2 = Location.init(name: "1234")
        XCTAssertNotEqual(location1, location2)
        
        let cordinate1 = CLLocationCoordinate2D.init(latitude: 0.1, longitude: 0.1)
        let cordinate2 = CLLocationCoordinate2D.init(latitude: 0.1, longitude: 0.2)
        let location3 = Location.init(name: "abcd", cordinate: cordinate1)
        let location4 = Location.init(name: "abcd", cordinate: cordinate2)
        XCTAssertNotEqual(location3, location4)
    }
    
}
