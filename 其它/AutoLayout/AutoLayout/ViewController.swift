//
//  ViewController.swift
//  AutoLayout
//
//  Created by 范名扬 on 16/7/11.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var layout: NSLayoutConstraint!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    //首先介绍屏幕适配发展历史
    /*
     一、iPhone3GS\iPhone4
        1.没有屏幕适配概念
        2.全部用frame,bounds,center进行布局
        3.坐标值、宽高度都写死
     二、iPad出现、iPhone\iPad横屏
        1.出现了Autoresizing技术
            a.让横竖屏适配相对简单
            b.让子控件跟随父控件的行为相应的发生变化
            c.使用autoresizing技术的前提必须关闭autolayout
        2.Autoresizing局限性：
            a.只能解决子控件和父控件相对关系问题
            b.不能解决兄弟关系的相对问题
     三、iOS6.0开始 Autolayout出现
        1.从iOS7.0开始 Autolayout技术才兴起
    */
    
    /*Autolayout技术
     一、两个核心概念
        a.参照
        b.约束
     
       //兄弟间关系的约束对象被父控件所管理
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        
//        let str1 = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
        
//        let str2 = "123456789"
        
//        if label2.text == str1 {
//            label2.text = str2
//        }else{
//            label2.text = str1
//        }
        
        layout.constant += 50
        
    }

}

