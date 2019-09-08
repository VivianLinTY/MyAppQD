//
//  TextKeyboard.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/28.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

class TextKeyboard: UIViewController, UITextFieldDelegate { //接收keyboard的delegate
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        self.textField1.becomeFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){ //點擊畫面空白處時會呼叫
        self.textField1.resignFirstResponder()
        self.textField2.resignFirstResponder()
    }
}
