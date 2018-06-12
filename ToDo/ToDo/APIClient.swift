//
//  *@项目名称:  ToDo
//  *@文件名称:  APIClient.swift
//  *@Date 2018/6/11
//  *@Author lanjing 
//

import UIKit

class APIClient: NSObject {
    lazy var urlSession: SessionProtocol? = URLSession.shared
    
    func loginUser(withUserName userName: String, password: String, completion: @escaping (Token?, Error?) -> Void){
        var urlComponents = URLComponents.init(url: URL.init(string:"https://awesometodos.com")!, resolvingAgainstBaseURL: true)
        urlComponents?.path = "/login"
        urlComponents?.query = "userName=\(userName)&password=\(password)"
        guard let url = urlComponents?.url else{
            fatalError()
        }
        
       let task = urlSession?.dataTask(with: url, completionHandler: { (data, response, error) in
        guard let data = data, let tempDic = try? JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments),
                let dic = tempDic as? [String:String], let tokenID = dic["token"] else{
                    completion(nil, NSError.init())
                    return
        }
            let token = Token.init(id: tokenID)
            completion(token, nil)
        })
        task?.resume()
    }

}

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol{
    
}
