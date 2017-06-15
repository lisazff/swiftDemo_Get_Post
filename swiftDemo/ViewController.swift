//
//  ViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/4/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let names = ["Mark","Peage","Tommy","Lisa","Mary"]; //数组
        
        //下面直接调用  排序的 全局方法sorted     给人名字排序
        
//        var sortedNames = sorted(names, sortFun);
//        var sortedNames = names.sorted(sortFun);
        
        let sortedNames = names.sorted(by: sortFun);
        print(sortedNames);
        
//定义一个字典
        let digitalNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",
                            
                            7:"Seven",8:"Eight",9:"Nine"];
        
//        let digitalNames11 = ["0":"jjsj","1":"One","2":"Two","3":"Three","4":"Four","5":"Five","6":"Six",
//                            
//                            "7":"Seven","8":"Eight","9":"Nine"];
//        
//        var qqq = digitalNames11["0"]
//        print(" wwee:\(qqq)")
//        
//        
//        
//        let digitalNames22 = ["777":"haha","888":"hehe"];
//        
//        let a = digitalNames22["777"];
//        let b = digitalNames22["111"];
//        
//        print("\(a)+\(b)");
        
        
//        let digitArr = [12,23,57,89];
//        
//        let strings = digitArr.map{
//        
//            (var number) -> String in
//        
//        var output = "";
//            while(number > 0 ){
//            output = digitalNames[number % 10]!+output
//            number /= 10;
//            
//            }
//        return output;   //每判断完  一个数字  返回对应的字符串
//            
//        }
//    print(strings)
        
        
        
    
        self.testGet();
//        self.testPost();
    }
    
  //一个单独的从小到大的升序排序函数
    func sortFun(s1:String,s2:String) -> Bool {
        return s1 < s2;  //如果s1 字符串 小于 s2 则 返回真   该函数 返回的布尔值 作为下一个函数的参数
    }
  
//     把排序函数转化为闭包 闭包表达式的格式为：  { (s1:String,s2:String)->Bool in return s1<s2}
 
    /*
尾随闭包  1.如果函数最后一个参数 是闭包， 在调用该函数时 可以将闭包 写在函数外面
     2. 如果函数只有一个闭包参数  那么 函数名后面的圆括号 也可以省略了   现在我们知道 为什么闭包要加一对大括号了吧
     
 */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Get 请求
    func testGet()  {   //url模拟  方客  公告通知的请求接口
        Alamofire.request("http://api1cs.fangchuang.com/api.php?&appkey=49485071944&cust_class=3&cust_id=15806&display_id=ba27e7e219356517471d8d7c87130c15&keyword=&language=zh-Hans-CN&method=eliteall.newproject&opearpage=list&os=ios&pagenum=1&perpage=10&timer=1492999468259&token=d54ee7cc810d742347b4952bfbceaa84&type=releasenotice&username=15921696710&uuid=2EACE66F-1A27-4237-803B-83AFD4A295E2&version=2.1.2").responseJSON(completionHandler: {response in
            if response.result.isSuccess{
                
                //最原始的解析    服务器响应数据
                
//                if let result = response.value as? [String: AnyObject] {
//                    let dataList: [[String : Any]]? = result["data"]?["data"] as? [[String : Any]]
//                    for data in dataList! {
//                        let dic:Dictionary = data;
//                        print("每条公告数据:  \(dic)");
//                    }
//                }
                
                //利用常用第三方框架 swiftyJSON  解析
                let json: JSON = JSON(data: response.data!)
                print("解析后的json数据为: \(json)");
                
                
                
            }else{
                
            }
        });
  
    }
    
    // Post请求
    func testPost(){
        
        var headers:Dictionary = [String:String]()
        headers["Content-Type"] = "application/json"
        headers["Set-Cookie"] = "xxxxxxxxxxxxxxxxx"
        
        var dic = [String:AnyObject]()
        
        dic["appkey"] = "49485071944" as AnyObject?
        dic["cust_class"] = "3" as AnyObject?
        dic["cust_id"] = "15806" as AnyObject?
        dic["display_id"] = "ba27e7e219356517471d8d7c87130c15" as AnyObject?
        dic["keyword"] = "" as AnyObject?
        dic["language"] = "zh-Hans-CN" as AnyObject?
        dic["method"] = "eliteall.newproject" as AnyObject?
        dic["opearpage"] = "list" as AnyObject?
        dic["os"] = "ios" as AnyObject?
        dic["pagenum"] = "1" as AnyObject?
        dic["perpage"] = "10" as AnyObject?
        dic["timer"] = "1492999468259" as AnyObject?
        dic["token"] = "d54ee7cc810d742347b4952bfbceaa84" as AnyObject?
        dic["type"] = "releasenotice" as AnyObject?
        dic["username"] = "15921696710" as AnyObject?
        dic["uuid"] = "2EACE66F-1A27-4237-803B-83AFD4A295E2" as AnyObject?
        dic["version"] = "2.1.2" as AnyObject?
        
        
//        Alamofire.request("http://api1cs.fangchuang.com/api.php?", method: .post, parameters: dic, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
        
        Alamofire.request(ServerUrl, method: .post, parameters: dic, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
        
            print("post 方法");
            if let dic = response.result.value {
                print("dic: \(dic)")
            }
            else
            {
                print("dic: \(response)")
            }

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

