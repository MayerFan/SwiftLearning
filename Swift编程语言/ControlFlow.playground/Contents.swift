//: Playground - noun: a place where people can play

import UIKit

//                                 控制流
/*
 注意：if语句的可选绑定和switch语句的值绑定，确切的说是判定一个绑定的值是否存在，而不是符合什么条件。
 
    1. 循环语句
        1.1 for in
        1.2 while
        1.3 repeat while
    2. 条件语句
        2.1 if
        2.2 switch
    3. 控制转移语句
        3.1 continue
        3.2 break
        3.3 return
        3.4 fallthrough
        3.5 throw
 */

// for in 循环

for index in 1...5 {
    print(index)
}

// 在一个不需要value的时候，可以用_省略
for _ in 1...5 {
    print("hi")
}

// while循环
/*
    1. while循环经常用于，从第一次循环开始，而不知道循环次数的时候。
    2. 包括 while\repeat-while(do-while)
 */


// 条件语句
/*
    1.Swift中switch语句省略break，不会出现向下执行。
 */
let switchStr = "he"
switch switchStr {
    case "he":
    print(switchStr)
    case "hi":
    print(switchStr)
    case "ha",
         "ho":
    print("ha-ho")
default: //如果case\default下面没有任何代码，需要加上break
    break
}

// 元组
/*
    1.在同一个switch语句中，可以借助元组测试多个值。使用“_”来匹配所有可能的值
    2.OC/C中Switch的case的值必须是唯一的，不能重复出现。
      Swift中case可以匹配多个值，也可以匹配同一个值。对于同一个值，条件顺序按照顺序优先性。
    3.switch值绑定 区分if条件的可选绑定
    4.switch case条件中加入where条件，参考sql语句where
 */
let somePoint = (0,1)
switch somePoint {
    case (0, 0):
    print("(0, 0) is at the origin")
    case (0, 0):
    print("Swift中case允许出现同一个值")
    case (_, 0):
    print("\(somePoint.0, 0) 处于x轴")
    case (0, _):
    print("\(0, somePoint.0) 处于Y轴")
    case (-2...2, -2...2):
    print("\(somePoint.0, somePoint.1) is inside the box")
    default:
    print("\(somePoint.0,somePoint.1) is outside the box")
}
//3 此switch语句没有default语句，因为 （let x， let y）包含剩下的所有的可能，所以default可以省略
let anotherPoint = (2,0)
switch anotherPoint {
    case (let x, 0):
    print("X轴的值是\(x)")
    case (0, let y):
    print("X轴的值是\(y)")
    case (let x, let y)://此case也包括 （let x, 0）条件
    print("X轴的值是\(x), Y轴是\(y)")
}
//4
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
    case (let x, let y) where x == y:
    print("x==y")
    case let (x, y) where x == -y:
    print("x==-y")
    case let(x, y):
    print("任一点")
    
}


// 控制转移语句
/*
    1.改变代码的执行顺序
    2.fallthrough.Swift中的switch语句默认case和case之间不会贯穿的，尽管没有添加break。但是当开发者主动想贯穿的时候，可以用fallthrough关键字
 */
let integerToDescibe = 5
var decription = "The number \(integerToDescibe) is"
switch integerToDescibe {
    case 2,3,5,7,9:
    decription += " a prime number, and also"
    fallthrough //贯穿到下一个
    default:
    decription += " an integer."
}
print(decription)


// 给循环语句或者条件语句添加标签
/*
    1.添加标签指明，此标签代表的是哪一个循环，尤其在嵌套循环中非常有用。
 */
var num = 5
whileloop: while num <= 10 {
    switch num {
    case 5...10:
        print("\(num)大于等于5")
        break whileloop //不加whileloop，跳出的是switch语句，不会跳出while循环。
    case 0...4:
        num += Int(arc4random()) % 10 //[0...10]的随机整数
        print("\(num)")
        continue whileloop
    default:
            break;
    }
}

// guard语句
/*
    1.guard语句始终存在else分句，且else分句只在条件为false的时候执行。
    2.guard语句如果条件是可选绑定，那么如果绑定值不存在else分句执行。
    3. guard是swift3.0更新
 */
//let newNum = 5
//guard newNum == 5 else {
//    print("\(newNum)不等于5")
//}

//func greet(person: [String: String]) {
//    guard let name = person["name"] else {
//        print("hello\(name)")
//    }
//}

// 检查API可用性
/*
    1.swift3.0 更新
    2.Swift可以在编译期检测代码中的API是否可用。
    3.在if或guard语句中可以使用“可用性条件”判断来执行对应的代码块。“可用性条件”是在runtime期判断。
 */
//3
//if #available(iOS 9, OSX10, *) {// *指之后的通配
//    print("执行iOS平台 9以后，os平台 10以后 的条件语句")
//} else {
//    print("执行iOS平台 9以前，os平台10之前的条件语句")
//}








