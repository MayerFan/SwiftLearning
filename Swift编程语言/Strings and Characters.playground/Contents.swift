//: Playground - noun: a place where people can play

import UIKit

// 初始化空字符串
/*
 
 */
var emptySting = "" //把一个空字符串字面量赋值给变量emptySting
var anotherEmptyString = String() //构造方法构造一个空字符串对象赋值给变量anotherEmptyString
if emptySting.isEmpty { //字符串的是否为空字符串属性
    print("emptyString is a empty string")
}

// 字符串是值类型(重要 和OC中差异较大)
/*
    1.Swift中：字符串的值在 常量、变量赋值操作、函数或方法中传递的时候，字符串的值都是新的拷贝。不是旧值的引用。
    2.OC中：字符值的赋值，传递的时都是指针引用。
    3.Swift字符串默认copy的方式确保函数或方法传递给你的字符串的值明确是你应该拥有的，无论这个字符串的值来自于哪里。
    4.对于你要传递的字符串，你是非常自信的知道除了你自己这个字符串无法被修改。
    5.在实际编译时，Swift编译器会优化字符串的使用，使实际的复制只发生在绝对必要的情况下，这意味着您始终可以将字符串作为值类型的同时获得极高的性能。
 */

// 使用字符
/*
    1.可以使用单个字符的字符串字面量来创建一个字符常量或变量
    2.也可以用字符数组创建一个字符数组类型的常量或变量
 */
let singleCharacter: Character = "!"
let catCharacters: [Character] = ["C","a","t","!"]
let catString = String(catCharacters)
let str = "world"

// 连接字符串
/*
 
 */
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instrucution = "look over"
instrucution += string2

let mark: Character = "!"
welcome.append(mark)

welcome.stringByAppendingString(instrucution)

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// 字符串字面量中的特殊字符
/*
    1.缺少u erroer：invalid escape sequence in literal(字符串忽略序列内容是非法的)
    2.Unicode编码不区分大小写
 */
let wiseWords = "\"imagination is more important than knowledge\" - Einstein"
let dollarSign = "\u{24}" //$ Unicode scalar U+0024
let blackHeart = "\u{2665}" //Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" //Unicode scalar U+1F496
//let letter2 = "\{0065}" //忽略u

// Unicode标量(Unicode Scalars)
/*
    1.定义：Unicode标量就是任意的21位的Unicode编码 
    2.每个 U+..(如U+0061)就是一个Unicode标量。
    3.同理，Swift字符串中 \u{..} == U+.. 也代表一个Unicode标量
    4.每个Unicode标量有一个值属性，就是可以返回对应的21位数值，输出结果用Unit32值表示
    注意：把Unicode标量和后面的扩展字元簇一起比较
 */

var cafe = "cafe"
print(cafe.characters.count)
for scalar in cafe.unicodeScalars {
    print(scalar.value)//输出的结果是十进制表示 c：99，a:97, f:102, e:101
}
let c = "\u{63}"  // 99对应的 十六进制为 0x63
let a = "\u{61}"  // 97对应的 十六进制为 0x61
let f = "\u{66}"  // 102对应的 十六进制为 0x66
let e = "\u{65}"  // 101对应的 十六进制为 0x65

// 扩展字元簇(Extended Grapheme Clusters)
/*
    1.Swift语言的每个字符(Character)就是一个独立的扩展字元簇。
    2.一个扩展字元簇是由一个或多个Unicode标量的有序排列而组成的可读字符。
    3.字符é 可以是单个Unicode标量 U+00E9,也可以是两个Unicode标量的有序排列(U+0065U+0301)
    4.所以在swift中字符串的改变不一定意味着字符串长度的改变 比如常量letter4和letter5，
    5.区分OC中NSSring的length属性的区别。NSstring的长度是基于字符串在UTF-16编码表示时其中包含的16位单元的个数
    6.通过le4和le5可以知道同义个字符的length不同。
 */
let letter1 = "\u{0301}"
let letter3 = "\u{0065}"
let letter4 = "\u{65}\u{301}" //结果是字符 é
let letter5 = "\u{e9}"        //结果仍然是字符 é
print(letter4.characters.count)
print(letter5.characters.count)
let le4: NSString = letter4
let le5: NSString = letter5
print(le4.length)
print(le5.length)

// 字符串下标
/*
    1.  OC可以通过下标来获取一个字符串的字符，但是这个下标是integer型
        Swift也可以通过下标来获取一个字符串的字符值，但是下标不能为Integer类型
 */

let greeting: String = "Guten Tag!"
let startIndex = greeting.startIndex
let endIndex = greeting.endIndex
let startIndexValue = greeting[startIndex]
//let endIndexValue = greeting[endIndex]
//let endIndexValue = greeting[greeting.index(before:greeting.endIndex)]//swift3.0

for index in greeting.characters.indices {
    print("\(greeting[index])") //字符串插值会替换掉变量
}

// 插入和移除
/*
    注意：Xcode是swift2 的版本，swift3中有一些新方法找不到
 */
var welcome2 = "hello"
welcome2.insert("!", atIndex: welcome2.endIndex)
welcome2.insertContentsOf(" there".characters, at: welcome2.endIndex)

// 字符串和字符判断
/*
    1.字符串和字符相等(用 == 和 != 判断) OC中：数值是用 == 和 != ,对象是用 isEqual
        1.1: 确切定义：如果扩展字元簇有相同的语义，那么这些扩展字元簇就相等，尽管他们可能有不同的Uncode标量组成
        1.2: 如果两个字符串或者两个字符的 扩展字元簇 相等，一般认为这两个字符串或字符就相等。但实质上不一定。
    2.前缀和后缀比较，结果返回bool值。hasPrefix和hasSuffix方法其实质是在扩展字元簇之间比较每个字符是否相等
 */
//1
let quotation = "We're a lot alike, you and i."
let sameQuotation = "We're a lot alike, you and i."
if quotation == sameQuotation {
    print(quotation)
}
//1.1
let eAcuteQuestion = "caf\u{e9}"
let combinedQuestion = "caf\u{65}\u{301}"
if eAcuteQuestion == combinedQuestion {
    print(combinedQuestion)
}
//1.2
let latinCapitalLetterA = "\u{41}"
let cyrillicCapitallLetterA = "\u{410}"
if latinCapitalLetterA == cyrillicCapitallLetterA {
    print("hi")
}

// 字符串各种表述
/*
    1.字符串的UTF-8表述
    2.字符串的UTF-16的表述
    3.字符串的UTF-32表述
    4.字符串的Unicode Scalar（标量）表述
 */
let dogString = "Dog!!"
for codeUnit in dogString.utf8 {
    print("\(codeUnit)",terminator:" ") //terminator终结print自带的换行符，替换成terminator的字符
}





