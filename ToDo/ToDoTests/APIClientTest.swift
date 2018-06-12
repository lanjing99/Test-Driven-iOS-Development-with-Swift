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
        var urlComponents: URLComponents?
        private let dataTask: MockTask
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            dataTask = MockTask.init(data: data, urlResponse: urlResponse, error: error)
        }
        
        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask{
            self.url = url
            self.urlComponents = URLComponents.init(url: url, resolvingAgainstBaseURL: true)
            dataTask.completionHandler = completionHandler
            return self.dataTask
        }
    }
    
    class MockTask: URLSessionDataTask{
        private let data: Data?
        private let urlResponse: URLResponse?
        private let responseError: Error?
        
        typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
        
        var completionHandler: CompletionHandler?
        
        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = error
            super.init()
        }
        
        override func resume() {
            DispatchQueue.main.async {
                self.completionHandler?(self.data, self.urlResponse, self.responseError)
            }
        }
    }
}


class APIClientTest: XCTestCase {
    var API: APIClient = APIClient()
    
    var mockURLSession: MockURLSession!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let data = "{\"token\" : \"1234567890\"}".data(using: .utf8)
        mockURLSession = MockURLSession.init(data: data, urlResponse: nil, error: nil)
        API.urlSession = mockURLSession
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //验证网络请求URL和参数是否正确
    func testLoginUsersExpectedURLComponents(){

        API.loginUser(withUserName: "abcd", password: "1234") { (token, error) in

        }

        XCTAssertEqual(mockURLSession.urlComponents!.host, "awesometodos.com")
        XCTAssertEqual(mockURLSession.urlComponents!.path, "/login")
        XCTAssertEqual(mockURLSession.urlComponents!.query, "userName=abcd&password=1234")

    }
    
    //验证网络请求响应的结果是否正确
    func testLoginUsersExpectedToken(){
        let expect = expectation(description: "login")
        var expectedToken: Token?
        API.loginUser(withUserName: "abcd", password: "1234") { (token, error) in
            expectedToken = token
            expect.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { (error) in
            XCTAssertEqual(expectedToken?.id, "1234567890")
        }
    }
    
    
}
