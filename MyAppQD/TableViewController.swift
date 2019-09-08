//
//  TableViewController.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/28.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate { //需要UITableViewDataSource tableview 有多少個section有多少個row
    var selectArray:Array<NSIndexPath> = []
    
    @IBAction func back(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func addContent(sender: AnyObject) {
        if !(inputField.text?.isEmpty)! {
            print("\(inputField.text!)")
            inputArray.insert(inputField.text!, atIndex: 0)
            self.myTableView.reloadData()
        }
    }
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var myTableView: UITableView!
    var inputArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.brownColor()
        self.myTableView.dataSource = self
        self.myTableView.delegate = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int { //呼叫UITableViewDataSource必須實作 多少section
        return 1
    } //不寫的話預設是1
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //呼叫UITableViewDataSource必須實作 多少row
        return inputArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var myCell:UITableViewCell? = myTableView.dequeueReusableCellWithIdentifier("myCell")//一滑動就會拿到cue
        if myCell == nil {//最一開始的時候是nil
            myCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier: "myCell")
        }
        myCell?.textLabel!.text = inputArray[indexPath.row]
        return myCell!
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? { //是否允許選曲
        if indexPath.row % 2 == 0 {
            return nil
        }else {
            return indexPath
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("select \(indexPath)")
        let cell = myTableView.cellForRowAtIndexPath(indexPath)
        cell?.selectedBackgroundView?.backgroundColor = UIColor.yellowColor()
        selectArray.append(indexPath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData() //更新資料 numberOfSectionsInTableView tableView
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){ //點擊畫面空白處時會呼叫
        self.inputField.resignFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
