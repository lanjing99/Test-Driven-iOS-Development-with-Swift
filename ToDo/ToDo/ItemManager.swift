//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemManager.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//  *@Copyright © :  2014-2018 X-Financial Inc.   All rights reserved.
//  *注意：本内容仅限于小赢科技有限责任公内部传阅，禁止外泄以及用于其他的商业目的。
//

import Foundation

class ItemManager{
    var toDoCount : Int {
        return toDoItems.count
    }
    var doneCount : Int {
        return doneItems.count
    }
    private var toDoItems = [ToDoItem]()
    private var doneItems = [ToDoItem]()
    
    func add(_ item: ToDoItem){
        guard toDoItems.contains(item) == false else{
            return
        }
        toDoItems.append(item)
    }
    
    func removeAll(){
        toDoItems.removeAll()
        doneItems.removeAll()
    }
    
    func check(_ item: ToDoItem){
        if let index = toDoItems.index(of: item){
            toDoItems.remove(at: index)
        }
        
        doneItems.append(item)
    }
    
    func item(at index: Int) -> ToDoItem{
        return toDoItems[index]
    }
    
    func doneItem(at index: Int) -> ToDoItem{
        return doneItems[index]
    }
}
