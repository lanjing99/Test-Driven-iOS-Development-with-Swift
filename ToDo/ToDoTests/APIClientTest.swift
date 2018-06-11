//
//  *@项目名称:  ToDo
//  *@文件名称:  APIClientTest.swift
//  *@Date 2018/6/11
//  *@Author lanjing
//

import XCTest
@testable import ToDo


extension APIClientTest{
    class MockURLSession: SessionProtocol{
        var url: URL?
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask{
            self.url = url
            return URLSession.shared.dataTask(with: url)
        }
    }
}


class APIClientTest: XCTestCase {
    var API: APIClient!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        API = APIClient()
        API.urlSession = MockURLSession.init()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginUsesExpectedHost(){
        
        let mockURLSession = API.urlSession as! MockURLSession
        guard let url = mockURLSession.url else{
            XCTFail()
            return
        }
        
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        
        
    }
    
}
