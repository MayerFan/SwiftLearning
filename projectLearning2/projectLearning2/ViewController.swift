//
//  ViewController.swift
//  projectLearning2
//
//  Created by 范名扬 on 16/7/10.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        
        let btn = UIButton(type: UIButtonType.ContactAdd)
        btn.center = CGPoint(x: view.frame.size.width/2, y: view.frame.size.height/2)
        btn.addTarget(self, action: #selector(btnClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btn)
    }

    func btnClick(btn: UIButton) {
        print("btnClick")
        print(btn)
    }
    
    func btnClick() {
        print("进来吗")
    }
}

