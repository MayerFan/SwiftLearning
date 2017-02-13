//: Playground - noun: a place where people can play

import UIKit

// 注意点
/*
    1.常量的值不可改变。确切的说是：常量只能赋值一次。即便是同一个常量值也不可赋值第二次。
                                常量只赋值一次，即常量的值不会改变
 */
//1
class test: NSObject {
    var width = 8
}
let test1 = test()
let test2 = test1 //类是应用类型，test1和test2是指向同一对象
let constant = test1
//constant = test2 // 即便是同一对象也不可再次赋值。
test1.width = 88 //这句只是表明test1对象属性变化，或者以后的test1对象内存空间变化。但都没有改变test1的内存首地址。故常量constrant所存的值没有改变。


//: 类型
/*:
    OC中类型：整型、浮点型、布尔型、字符串、数组类型和字典类型
    Swift中类型:具有OC的全部类型之外，还具有 元祖(Tuple)和可选类型(Optional).
 */

//: 常量和变量
/*:
    常量和变量在使用前必须声明。
    常量用let来声明;变量用var声明。
    用let声明的常量不可改变，用var声明的变量可以改变
    也可以在一行声明多个常量或者变量
 */
let maxNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
let x = 0.0 , y = 9, z = 8
var m = 1, n = 2

//: 类型标注
/*:
    声明常量或变量的时候可以加上标注，指出此常量或者变量的具体类型。
    可以在一行中定义多个具有相同类型的变量或者常量
    格式： 常量/变量: 类型
    一般都省略类型标注。Swift会根据实际的初始值来安全推断变量或常量的类型
 */
var welcomeMessage: String
var red, green, blue: Double

//: 常量和变量的命名
/*:
    Swift允许你用任何你喜欢的字符作为常量和变量名 包括Unicode字符
    不允许使用：空白字符、数学符号、箭头、私有的(或非法的)Unicode码位、连线和制表符，也不能以数字开头，但可以在常量和变量名中的其他地方使用数字。
    注意：如果你需要使用swift保留的关键字作为你的命名，那么你可以使用反引号(')将关键字包围的方式来使用。但是这种方式是不推荐除非你别无选择。
 */
let π = 3.1415926
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

// 输出常量和变量
/*:
    使用print函数来输出常量和变量
    Swift使用字符串插值方式把常量名或者变量名当作占位符插入到字符串中。然后用常量名或者变量名所对应的值替换这些占位符。用圆括号包裹常量名或变量名，然后在圆括号前面用反斜杠隔开。
 */
print(你好)
print("nihao \(你好)")

//  注释(Comments)
/*
    和OC一样
 */

// 分号(Semicolons)
/*
    OC:每个语句结尾分号必不可少。
    Swift:可以省略分号。然而一行中出现多个语句的时候，分号还是必须的
 */

// 整数(Integers)
/*
    整数就是没有小数数字的部分。
    Swift提供了8、16、32、64位有符号和无符号整数类型。这些整数类型和C的命名方式相同：8位无符号的整数类型就是UInt8，32位有符号的整数类型就是Int32
    整数范围：可以通过整数类型的min和max属性来获取对应类型的最大值和最小值
 */
let minValue = UInt8.min
let maxValue = UInt8.max
// Int
/*
    Swift提供的一个特殊的整数类型
    不需要专门指定整数的长度，除非你的需要
    int表示的长度和当前平台的原生字长度相同。在32位平台上，Int和Int32长度相同(即Int ＝ Int32)；在64为平台上，Int和Int64位长度相同(即Int ＝ Int64)
    Swift建议你使用Int
 */
// UInt代表无符号的整数类型

// 浮点数 类同于OC和C

// 类型安全和类型推断
/*
    OC:没有类型安全，编译器不会检测类型安全，只会在运行时去检测实际类型
    Swift:类型安全的语言。在编译阶段就会检测和推断变量和常量的类型是否正确。来确保开发者是对他们所写代码类型是清楚的。
    类型推断：根据定义的初始值编译器自动推断变量或常量的类型。
 */
let meaingOfLife = 42 // Int
let pi = 3.14159 //Double 对于浮点型swift会选择Double比起float

// 数值型字面量(Numeric Literals)
/*
    十进制数：没有前缀
    二进制数：用0b前缀
    八进制数：用0o前缀
    十六进制数：用0x前缀
 */

// 数值型类型转换
/*
    OC:int型和double型相加结果取决于精度更高的一个类型
    Swift:如果两个类型不一样，不能直接相加，必须进行类型转换
 */
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let sum = twoThousand + UInt16(one)

// 类型别名(Type Aliases)
/*
    类型别名：给类型定义一个可替代或可选择的名字
    OC: 定义别名用 typeof
    Swift: 用 typealias 关键字
 */
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// 布尔值
/*
    OC: 非零即是真，0即假
    Swift: 逻辑真才是真，逻辑假是假
 */
//let i = 1
//if i {//编译器会报错：i＝1，既不是逻辑真也不是逻辑假，因此类型不安全
//    print(i)
//}
let i = 1
if i == 1 {
    print(i)
}

// 元祖(Tuples)
/*
    元祖：把多个值组合成一个复合值
    元组内的值可以是任意类型
    1.可以把元组内容分解成单独的常量和变量
    2.如果仅仅需要部分元组值，分解的时候可以把忽略的部分用(_)标示
    3.通过下标来访问元组中的单个元素
    4.可以在定义元组的时候给元素命名，然后通过名字来获取对应的的元素
    注意：元组在临时组织值的时候很有用，但是并不适合创建复杂的数据结构。如果你的数据结构并不是临时的那么推荐你使用类或者结构体而不是元组
 */
let http404Error = (404,"Not Found") //定义一个（Int, String）类型的元组
let (statusCode, statusMessage) = http404Error //常量statusCode和常量statusMessage
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error //仅仅需要第一个元组值，忽略第二个
let singleCode = http404Error.0
let singleMessage = http404Error.1

let http200Status = (statusCode: 200, description: "OK")//定义元组的时候命名
let single200Code = http200Status.statusCode

// 可选(Optionals)
/*
    可选代表着两种可能：有值或无值
    可选就是用来处理值可能缺失的情况的
    OC：不存在可选概念
    如果声明一个可选类型的变量且没有赋值，那么swift会自动赋值为nil
    可选不能直接作为条件语句的条件，因为条件必须是确定的而可选值是不确定的。
    注意：0C：nil表示一个指针，指向一个不存在的对象；
         Swift: nil不是指针，它仅仅代表一个值缺失。任何类型的可选都可以赋值为nil，不仅仅是对象。
    如果可以确定一个可选是有值的，那么可以在变量或常量后面加上感叹号(!)。
 */

// 可选绑定
/*
    可选绑定一般应用于条件语句
    可选绑定的目的：使可选类型常量或变量的不确定值，在条件中具体，if（有值）{} else（nil）{};而不是不具体的：if(有值或nil)｛｝
    //疑问？ Swift语句中要求条件语句的条件是 true和false。儿可选类型的有值并不能说明条件就是true。 那么可选类型在条件成立的原因可能是 可选类型中的有值就是true，无值(nil)是false。
 */
let possibleNumber = "123"
if let actualNumber = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNumber)")
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
}else {
    print("\(possibleNumber) has no an integer value ")
}

// 隐式解析可选
/*
    格式：就是在把可选类型的？换成！
    隐式解析可选就是确定可选一定有值，不必每次使用都析构判断，便于后续直接使用，提高性能
    1.区别 两个格式
        类型！：这种是真正的隐式解析可选。比如：String!
        变量或常量！：这不是隐式解析可选，这只是表示这个可选类型的常量或变量有值。比如：a!
    注意：如果一个变量之后可能变成nil的话不要使用隐式解析可选。如果需要在变量的生命周期中判断是否为nil的话使用普通可选类型。
 */
let possibleSring: String? = "an optional string"
print(possibleSring!)
let assumedString: String! = "an implicitly unwrapped optional string"
print(assumedString)

// 错误处理
/*
 
 */
func canThrowAnError() throws {
    //此方法封装需要调试的代码
    //如果不满足什么条件就抛出error（继承于errorProtocol协议的）
    //抛出格式 throw ...
}
do {
    try canThrowAnError() //try 表明这是个错误处理操作。如果throw错误，就被catch 条件捕捉,同时停止执行(后面的语句不再执行)
    let a = 8 //如果try 没有抛出错误，则执行此句
} catch {
    print("456")
}

// 断言(Assertions)
/*
    运行时判断
    断言条件为真，代码继续运行，否则代码停止运行，应用终止
    release模式下断言是不可用的
 */
let age = -3
//assert(age >= 0, "a person's age cannot be less than zero")













