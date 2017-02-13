//
//  ViewController.swift
//  projectLearning1
//
//  Created by 范名扬 on 16/7/9.
//  Copyright © 2016年 com.hztc. All rights reserved.
//

//  ************ 懒加载

import UIKit

class ViewController: UIViewController {

    //1.Swift中懒加载必须用lazy声明
    //2.懒加载必须 用var变量
    //3.懒加载格式：是一个闭包函数实现(闭包后面的括号就是实现)
    
    //方式一(标准格式)：
    lazy var datalist: [String] = {
        () -> [String]
        in
        print("被加载了")
        return ["hello","world"]
    }()
    
    //格式二（常用格式）：懒加载中闭包的 ()->() in 可以省略
    lazy var datalist2: [String] = {
        print("加载")
        return ["123","456"]
    }()
    
    //格式三：
    let temp = {
        ()-> [String]
        in
        print("加载")
        return ["1","2"]
    }
    lazy var datalist3: [String] = self.temp()
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
//        print(self.datalist)
//        print(datalist3)
        
        
//        let person = MYNewPerson()
//        person.gender = "man"
////        print(person.gender)
//        
//        print(self)
        
        //构造方法
//        let dog = Dog()
        let dog1 = Dog(name1: "cc", age1: 3)
        print(dog1.name)
        print(dog1.age)
    }
    
    

}

