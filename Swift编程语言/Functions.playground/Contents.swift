//: Playground - noun: a place where people can play

import UIKit

//                                  函数
/*
    1.函数就是一个自我封闭的执行详细任务的代码块。
    2. parameters(形参);arguments(实参)
    3.对比C函数
 */

// 函数定义和函数调用
/*
    1.函数的命名要体现函数的功能
    2.函数具有输入参数和返回值的函数格式； name(parameter: type) -> type {}
    3.没有输入参数的函数
    4.多参数的函数
    5.swift允许函数名相同，前提是函数的参数至少有一个不同。
    6.对于没有返回值的函数，函数本质上是返回的一个void类型的特殊值。这个值是个空元组，可以写成()
    7.具有多个返回值的函数。其实函数的返回值类型是元组类型
 */
//2
func greet(person: String) -> String {
    let greeting = "hello, " + person + "!"
    return greeting
}
greet("mayer")
//3
func sayHello() -> String {
    return "hello,world"
}
sayHello() //和C函数一样，即使没有参数，圆括号仍然不能省略
//4
func greet(person: String, toPerson: String) -> String {
    return person + " say hello for " + toPerson
}
greet("jack", toPerson: "david")
//5
//func greet(person: String) -> Int {// error： ambiguous use of 'greet'
//    return 5
//}
//greet("12")

//6
func greet1(person: String) {
    print("hello \(person)")
    return () //返回一个Void类型的空元组
}
//7
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {//[1..<array.cout]表示array从下标1开始，不再从默认的0开始
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}
let result = minMax([1,-1,5,7,9])
result.min
result.max
result.0

// 可选元组类型
/*
    1.注意区分元组中成员的可选类型。
    2.可选元组类型，也有可选绑定
 */
func minMax2(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {//[1..<array.cout]表示array从下标1开始，不再从默认的0开始
        if value < currentMin {
            currentMin = value
        }else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}
//2
if let bounds = minMax2([8,-6,2]) {
    print("min is \(bounds.min)")
}


// 函数的实参标签和形参名
/*
    1.函数中的输入参数叫形参.形参供函数体使用。
    2.函数调用中出现的参数提示叫实参标签。实参标签供函数调用使用。
    3.实参标签的本质：swift在定义函数时，给每个参数(形参)都定义了一个对应的实参标签。只不过默认情况下，实参标签和形参名是相同的且省略。
    4.开发者手动定义实参标签的时候，优先级将取代swift默认的实参标签。
    5.swift是很人性的，如果开发者不喜欢或者不习惯实参标签，可以用下划线 “_” 表示实参标签，那么在函数调用的时候，实参标签就不会在出现。但是建议使用实参标签，这可以是开发者更清楚函数的功能
 */
//1
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    print(firstParameterName, secondParameterName)
}
//2
someFunction(1, secondParameterName: 2) //:冒号左侧的就是实参标签 在swift3.0中，每个参数的实参标签都不省略
//3  第一个firstParameterName就是swift默认情况下定义的实参标签
func someFunction(firstParameterName firstParameterName: Int) {
}
//4
func greet(people person: String, from homeTown: String) -> String {
    return "hello \(person)，glad you could visit from \(homeTown)"
}
greet(people: "mayer", from: "china")
//5
func hello(person: String, _ content: String) {
    print("\(person) say \(content)")
}
hello("jack", "i love you")


// 给形参定义默认值
/*
    1.swift支持给形参指定默认值，功能强大啊。如果被定义默认值的形参在函数调用时没有他对应的实参传入，那么在函数体内，这个形参的值就是默认指定的值。除非被实参修改。
 */
//1
func eat(person: String, food: Int = 2) {
    // person正常吃两碗米饭
    // 如果有实参传入，则person就吃 foof 碗米饭
    print("\(person)吃了\(food)碗米饭")
}
eat("jack")
eat("tom", food: 5)
eat("mayer")

// 可变形参
/*
    1.形参数量是不定的。可以有0个或者更多。
    2.在函数体中，可变形参被看作是一个常量数组
 */
//1\2
func arithmeticMean(numbers: Double...) -> Double {
    var total = 0.0
    for num in numbers { //numbers看作是一个常量数组
        total += num
    }
    
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4,5)


// 输入输出形参
/* // 目前先了解输入输出的定义和使用，对于底层实现暂不考虑
    1.swift中所有的形参都是默认的常量，在函数体中是只读的。如果要实现可写，则用到了in-out形参。
    2.输入输出形参用关键字inout声明
    3.单独讨论形参没有意思，在函数体中改变形参其实就是改变传入的实参（即可以在函数体内部修改函数外部的变量）
        苹果文档：An in-out parameter has a value that is passed in to the function, is modified by the function, and is passed back out of the function to replace the original value
        一个输入输出形参有一个传入到函数中的值(实参),输入输出形参被函数修改后，传出函数体然后替换最初的值(实参)
    4.只能传递一个变量作为输入输出形参的实参。
 注意：输入输出形参不能定义默认值，且可变形参不能标记为输入输出形参。
 */
//4
var someInt = 3
var anotherInt = 107
func swapTwoInts(inout a: Int, inout b: Int) {
    let tempA = a
    print("now someInt is \(someInt), anotherInt is \(anotherInt)")
    b = a
    print("now someInt is \(someInt), anotherInt is \(anotherInt)")
    a = tempA
}

swap(&someInt, &anotherInt)
print("now someInt is \(someInt), anotherInt is \(anotherInt)")


// 函数类型
/*
    1.每一个函数都有一个函数类型，函数的类型由函数的形参类型和返回值类型组成
 */
//1 函数类型为 （Int, Int）-> Int
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

// 函数类型的使用
/*
    1.可以想使用swift中的其他类型一样使用函数类型 
    2.可以给常量或者变量定义一个函数类型然后给其分配一个对应类型的函数
    3.函数类型作为函数的形参
    4.函数类型作为函数返回值
 */
//1\2
let mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,5)
//3
func resultMath(mathFunc: (Int, Int) -> Int, a: Int, b: Int) -> Int {
    return mathFunc(a, b)
}
resultMath(addTwoInts, a: 3, b: 8)
//4
func stepForward(a: Int) -> Int {
    return a + 1
}
func backForward(a: Int) -> Int {
    return a - 1
}

func chooseForward(backward: Bool) -> ((Int) -> Int) {
    return backward ? stepForward : backForward
}
let chooseResult = chooseForward(true)
chooseResult(5)

// 嵌套函数
/*
    1. C和OC中，可以嵌套函数的调用，但是不可以嵌套函数的定义
       Swift中，既可以嵌套函数的调用，也可以嵌套函数的定义。
 */
func chooseForward2(backward: Bool) -> ((Int) -> Int) {
    func stepForward(a: Int) -> Int {
        return a + 1
    }
    func backForward(a: Int) -> Int {
        return a - 1
    }
    return backward ? stepForward : backForward
}
let choose = chooseForward2(false)
choose(9)








