//
//  *@项目名称:  ToDo
//  *@文件名称:  ItemListViewController.swift
//  *@Date 2018/6/6
//  *@Author lanjing 
//

import UIKit

class ItemListViewController: UIViewController{
    

    @IBOutlet var dataProvider: ItemListDataProvider!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = dataProvider 
        tableView.delegate = dataProvider
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

}





