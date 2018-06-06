//
//  *@项目名称:  ToDo
//  *@文件名称:  ToDoItem.swift
//  *@Date 2018/6/6
//  *@Author lanjing
//

import Foundation

struct ToDoItem : Equatable{
    let title: String
    let description: String?
    let timestamp: Double?
    let location: Location?
    
    init(title: String, description: String? = nil, timestamp: Double? = nil, location: Location? = nil) {
        self.title = title
        self.description = description
        self.timestamp = timestamp
        self.location = location
    }
    
//    public static func == (lhs: ToDoItem, rhs: ToDoItem) -> Bool{
//
//        if lhs.title != rhs.title {
//            return false
//        }
//
//        if lhs.description != rhs.description {
//            return false
//        }
//
//        if lhs.timestamp != rhs.timestamp {
//            return false
//        }
//        
//        if lhs.location != rhs.location {
//            return false
//        }
//
//        return true
//    }
    
}
