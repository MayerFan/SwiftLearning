//: Playground - noun: a place where people can play

import UIKit


//                                           类和结构体
/*
    1.类和结构体共同点
        1.1定义属性存储值
        1.2定义方法增加功能
        1.3定义下标来访问值
        1.4定义构造器设置初始化状态
        1.5利用扩展给默认实现扩展功能
        1.6遵守协议增加某种功能
    2.类所具有的额外特性
        2.1一个类继承其他类的特性
        2.2类型描述可以在运行时检测和解释类的实例的具体类型
        2.3取消构造器来释放类的实例的所有已经被分配的资源
        2.4引用计数允许对一个类多次引用
    3.结构体在使用的时候总是copy
    4.结构体和类的命名规则和枚举类似。都是首字母大写方式（大写驼峰法）
    5.swift中所有的类型命名方法都是大写驼峰法。属性和方法命名采用小写驼峰法。
 */
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode: NSObject {
    var resolution = Resolution()
    var name: String?
    var interlaced = false
}

// 类和结构体实例
/*
    1.上面的Resolution定义和VidoMode定义仅仅描述了什么是Resolution和VidoMode（即具有什么特性）。若想取得具体的Resolution和VieoMode（即具体的对象），就需要实例化。
    2.简单的初始化一个新的实例的方法 类型名 ()
 */
//2
let someResolution = Resolution()
let someVidoMode = VideoMode()

// 属性访问
/*
    1.采用点语法
    2.透穿访问。Swift中：可以使用点语法直接访问属性的属性。
              OC中：不可以透穿访问。只能先取出属性的对象，再单独访问属性对象的属性。
    3.给变量属性重新赋值
 */
//1
let resolutionResult = someResolution.width
//2
let vidoModeResult = someVidoMode.resolution.width
//3
someVidoMode.resolution.height = 9
print(someVidoMode.resolution)

// 结构体类型成员逐一初始化
/*
    1.结构体类型中有一个默认的成员逐一构造器
    2.类中没有默认的成员逐一构造器
 */
//1
let otherResolution = Resolution(width: 8, height: 9)


// 值类型和引用类型
/*
    1.值类型：值类型被赋值给常量或者变量、及传递给函数时，值类型的值会被copy一份(即底层中的内存空间被重新拷贝一份)。
    2.引用类型：引用类型被赋值给常量或者变量、及传递给函数时，引用类型的值不会copy，还是对象本身。
    3.swift中的结构体和枚举是值类型。swift中所有的基本类型--整型、浮点型、bool型、字符串、数组、字典--都是值类型。且这些基本类型的底层实现都是以结构体的形式。
    4.swift中类是引用类型
    5？？ ：引用类型和浅拷贝的关系？？
 */
//3
var hd = otherResolution
hd.height = 1920
hd.width = 1028
print(otherResolution, hd)//两者是不同的对象
//枚举同样如此
enum PointDirection {
    case east, north, west, sourth
}
var currentDirection = PointDirection.west
let remeberedDirection = currentDirection
currentDirection  = .east
if remeberedDirection == .west {
    print("remeberedDirection变量仍然是 west")
}
//4
var newMode = VideoMode()
newMode.interlaced = true
newMode.name = "hello"
let otherMode = newMode
otherMode.name = "hi"
print(newMode.name)

// 恒等操作符
/*
    1.swift中恒等操作符：用来判断两个对象是否是同一个对象(即首地址相同)。
    2.“===”：表示是同一个对象 "!=="：表示两个对象是不同的对象
    3."==":等于表示两个对象的值相等或相同。
 */
if newMode === otherMode {
    print("newMode和otherMode指向同一个对象")
}

// 字符串、数组、字典的赋值和拷贝操作
/*
    1.swift中，字符串、数组、字典等基本数据类型的底层实现是基于结构体的。因此他们的赋值和函数传递都是值拷贝。
    2.OC中，NSSting\NSArray\NSDictionry都是基于类实现的。因此OC中的赋值和传递都是引用。
 */










