//
//  HomeViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class HomeViewController:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let btn:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn.frame = CGRect(x: 10, y: 140, width: 200, height: 40)
        btn.setTitle("Press me", for: UIControlState())
        btn.addTarget(self, action: #selector(HomeViewController.buttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    
//        self.loadAnouncementListRequest();
        
        //SDWebImage  直接用
        let imageView:UIImageView = UIImageView()
        imageView.frame = CGRect(x:20, y:220, width:100, height:100)
        self.view.addSubview(imageView)
        imageView.sd_setImage(with: NSURL(string: "http://www.szplanner.com/images/inside/product_activity_thumb.jpg") as URL?, placeholderImage: UIImage(named: "nopic.jpg"))
        
    }
    
    
    func loadAnouncementListRequest() -> () {
        var parameterDic = [String:AnyObject]()
        
        parameterDic["appkey"] = "49485071944" as AnyObject?
        parameterDic["cust_class"] = "3" as AnyObject?
        parameterDic["cust_id"] = "15806" as AnyObject?
        parameterDic["display_id"] = "ba27e7e219356517471d8d7c87130c15" as AnyObject?
        parameterDic["keyword"] = "" as AnyObject?
        parameterDic["language"] = "zh-Hans-CN" as AnyObject?
        parameterDic["method"] = "eliteall.newproject" as AnyObject?
        parameterDic["opearpage"] = "list" as AnyObject?
        parameterDic["os"] = "ios" as AnyObject?
        parameterDic["pagenum"] = "1" as AnyObject?
        parameterDic["perpage"] = "10" as AnyObject?
        parameterDic["timer"] = "1492999468259" as AnyObject?
        parameterDic["token"] = "d54ee7cc810d742347b4952bfbceaa84" as AnyObject?
        parameterDic["type"] = "releasenotice" as AnyObject?
        parameterDic["username"] = "15921696710" as AnyObject?
        parameterDic["uuid"] = "2EACE66F-1A27-4237-803B-83AFD4A295E2" as AnyObject?
        parameterDic["version"] = "2.1.2" as AnyObject?
        
        
         HttpRequest.request(method: .post, url: BaseURL, parameters: parameterDic) { (_ result:AnyObject, _ error:Error?) in
            
//            let resultDic = result
//            print("请求成功resultDic: \(resultDic)")
//            print("请求的code码 ：\(resultDic["code"])")
//            print("请求成功result: \(result)")
            
            
//            func parseResult(_ result : Any) {
//                guard let resultDict = result as? [String:Any] else {return}
//                guard let typesDictData = resultDict["message"] as? [String:Any] else {return}
//                for i in 0..<typesDictData.count{
//                    guard let typeDict = typesDictData["type\(i+1)"] as?[String:Any] else {continue}
//                    self.parseData.append(TGGiftPackage(dict:typeDict))
//                }
//                self.parseData = self.parseData.filter({ $0.t != 0 }).sorted(by: { $0.t > $1.t })
//            }  
            
            
        }
    }
    
    
    func buttonPressed() {
        let subView = HomeListByTableViewController()
        self.navigationController?.pushViewController(subView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
