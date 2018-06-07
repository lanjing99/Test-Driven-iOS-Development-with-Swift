//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemListDataProvider.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//

import UIKit
enum Section: Int{
    case toDo
    case done
}


class ItemListDataProvider: NSObject {
    let itemManager = ItemManager.init()

}

extension ItemListDataProvider: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let itemSection = Section(rawValue: section) else{
            fatalError()
        }
        
        switch itemSection {
        case .toDo:
            return itemManager.toDoCount
        case .done:
            return itemManager.doneCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ItemCell.init()
    }
}

extension ItemListDataProvider: UITableViewDelegate{
    
}
