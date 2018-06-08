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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.bindData(self.toDoItem(at: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                let item = itemManager.item(at: indexPath.row)
                itemManager.check(item)
            }else{
                let item = itemManager.doneItem(at: indexPath.row)
                itemManager.uncheck(item)
            }
            
        }
    }
    
    func toDoItem(at indexPath: IndexPath) -> ToDoItem{
        guard let itemSection = Section(rawValue: indexPath.section) else{
            fatalError()
        }
        
        switch itemSection {
        case .toDo:
            return itemManager.item(at: indexPath.row)
        case .done:
            return itemManager.doneItem(at: indexPath.row)
        }
    }
}

extension ItemListDataProvider: UITableViewDelegate{
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        if indexPath.section == 0 {
            return "Check"
        }else{
            return "Uncheck"
        }
    }
}
