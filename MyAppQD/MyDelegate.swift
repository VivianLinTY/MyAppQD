//
//  MyDelegate.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/21.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

@UIApplicationMain
class MyDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        print("application")
        self.window?.backgroundColor = UIColor.blueColor()        
        return true
    }
}