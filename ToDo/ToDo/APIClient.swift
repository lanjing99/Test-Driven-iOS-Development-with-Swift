//
//  *@项目名称:  ToDo
//  *@文件名称:  APIClient.swift
//  *@Date 2018/6/11
//  *@Author lanjing 
//

import UIKit

class APIClient: NSObject {
    lazy var urlSession: SessionProtocol? = URLSession.shared

}

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) -> URLSessionDataTask
}

extension URLSession: SessionProtocol{
    
}
