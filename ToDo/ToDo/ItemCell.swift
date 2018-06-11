//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemCell.swift
//  *@Date 2018/6/7
//  *@Author lanjing 
//

import UIKit

class ItemCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    var item: ToDoItem?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func bindData(_ item: ToDoItem, checked: Bool = false){
        self.item = item
        if checked {
            let at = NSAttributedString.init(string: item.title, attributes: [NSAttributedStringKey.strikethroughStyle:NSUnderlineStyle.styleSingle])
            titleLabel?.attributedText = at
        }else{
            titleLabel?.text = item.title
        }
    }
}
