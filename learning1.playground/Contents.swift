//: Playground - noun: a place where people can play

//对比学习法
import UIKit

//学习1 -- 纵览

/**创建对象/调用方法
 *OC中创建对象是：[[uiview alloc] init]
 *Swift中创建对象：uiview()
 
 *OC中调用方法：[uicolor redcolor]
 *Swift中调用方法：uicolor.redcolor()
 
 *OC中使用枚举：UIButtonTypeContactAdd
 *Swift中使用枚举：仍然是点语法UIButtonType.ContactAdd,但是枚举类型可省略
 
 *OC中创建结构体CGPointMake()
 *Swift中创建结构体依然是：CGPoint()
 */
//总结：1.Swift中的所有的方法调用都是运用点语法的形式。
//     2.Swift不管是创建对象，创建结构体还是创建其他，固定形式就是："类型()"
//     3.Swift中可以使用OC的方法
let view = UIView(frame: CGRectMake(0, 0, 300, 200))
view.backgroundColor = UIColor.redColor()
view.frame = CGRectMake(0, 0, 100, 50)//使用了OC的方法

let btn = UIButton(type: UIButtonType.ContactAdd)
btn.center = CGPoint(x:view.frame.size.width/2, y:view.frame.size.height/2)
view.addSubview(btn)

//学习1 -- 常量和变量

/**
 *swift常量和变量是let/var
 */


//学习1 -- 数据类型转换

/**
 *Swift中不存在隐式类型转换，所有的类型转换必须是显示的
 *解决方法可以是强制类型转换
 
 *类型声明
 *Swift: 类型声明在变量后面声明 ”a：类型“
 *OC: 类型声明在变量前面 int a 且没有冒号
 */
let num1 = 10 //int
let num2 = 9.9//double
//let sum = num1 + num2 //不允许
let sum = num1 + Int(num2);

let num: Int = 10


//学习1 -- if条件


/**
 *swift中条件括号可以省略
 *OC中不可以省略
 *C和OC中强调非0即真
 *Swift中条件必须是 true/false 不认可非0即真说法；和JS条件类似
 
 *switch
 *Swift: break可以省略。前提是case/default后面必须有执行句子；
 *OC中不能省略，否则会穿透逻辑
 
 */
let ifnum = 10
if ifnum == 10 {
    print("ok")
}

switch ifnum {
    case 1: print("1")
//    break
    case 10:
        print("10")
//    break
    default:print("10")
//    break
}


/**
 *Swift: 不再支持for循环，提示用for in循环替代
 *OC：都支持
 
 *"_"作用
 *代表忽略,如果不关心这个参数，可以使用下划线.
 
 *do while 在swift中 do替换成repeat do在swift语法中被用于获取异常。
 
 *利用三目运算符来简化 if else 的条件操作
 */
//总结： ..< 代表区间  a<= i <b; ... 代表区间 a<= i <= b;
//for (var i = 0; i < 10; i++){
//    print(i)
//}
for i in 0 ..< 10
{
//    print(i)
}

for i in 0 ... 10 {
    print(i)
}

for _ in 0 ..< 10 {
    print("fmy")
}

//repeat{
//    print("1")
//}while true

let sanmu = (ifnum == 5) ? 5 : 10


//学习1 -- 可选类型

/**可选类型：代表可以有也可以没有
 * 可选类型是 类型后面加？ ”类型？“
 * 可选类型 print打印的时候会被 optinal包裹。如果不想被optinal包裹，需要在打印的时候加上惊叹号！。
 * "!"代表告知编译器可选类型中一定有值，强制解析；如果可选类型中没有值，但是强制解析，那么会出现carsh风险
 */
let url = NSURL(string: "http://www.baidu.com")
print(url)
let url2 = NSURL(string: "http://www.baidu.com/tupian")
print(url2)
print(url2!)

let request = NSURLRequest(URL: url!)
//可选绑定
//可选绑定满足条件 1.处于条件语句中 2. 把可选类型赋值给一个常量变量作为条件
//可选绑定 会把url的值赋值给urlfinal，要执行条件语句就说明urlfinal一定是有值的。
if let urlFinal = url{
    let request = NSURLRequest(URL: urlFinal)
}


//学习1 -- 数组/字典

/**
 *
 */
let array = ["hello world",2,9.9]
/**
 * OC中 @{@"key":"value"}
 * Swift: 和创建数组一样 []
 
 * swift中怎么无法使用objectforkey方法取值？？？？？？？
 */
var dict = ["name": "lnj","age": 30]
let value = dict["name"]
//print(value)

dict["sex"] = "man"
dict

for key in dict.keys {
    print(dict[key])
}
//利用元组来遍历字典，会自动将字典中key赋值给元组的第一个变量，将字典中的value赋值给第二个变量
for (kk, vv) in dict
{
    print(kk)
    print(vv)
}

let str = "hello"
var str2 = " world"
str2 = str + str2
//str2
var str3 = String(format: "%02d:%02d:%02d",arguments:[9,8,13])
//Swift类型和OC类型相互转换(两种方法)
var str4: NSString = "xmg nb"
var str6 = "xmg new nb" as NSString


var str5 = str4 .substringToIndex(3)


//学习1 -- 函数

/**
 *Swift函数格式：func 函数名(参数列表) -> 返回值{}
 *
 */
//函数没有返回值可以用void/或者没有返回值可以省略 ->
func say() {
    print("hello")
}

func read() -> Int{
    return 998
}
//x、y 称为外部标签 a、b称为内部标签
func run(x a: Int, y b: Int) -> Int {
    return a + b
}

say()
let readValue: Int = read()
let runValue = run(x: 3, y: 2)



//学习1 -- 闭包

//旧闭包的基本格式
/*
 {
    () -> () in
 
 }
*/

func loadData(finished: ()->()) {
    print("执行耗时操作")
    finished()
}

func load(hello: ()-> Int) {
    print("hello 执行")
    
    let count = hello()
    print(count)
}

func loading(precent: (rate: Int) -> Int) {
    print("执行loading")
    
    let newValue = precent(rate: 6)
    print(newValue)
    
}



//三种调用格式
loadData { 
    print("被回调")
}

loadData ({
    print("被回调le")
})

loadData(){
    print("被回调吗？")
}

load { () -> (Int) in
    
    print("执行闭包参数")
    
    return 99
}

loading { (rate) -> Int in
    return rate*rate
}

//有参数和返回值的闭包


//var bibao = { new -> Int in
//    print("hello")
//}









