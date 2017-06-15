//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//// 带原始值的定义格式
//enum Seasons:Int {
//    
//    case spring = 1
//    case summer
//    case autumn
//    case winter
//}
////枚举的使用
//
//var seas = Seasons.spring  //给这个变量一个值  点 语法
//
//// 获取枚举成员的原始值
//print(seas.rawValue)
//
//// 找到一个特定的原始值枚举成员
//seas = Seasons(rawValue: 3)!
//
//print(seas.rawValue)

// 定义枚举
enum DaysofaWeek {
    case Sunday
    case Monday
    case TUESDAY
    case WEDNESDAY
    case THURSDAY
    case FRIDAY
    case Saturday
}

var weekDay = DaysofaWeek.THURSDAY
  weekDay = .Monday
switch weekDay
{
case .Sunday:
    print("星期天")
case .Monday:
    print("星期一")
case .TUESDAY:
    print("星期二")
case .WEDNESDAY:
    print("星期三")
case .THURSDAY:
    print("星期四")
case .FRIDAY:
    print("星期五")
case .Saturday:
    print("星期六")
}













































