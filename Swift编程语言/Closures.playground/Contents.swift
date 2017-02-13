//: Playground - noun: a place where people can play

import UIKit

/********************                 闭包                  *********************/
/*
    1.闭包本质上就是函数的简写。 //个人观点，尚待验证
    2.Global functions are closures that have a name and do not capture any values
      全局函数是一个有函数名而不能捕获任何值的闭包。
    3.Nested functions are closures that have a name and can capture values from their enclosing function
      嵌套函数是一个有函数名且只能从函数域内捕获值的闭包。
    4.Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context
      闭包表达式是一个用轻量级语法所写的可以从上下文环境中捕获值的闭包。
注意：（个人观点）这个值(values)指的是常量或者是变量。类似于block保存的外部变量。
 */


// 闭包表达式语法
/*
    1.闭包具参数和返回值具有函数的参数和返回值的特性(可变参数、输入输出参数、元组)，但是闭包不可以定义默认值。
    2.如果函数仅有一个闭包参数，那么写成trailing闭包的时候，()可以忽略。
 */
let names = ["D","B","A","C"]
//let names = [1,1,3] //sort的参数类型会根据数组去推断
func backward(str1: String, str2: String) -> Bool { //函数
    return str1 > str2
}
let newNames = names.sort(backward)
// 定义一个闭包 本质就是函数的简写
let closure = {(str1: String, str2: String) -> Bool in
    print(str1, str2)  // 参考苹果的比较算法。
    return str1 > str2
}
let newNames2 = names.sort(closure)

// Trailing 闭包
/*
    1.trailing闭包和闭包的区别就是trailing闭包的位置
    2.trailing闭包对于代码更长的闭包而言结构更清晰
 */
names.sort({s1, s2 in s1 > s2}) //闭包的一种简写方法
names.sort(){s1, s2 in s1 > s2} //trailing闭包
//1
names.sort {s1, s2 in s1 > s2}
//2
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510];
let strings = numbers.map() { //map方法中的闭包仅仅是表明把数组中的item映射成某个类型的具体实现。最后由map方法把映射好的类型放到一个新数组中返回。
    (number) -> String in
    var numberVar = number
    var output = ""
    while numberVar > 0 {
        output = digitNames[numberVar % 10]! + output
        numberVar /= 10
    }
    
    return output
}
print(strings)


// 捕获值
/*
    1.
 */
func makeIncrementer(count: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {// 函数嵌套定义 函数和方法一样，只要调用才会执行。
        runningTotal += count
        return runningTotal
    }
    
    return incrementer
}
let incrementer = makeIncrementer(10)
incrementer() //只有函数调用，函数才会执行
incrementer()
incrementer() //可以看出嵌套函数每次定义的时候嵌套函数自身函数体内会引用外部变量和复制外部常量。
let anotherIncrementer = makeIncrementer(7)
anotherIncrementer()//新的函数会对变量有一个新的独立的引用


// 闭包/函数 是引用类型
/*
    1.你把同一个函数/闭包赋值给两个不同的变量或常量，这两个变量或者常量指向同一个闭包/函数
 */
let newIncrementer = incrementer;
newIncrementer()

// 逃逸闭包和非逃逸闭包
/*
    1.逃逸闭包是 闭包作为参数传入时，会在函数返回之后才执行的闭包。
    2.非逃逸闭包 只能在函数体中才能执行，不能脱离函数体执行的闭包。
 */


// 自动闭包
/*
    1.自动闭包是自动创建的不接受任何参数，只包装一些表达式的闭包。
    2.自动闭包可以延迟评估。即闭包调用的时候，才执行内在包装的表达式。
    3.自动闭包的格式更加简化
 */
var customersInline = ["A","B","C"]
print(customersInline.count)
let autoClosure = {customersInline.removeAtIndex(0)} //定义一个自动闭包
print(customersInline.count) //闭包常量没有执行
autoClosure()
print(customersInline.count)

let bi = {//闭包函数也能实现自动闭包逻辑
    () -> String in
    customersInline.removeAtIndex(0)
}
func server(count: () ->String){
    count()
    print(customersInline.count)
}
server(bi)
//闭包函数加上关键字@autoclosure就变成了自动闭包。自动闭包默认是@noscape属性的闭包。







