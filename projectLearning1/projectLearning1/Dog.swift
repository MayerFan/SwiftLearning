//
//  Dog.swift
//  projectLearning1
//
//  Created by 范名扬 on 16/7/10.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

//  ************* 构造方法


import UIKit

class Dog: NSObject {
    
    //1.swift定义属性的时候必须要初始化,否则变成可选类型
    //2.如果构造方法中对属性进行了初始化，那么就可以不用设置为可选类型，其实质也是进行了初始化
//    var name: String?
//    var age: Int?
    
    var name: String
    var age: Int
    
    //如果自定义的了构造方法，且不重写类的默认方法，那么类的默认构造方法就失效；如果重写了默认构造方法，则自定义方法和默认方法都有效
    override init() {//重写类的构造方法
        name = "bb"
        age = 5
    }
    
    //自定义构造方法
    //swift中引入重载概念 重载：就是函数名一样 
    //重载的函数必须要保证形参或者返回值不一样就可
    init(name1: String, age1: Int){
        name = name1
        age = age1
        
    }
    
}
