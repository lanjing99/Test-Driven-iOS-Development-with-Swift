//
//  *@项目名称:  ToDo
//  *@文件名称:  ToDoItemTests.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//

import XCTest
import CoreLocation

@testable import ToDo

class ToDoItemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    

    func testToDoItemInit(){
        let todo = ToDoItem(title:"name", description:"a short discription")
        XCTAssertTrue(todo.title == "name", "set an item name")
        XCTAssertTrue(todo.description == "a short discription","set an item description")
        
        
        let todo1 = ToDoItem(title: "name")
        XCTAssertTrue(todo1.description == nil, "descrition should be optional")
    }
    
    func testInitSetTimeStamp(){
        let todo = ToDoItem.init(title: "name", timestamp: 1.0)
        XCTAssertTrue(todo.timestamp == 1.0, "set timestamp")
    }
    
    func testLocationInit(){
//        let todo = ToDoItem(title: "name", location: )
        let location = Location(name: "Shenzhen")
        XCTAssertTrue(location.name == "Shenzhen", "set location name")
        
        let cordinate = CLLocationCoordinate2D.init(latitude: 1.0, longitude: 2.0)
        let location1 = Location.init(name: "shenzhen", cordinate: cordinate)
//        XCTAssertTrue(location1.cordinate! == cordinate, "set cordinate")
//        XCTAssertEqual(location1.cordinate!, cordinate)
        XCTAssertEqual(location1.cordinate!.latitude, 1.0)
        XCTAssertEqual(location1.cordinate!.longitude, 2.0)
        
    }
    
    func testEqual() {
        let item1 = ToDoItem.init(title: "abcd")
        let item2 = ToDoItem.init(title: "abcd")
        XCTAssertEqual(item1, item2, "should equal")
        let item3 = ToDoItem.init(title: "abc")
        XCTAssertNotEqual(item1, item3, "should Not equal")
        let item4 = ToDoItem.init(title: "abcd", description: "a")
        XCTAssertNotEqual(item1, item4, "should Not equal")
    }
    
    func testOptional(){
        let v1 :String? = nil
        let v2 :String? = nil
        XCTAssertEqual(v1, v2)
    }
}
