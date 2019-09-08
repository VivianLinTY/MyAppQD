//
//  BlueViewController.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/21.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet var myLabel: [UILabel]!
    var myLabelString:String? = ""
    
    override func viewDidLoad() { //view都init好了呼叫
        super.viewDidLoad()
        print(myLabelString)
        // Do any additional setup after loading the view.
    }

    @IBAction func back(sender: AnyObject) { //回到原來的
        self.dismissViewControllerAnimated(true, completion: nil)
//        let oriVC:ViewController? = self.storyboard?.instantiateViewControllerWithIdentifier("originalViewController") as? ViewController
//        oriVC?.backStr = "10000000"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
