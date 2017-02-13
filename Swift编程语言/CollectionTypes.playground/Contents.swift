//: Playground - noun: a place where people can play

import UIKit

//                                     集合类型

/*
    1.和OC一样，Swift提供了三个最初的集合类型：数组(array)、集合(sets)、字典(dictionary).
        1.1 数组：顺序存储值。因此有对应的index
        1.2 集合：无序存储值。但集合中的值必须是唯一的，也就是不能重复。
        1.3 字典：无序存储值。但字典中有Key-Value关系。
    2.Swift中，集合类型中的key和value的类型必须是确定的。OC中只要存储的是对象就可以。
 */


// 可变集合
/*
    1.创建可变集合，只需要声明一个变量。这样集合就可以进行增删改操作
    2.创建不可变集合，只需要声明一个常量。这样集合的大小和内容就固定不可改变。
 */
var arrayM = Array<Int>()
arrayM.append(2)
arrayM.insert(3, atIndex: 0)
let array = Array<Int>()

// 数组
/*
    1.首先是一个有序列表(和OC中一致)
    2.  OC:数组中可以存放不同类型的对象
        Swift:数组中必须存放同一类型的值（swift中标准称为值）
    3.数组中的值可以重复(和OC一致)
    4.Swift和OC相互转化
    5.数组类型全称 Array<element> ,简写为 [element].element就是数组创建的时候必须声明的存储值类型
 */
let array2 = Array<Int>() //全称创建空数组
let array3: NSArray = array2
let array4 = ["1","2","3"] //简写创建数组
var someInts = [Int]()     //简写创建空数组
someInts.append(9)
someInts = []              //赋值空数组，但数组存储类型不变
//var threeDoubles = Array(repeating: 0.0, count: 3)

var shoppingList = ["1","2","3","4","5","6"]
shoppingList[1...3] = ["8","9"]
print(shoppingList)
shoppingList.insert("hi", atIndex: 0)
let remodedItem = shoppingList.removeAtIndex(0) //返回结果是删除的item
print(shoppingList)


// 遍历数组
/*
    1.循环遍历数组中的每个value
    2.用 enumerated()属性去遍历数组，且返回值为元组(Tuple)，元组有每个item对应的下标和value组成
 */
//1
for item in shoppingList {
    print(item)
}
//2
for (var index, var value) in shoppingList.enumerate() {//分解的变量 index和value默认为常量
    print(index, value)
}

// set
/*
    1.集合中值是唯一的 
    2.集合中值是无序的
    3.Swift中的集合中的值必须存放的都是同一类型的；OC除外
    4.存储于Set中的值，其类型必须是支持哈希的。一个哈希值就是一个Int值，可以用相等比较，如 a==b, a.hashValue == b.hashValue
    5.Swift中所有的基础类型都是可以哈希的。
 */

// 构造Set
/*
    1.类似集合类型的其他存储值的类型声明，都是用<element>声明
    2.你可以用一个空数组字面量赋值给一个set来使 Set成为空集合
    3.用一个数组字面量创建一个集合Set
 */
//1
var letters = Set<Character>()
print("letters is of type set<Characet> with \(letters.count) items")
//2
letters.insert("a")
letters = []
//3
var favoriteGenres: Set<String> = ["hi","he","hi","ha","ho"]

// 访问修改集合Set
/*//集合类型共有的属性
    1. .count
    2. .isEmpty
    3. .insert()
    4. .remove()
 */
// 判断Set里面是否包含某个item
if favoriteGenres.contains("hi") {
    print("包含")
}else {
    print("不包含")
}

// 遍历集合Set
/*
    1.直接遍历集合中的每个item。直接遍历的结果是无序的，由于set本来的无序性
    2.如果想得到有序的输出顺序，可以用sort()方法，输出规则为 按照 < 运算符 顺序输出
 */
//1
for genre in favoriteGenres {//输出的结果是无序的
    print(genre)
}
//2
for genre in favoriteGenres.sort() {
    print("12",genre)
}

// 基本set操作
/*
    1.得到一个两个集合共有部分的新集合。 .interSection()  intersection（交集）
    2.得到一个两个集合除了共有部分的新集合。 .symmetricDifference()
    3.得到一个两个集合所有部分的新集合。 .union()
    4.得到一个A集合除去B集合部分的新集合。.subtracting()   subtracting(减去)
    5.A集合去除B集合中的items，没有返回值，只是A集合变化。 .subtractInPlace
 */
let oddDigits: Set = ["1","3","5","7","9"]
let evenDigits: Set = ["0","2","4","6","8"]
let sigleNum: Set = ["2","3","5","7"]
var odd: Set = ["1","3","7","8"]
//1
let intersection = oddDigits.intersect(evenDigits) //swift2 的旧方法
oddDigits.intersect(sigleNum)  //返回一个新的集合set
//2 
oddDigits.exclusiveOr(evenDigits)  //swift2 旧方法
oddDigits.exclusiveOr(sigleNum)
//3
oddDigits.union(sigleNum)
//4
oddDigits.subtract(sigleNum)
//5
odd.subtractInPlace(sigleNum)
odd

// set间的关系
/*
    1. 两个集合包含的元素相同，则相等
    2. A集合包含B集合，则称为 A是B的 superSet，B是A的subSet
    3. 是否相交
 */
let A: Set = ["1","2","3"]
let B: Set = ["3","4","5"]
let C: Set = ["2","3"]
let D: Set = ["4","5"]
if A == B {
    print(A)
}else{
    print(B)
}
//2
var isSub = A.isSubsetOf(C)
//isSub = A.isSupersetOf(C)
isSub = A.isStrictSubsetOf(C)
isSub = A.isStrictSupersetOf(C)
if isSub {
    print(A)
}else {
    print(C)
}
//3
if A.isDisjointWith(D) {
    print(A)
}else {
    print(D)
}


// 字典
/*
    1. 键值对无序集合
    2. 所有的key具有同样的类型，所有的value具有同样的类型
    3. key必须是可哈希的
 */

// 构造字典
/*
    1.构造字典必须声明字典的key类型和value类型。可显示声明或隐式声明
    2.构造空字典
    3.根据字典字面量构造字典
 */
//1,2
let dict1 = Dictionary<String, String>() //标准构造方法
let dict2 = [String: Int]()              //简化构造方法
//3
var airports: [String: String] = ["YYZ":"Toronto Pearson", "DUB":"Dublin"]

// 访问和修改字典
/*
    1.方法
    2.属性
    3.下标
 */

// 遍历字典
/*
    1. 直接遍历,每个item是一个元组
    2. 遍历字典中所有的key，和遍历字典中所有的value
    3. 利用字典的keys和Values属性可以构造数组。其实是利用了数组的构造方法
    4. 也可以使用Sorted()遍历有序输出
 */
//1
for (code, name) in airports {// 无序输出
    print("\(code): \(name)")
}
//2
for code in airports.keys {
    print(code)
}
for name in airports.values {
    print(name)
}
//3
let codes = [String](airports.keys)
let names = [String](airports.values)











