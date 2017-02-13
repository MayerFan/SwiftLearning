//
//  MYNewPerson.swift
//  projectLearning1
//
//  Created by 范名扬 on 16/7/10.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

//  ************* setter和getter方法

import UIKit

class MYNewPerson: NSObject {
    //swift中定义属性必须进行初始化，否则要添加？
    var _name: String?
    var name: String?{
        get{
            return _name
        }
        set{
            _name = newValue
        }
    }
    
    var gender: String?{
        willSet{
            print("willSet")
        }
        didSet{
            print(self)
            print("didSet" + gender!)
        }
    }
    
    var age: Int = 5
    
}
