//
//  GrayView.swift
//  MyAppQD
//
//  Created by VVN on 2016/7/22.
//  Copyright © 2016年 VVN. All rights reserved.
//

import UIKit

class GrayView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    //如果disable user interaction enable那麼touch事件就沒有用
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("GrayView touchesBegan")
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("GrayView touchesMoved")
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?){
        print("GrayView touchesEnded")
    }
    override func canBecomeFirstResponder() -> Bool {
        return true //view 必須要有繼承UIResponder
    }
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) { //motion controller
        if motion == UIEventSubtype.MotionShake {
            print("GrayView Got motion event")
        }
    }
}
