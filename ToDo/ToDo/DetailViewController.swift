//
//  *@项目名称:  ToDo
//  *@文件名称:  DetailViewController.swift
//  *@Date 2018/6/11
//  *@Author lanjing 
//

import UIKit

class DetailViewController: UIViewController {
    var titleLabel: UILabel? = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleLabel!)
        // Do any additional setup after loading the view.
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
