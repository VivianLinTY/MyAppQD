//
//  ViewController.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/21.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var input2: UITextField!
    @IBOutlet weak var input1: MyLabel!
    @IBOutlet weak var mySum: UITextField!
    @IBOutlet weak var myButton: UIButton!
    var blueView:UIView?
    var backStr:String = ""
//    var destVC:SecondViewController?
    
    @IBAction func mySliderAction(sender: UISlider) {
        print(sender.value)
        self.input1.text = String(sender.value)
    }
    
    @IBAction func actionButton(sender: AnyObject) {
        let value1:Float? = Float(self.input1.text!)
        let value2:Float? = Float(self.input2.text!)
        if (value1 != nil) && (value2 != nil){
            self.mySum.text = String(value1!) + "+" + String(value2!) + "=" + String(value1! + value2!)
        }
        //自己call view controller的方式
//        let blueVC:BlueViewController? = self.storyboard?.instantiateViewControllerWithIdentifier("blueController") as? BlueViewController
//        blueVC?.myLabelString = self.input1.text!
//        self.presentViewController(blueVC!, animated: true, completion: nil)
//        self.showViewController(blueVC!, sender: AnyObject?)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
        self.input1.text = "100"
        self.input2.text = "2000"
        self.myButton.addTarget(self, action: Selector("setBackgroundColor"), forControlEvents: UIControlEvents.TouchDown)
        self.myButton.addTarget(self, action: Selector("setBackgroundColor:"), forControlEvents: UIControlEvents.TouchUpInside)
        
//        self.input2.becomeFirstResponder() //預設一開始input要接收keyboard事件
    }
    
    override func viewWillAppear(animated: Bool) {
//        self.becomeFirstResponder()
        self.grayView.becomeFirstResponder()
    }
    override func canBecomeFirstResponder() -> Bool {
        return true //view 必須要有繼承UIResponder
    }
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) { //motion controller
        if motion == UIEventSubtype.MotionShake {
            print("Got motion event")
        }
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = UIColor.blueColor()
    }

    func setBackgroundColor(arg:UIButton) {  //參數的型別為呼叫method的物件
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destVC:SecondViewController? = segue.destinationViewController as? SecondViewController
        destVC?.temp_str = self.input1.text!
    }
    
    //prepareForSegue的segue和home的segue
    @IBAction func home(segue:UIStoryboardSegue) { //如果沒有IB開頭 就是無法在storyboard看到 解綁的函數第一個參數必須是storyboard
        let destVC:SecondViewController? = segue.sourceViewController as? SecondViewController
        print(destVC?.myLabel.text)
        self.input2.text = destVC?.myLabel.text
    }
    
    @IBOutlet weak var grayView: GrayView!
//    override func viewDidAppear(animated: Bool) {
//        self.input2.text = backStr
//    }
//    override func viewWillAppear(animated: Bool) {
//        
//    }
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func addView(sender: UIButton) {
        blueView = UIView()
        blueView!.tag = 11
        blueView!.frame = CGRectMake(200, 200, 120, 50)
        blueView!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(blueView!)
        let path = "/Users/apple/Desktop/CFNetworkDownload_859NZm.jpg"
//        let data:NSData = NSData(contentsOfFile: path)!
//        let image = UIImage(data:data)
        let image = UIImage(contentsOfFile: path)
        self.myImageView.image = image //set image to imageview
        
        //設定動畫
        let image1 = UIImage(contentsOfFile: path)
        let image2 = UIImage(contentsOfFile: path)
        self.myImageView.animationImages = [image1!,image2!]
        self.myImageView.animationDuration = 0.5
        self.myImageView.startAnimating()
        
        sender.enabled = !sender.enabled
    }
    
    @IBAction func removeView(sender: AnyObject) {
//        let bView = self.view.viewWithTag(11)
//        bView?.removeFromSuperview()
        moveView()
    }
    
    func moveView() {
//        UIView.animateWithDuration(1.0) {
//            self.blueView?.center = CGPoint(x: 50,y: 50)
//        }
        
        //usingSpringWithDamping會來回震盪 completion用在動畫結束後要做什麼事情
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {self.blueView?.center = CGPoint(x: 50,y: 50)}, completion: setCompelete)
    }
    
    func setCompelete(b:Bool){
        self.blueView?.center = CGPoint(x: 100,y: 100)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){ //點擊畫面空白處時會呼叫
        print("ViewController touchesBegan")
        self.mySum.resignFirstResponder() //textField被點擊是會呼叫FirstResponder FirstResponder接收任何事件 包含keyboard事件 resignFirstResponder可讓keyboard消失
        self.input2.resignFirstResponder()
    }
//    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?){
//        print("ViewController touchesMoved")
//    }
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
//        print("ViewController touchesEnded")
//    }

}

