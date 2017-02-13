//: Playground - noun: a place where people can play

import UIKit


//                                           枚举


// 枚举语法
/*
    1.OC\C中 枚举体中是枚举值，且都是整数类型
      Swift中，枚举体中是枚举值都是以关键字case声明。且枚举值类型不是唯一的。
    2.多个成员的枚举值可以出现在一行，用逗号隔开
    3.可以通过点语法获取枚举的枚举值
 */
//1 
enum CompassPoint {
    case north
    case south
    case east
    case west
}
//2
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//3
var directionToHead = CompassPoint.east
directionToHead = .north //或者简写

// switch语句匹配枚举值
/*
    1.
 */
switch directionToHead {
    case .north:
        print("This is th north direction")
    case .south:
        print("This is th south direction")
    case .east:
        print("This is th east direction")
    case .west:
        print("This is th west direction")
}

// 关联值
/*
    1.可以定义swift枚举中存储任何的关联值。关联值可以随着成员值存储额外的自定义信息。
    2.如果一个枚举值的所有关联值都被提取为常量或者变量，为了简洁，可以提前 var或者let关键字
 */
enum Barcode {
    case UPCA(Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(5, 6, 7)
productBarcode = Barcode.QRCode("123456789")
switch productBarcode {
    case .UPCA(let numSystem, let identifier, let check):
        print("UPCA with value of \(numSystem), \(identifier), \(check)")
    case .QRCode(let procuctCode):
        print(procuctCode)
}
//2
switch productBarcode {
case let .UPCA(numSystem, identifier, check):
    print("UPCA with value of \(numSystem), \(identifier), \(check)")
case let .QRCode(procuctCode):
    print(procuctCode)
}

// 原始值(Raw Values)
/*
    1.在定义枚举的时候，枚举成员已经初始化。
    2.如果原始值是整数的时候，枚举值如果没有设置初始值，那么枚举值就是递增的。类似C或OC的枚举
 */
enum AsciiCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
}

// 忽略定义原始值
/*
    1.对于整数类型或者是字符串类型的枚举，如果没有设置原始值，整数类型的枚举成员是递增的。字符串类型的枚举成员是成员字符串本身。
    2.可以通过rawValue属性来查看枚举成员的原始值。
 */
//1
enum Planet2: Int {
    case mercury = 1, venus, earth, mars
}
enum CompassPoint2: String {
    case north, south, east, west
}
//2
let earth = Planet2.earth.rawValue
let sunDirection = CompassPoint2.west.rawValue

// 根据原始值实例化枚举
let possiblePlanet = Planet2(rawValue: 3)


// 递归枚举
/*
    1.需要添加关键字 indirect
 */
enum Expression {
    case number(Int)
    indirect case addition(Expression, Expression)
    indirect case multiplication(Expression, Expression)
}
//也可以把关键字indirect提到枚举enum前面
indirect enum Expression2 {
    case number(Int)
    case addition(Expression, Expression)
    case multiplication(Expression, Expression)
}
let five = Expression.number(5)
let four = Expression.number(4)
let sum = Expression.addition(five, four)
let product = Expression.multiplication(sum, Expression.number(2))

func evaluation(expression: Expression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluation(left) + evaluation(right)
    case let .multiplication(left, right):
        return evaluation(left) * evaluation(right)
    }
}

print(evaluation(product))










