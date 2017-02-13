//: Playground - noun: a place where people can play

import UIKit

//                                        属性
/*
    1.属性有存储属性和计算属性
    2.存储属性：存储值
    3.计算属性：计算值
    4.存储属性可以定义KVO监视所存储属性值的变化
 */

// 存储属性
/*
    1.可以再定义时候设置默认的存储值
    2.可以再初始化的时候设置(没有默认值的时候)和修改(有默认值的时候)存储属性的初始值
    3.即便存储属性是let声明的常量存储属性也遵守1、2规则。
    4.变量实例中的常量属性和变量属性维持本身属性的常量和变量特性
    5.常量实例中的常量属性和变量属性都变为常量属性特性。对于值类型如此。
 */
struct FixedLengthRange { //定义时候没有设置默认初始值
    var firstValue: Int
    let length: Int
}
//2\3
var range = FixedLengthRange(firstValue: 1, length: 2)
let thanRange = FixedLengthRange(firstValue: 1, length: 2)
//4
range.firstValue = 6
//range.length = 7 不可改变
//5
//thanRange.firstValue = 6
//thanRange.length = 7 // 都变为常量属性

//比较引用类型中的属性特性
/*
    1.引用类型中定义存储值必须定义默认值
    2.变量实例中的常量属性和变量属性维持本身属性的常量和变量特性
    3.常量实例中的常量属性和变量属性也维持本身属性的常量和变量特性
 */
class TestClass: NSObject {
    var testValue: Int = 0
    let testLength: Int = 0
}
var test = TestClass()
let thanTest = TestClass()
//2
test.testValue = 6
//test.testLength = 7
//3
thanTest.testValue = 6
//thanTest.testLength = 7

// 总结：
/*
    1. When an instance of a value type is marked as a constant, so are all of its properties.
    2. If you assign an instance of a reference type to a constant, you can still change that instance’s variable properties.
 */

// 懒加载存储属性
/*
    1.懒加载存储属性：当这个存储属性第一次被用到的时候，这个属性的存储值才被计算。
    2.只有变量属性才可以成为懒加载存储属性。
 注意：对于懒加载存储属性，如果多个线程同时访问，懒加载属性可能被初始化多次。
 */
class dataImpoter {
    var fileName: NSString = "data.txt"
}
class dataManager {
    lazy var importer = dataImpoter()
    var data = [String]()
}
let manager = dataManager() //importer为nil,没有被初始化
manager.data.append("Some data")
print(manager.importer.fileName) //懒加载属性只有再用到的时候才会加载

// 存储属性和实例变量 ？？？？？？

// 计算属性
/*
    1.计算属性不能存储值，而是提供setter和getter方法来直接设置其他值和属性。
 考虑：没有显式出现get和set方法的属性都是默认的存储属性且都具有默认的get和set方法。显式出现的get或set方法的为计算属性，且使系统默认的set和get方法失效。
 */
struct Point {
//    var x: Int, y: Int //显示类型注解
    var x = 0.0, y = 0.0 //隐式类型
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}
//var square = Rect(origin: Point(x: 0.0, y: 0.0),
//                  size: Size(width: 10.0, height: 0.0),
//                  center: Point(x: 10, y: 0)) // 计算属性不可以用成员变量初始化构造器
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 0.0))
let squareCenter = square.center //值类型 拷贝了一份新的内存
square.center = Point(x: 10, y: 10)
print(square.center,squareCenter)

// 计算属性的简洁语法
/*
    1.set方法中的 set(new...)可以省略，且(new...)默认存在
 */

// 只读计算属性
/*
    1.只有var关键字才能定义计算属性。
    2.只有getter没有setter方法的计算属性才是只读计算属性。
    3.只读计算属性可以省略get关键字
    4.不存在只写属性：有setter方法必须同时存在getter方法
 */
struct Cuboid {
    var width = 0.0, height = 0.0
    var volume: Double {
        return width * height
    }
}
let cuboid = Cuboid(width: 10, height: 10)
cuboid.width
cuboid.volume
//cuboid.volume = 200 //重写属性的get方法，那么默认的set方法也会覆盖

// 属性监视器(kvo)
/*
    1.属性监视器监视和响应属性值的变化。
    2.属性值每次被设置，属性监视器都会被调用，即便设置的新值和当前值一样。（可以理解为：属性的每次set方法调用都会激活属性监视器）
    3.除了懒加载属性之外，可以给所有存储属性添加属性监视器
    4.可以通过重载属性的方式给继承属性(存储属性或计算属性)添加属性监视器
    5.不需要为无法重载的计算属性添加属性监视器，因为可以直接重写setter方法而再setter方法中监视和响应值的改变。
    6.你可以通过“willset”和“didset”方法来监视属性变化
 */
class StepCounter {
    var time: Double { //计算属性
        get {
            return 100.0
        }
        set {
            print(newValue)
        }
    }
    var totalSteps: Int = 0 { //存储属性 此处的willset和didset只是监视存储属性默认的set方法。
        willSet(netTotalSteps) {
            print(netTotalSteps,totalSteps)
        }
        
        didSet {
            print("didSet\(totalSteps) \(oldValue)")//每次新值来的时候，旧值不会清空，仍然保存上次的值。
        }
    }
}
let stepCounter = StepCounter()
stepCounter.time
stepCounter.time = 200
stepCounter.time
stepCounter.totalSteps
stepCounter.totalSteps = 300
stepCounter.totalSteps = 500

// 类型属性
/*
    1.OC中 类中只有类方法，而类不拥有属性
      Swift中，类不仅可以有类方法，而且类还可以拥有属性
    2.类型属性也有存储类型属性和计算类型属性
    3.存储类型属性可以是变量var和常量let；计算类型属性总是是变量var
    4.存储类型属性和存储实例属性的不同：在于存储实例属性不必设置一个默认值，可以再初始化的时候设置；而存储类型属性再定义的时候必须设置存储类型属性的默认值，因为存储类型属性没有初始化构造器。
    5.存储类型属性是属于延迟加载的，但是存储类型属性不需要添加lazy关键字。
    6.存储类型属性再多线程中同时访问的时候，保证只加载一次。
 */
struct SomeStucture {
    static var storedTypePorpety = "someValue"
    static var computedTypePorpety: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypePorpety = "someValue"
    static var computedTypePorpety: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypePorpety = "someValue"
    static var computedTypePorpety: Int {
        return 27
    }
    class var overriderableComputedTypePorpety: Int {// 可以用class关键字替换static关键字来允许你子类重写父类的实现
        return 107
    }
}

// 获取和设置类型属性
/*
    1.
 */
print(SomeStucture.storedTypePorpety)
SomeStucture.storedTypePorpety = "anotherValue"
print(SomeStucture.storedTypePorpety)
print(SomeEnumeration.computedTypePorpety)
print(SomeClass.computedTypePorpety)






