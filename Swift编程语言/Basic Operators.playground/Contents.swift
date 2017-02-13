//: Playground - noun: a place where people can play

import UIKit

// 术语
/*
    运算符包括一目、二目、三目运算符
    一目只有一个目标： !a
    二目有两个目标：a + b
    三目有三个目标 (和C一样，Swift也只有一个三目运算符)： a ? b : c
 
    操作数：受运算符影响的值为操作数。比如 a + b a和b就是操作数
 */

// 赋值
/*
    如果赋值语句右边是一个包含多个值的元组(Tuple)，这个元组可以分解成多个对应的变量或常量
 */
let (x, y) = (1, "123")
print(x,y)

// 数值运算符
/*
    + - * /
    2. 与C和OC不同的是，swift默认不允许在数值运算符中出现益处情况，如果你有目的实现益处，可以使用 a &+ b
    3. 加法操作 OC中不可以实现字符串的拼接；SWIFT中可以实现字符串的拼接
 */
let newStr = "hello, " + "world"
let dog = "🐶"
let cow = "🐮"
let dogCow = dog + cow
let newDogCow = dog + cow + "hello"

// 比较运算符
/*
    1.比较运算符的结果都是true或false
    2.Swift中还可以比较元组。但是如果元组中有bool值不可以比较
    3.字符串的比较比较的是ascii码
 */

let result = (1, "apple") < (1, "bird")

// 空合运算符(Nil-Coalescing Operator) 
/*
    1.其实可以称作可选运算符。因为这个运算符只能用于可选类型
    2.前面必须为可选类型
    3.格式： a ?? b
    4.解析格式意义： a ?? b == a? ? b == a != nil ? a! : b //口语解释：首先指定a为可选类型，a不为nil的时候，a取值为 a!，否则a取值为b。
    5.b的类型必须和 a！的类型一致
 */
let defaultColorName = "red"
var userDefineColorName: String? //可选类型没有初始化默认为nil
//let name //变量和常量必须初始化
var colorName = userDefineColorName ?? defaultColorName

userDefineColorName = "blue"
colorName = userDefineColorName ?? defaultColorName

// 区间运算符
/*
    1.表示一个值的区间
    2.全闭区间运算符(a...b)：取值范围从a到b，且包括a和b。  
    3.半开区间运算符(a..<b):取值范围是从a到b，但是只包含a。
 */
for index in 1...5 { //index默认是let 声明的常量
    print(index)
}











