//
//  MYDictionaryExtension.swift
//  CodeAboutAutoLayout
//
//  Created by 范名扬 on 16/7/18.
//  Copyright © 2016年 com.hztc. All rights reserved.
//
//  字典扩展类

import UIKit

class MYDictionaryExtension: NSObject {

}

extension Dictionary {
    /**
     *  返回一个值和健相同的可变字典 (且返回的是本身)
     *  因为字典的类型不一，为了兼容性，外面定义什么类型字典，就返回什么字典本身（就是什么类型字典）
     *  必须保证外面创建的字典是可变的，以后做一个断言（抛出错误原因）
     */
//    func dictionarySelfOfVariableBinding(key: String...) -> Dictionary {
//        var tempSelf = self
//        for str in key {
//            tempSelf.updateValue(str, forKey: str)
//        }
//        
//        return dict
//    }
    
    
    /**
     *  返回一个值和健相同的可变字典
     */
    func dictOfVariableBinding(key: String...) -> Dictionary<String, String> {
        // OC中可以使用任何类型的对象作为健或值
        // Swift中字典使用时必须要规定存储的健和值的类型（也就是说健和值的类型必须提前定义清楚，可通过显示类型标注或隐式推断）
        
        var dict = Dictionary<String, String>()
        
        for str in key {
            dict.updateValue(str, forKey: str)
        }
        
        return dict
    }
    /**
     *  返回一个值和健相同的可变字典
     *  类方法（具体不解）
     */
    static func dictClassOfVariableBinding(key: String...) -> Dictionary<String, String> {//可以通过类来调用，不甚理解
        // OC中可以使用任何类型的对象作为健或值
        // Swift中字典使用时必须要规定存储的健和值的类型（也就是说健和值的类型必须提前定义清楚，可通过显示类型标注或隐式推断）
        
        var dict = Dictionary<String, String>()
        
        for str in key {
            dict.updateValue(str, forKey: str)
        }
        
        return dict
    }
}