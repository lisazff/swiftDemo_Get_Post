//
//  ViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/4/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        self.testGet();
        
        self.testPost();
    }
    
    //Get 请求
    func testGet()  {   //url模拟  方客  公告通知的请求接口
        Alamofire.request("http://api1cs.fangchuang.com/api.php?&appkey=49485071944&cust_class=3&cust_id=15806&display_id=ba27e7e219356517471d8d7c87130c15&keyword=&language=zh-Hans-CN&method=eliteall.newproject&opearpage=list&os=ios&pagenum=1&perpage=10&timer=1492999468259&token=d54ee7cc810d742347b4952bfbceaa84&type=releasenotice&username=15921696710&uuid=2EACE66F-1A27-4237-803B-83AFD4A295E2&version=2.1.2").responseJSON(completionHandler: {response in
            if response.result.isSuccess{
                if let result = response.value as? [String: AnyObject] {
                    let dataList: [[String : Any]]? = result["data"]?["data"] as? [[String : Any]]
                    for data in dataList! {
                        let dic:Dictionary = data;
                        print("每条公告数据:  \(dic)");
                    }
                }
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
        
        
        Alamofire.request("http://api1cs.fangchuang.com/api.php?", method: .post, parameters: dic, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: {response in
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

