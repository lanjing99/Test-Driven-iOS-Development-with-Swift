//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemListDataProvider.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//  *@Copyright © :  2014-2018 X-Financial Inc.   All rights reserved.
//  *注意：本内容仅限于小赢科技有限责任公内部传阅，禁止外泄以及用于其他的商业目的。
//

import UIKit

class ItemListDataProvider: NSObject {

}

extension ItemListDataProvider: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
}

extension ItemListDataProvider: UITableViewDelegate{
    
}
