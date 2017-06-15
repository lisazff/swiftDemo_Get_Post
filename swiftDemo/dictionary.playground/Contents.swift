//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var someDict = [Int:String]();  //注意swift中所有的  都是函数  初始化也是构造函数赋值等 都会带有（）

var someDic:[Int:String] = [1:"One",2:"Two",3:"Three"]
var firstO = someDic[1]
print("key1的值为：\(firstO)")

var oldVal = someDic.updateValue("one的新值", forKey: 1)//返回一个值

print("oldDict \(someDic)")

var removeVal = someDic.removeValue(forKey: 2) //字典调用remove方法  该方法一个参数 key
print("oldDict \(someDic)")

//遍历字典
for (key,value) in someDic.enumerated() {
    
    print("字典key- \(key)  字典value- \(value)")
}






































		