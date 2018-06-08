//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemCell.swift
//  *@Date 2018/6/7
//  *@Author lanjing 
//  *@Copyright © :  2014-2018 X-Financial Inc.   All rights reserved.
//  *注意：本内容仅限于小赢科技有限责任公内部传阅，禁止外泄以及用于其他的商业目的。
//

import UIKit

class ItemCell: UITableViewCell {
    var item: ToDoItem?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(_ item: ToDoItem){
        self.item = item
        textLabel?.text = item.title
    }
}
