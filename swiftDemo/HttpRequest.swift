//
//  HttpRequest.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/26.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
import Alamofire

// 网络请求超时时间
let NetworkTimeoutInterval:Double = 10

//声明一个网络请求代理
@objc  protocol HttpRequestDelegate:NSObjectProtocol {  //为什么要加 @objc    ????
    
    //两个代理方法  请求成功 或失败
 @objc  optional func requestDidSuccess(result:AnyObject,requestName:String,parameters:NSDictionary?);
 @objc  optional func requestDidFailed(result:AnyObject,error:Error?,requestName:String,parameters:NSDictionary?);
 
    
}
class HttpRequest: NSObject {  //包装一个请求类

    //声明 该类的一个 delegate变量
    var delegate:HttpRequestDelegate?
    
    //运用alamofire 声明一个 会话管理 sessionManager
    static var sessionManager:SessionManager? = nil
    
    /// 闭包回调请求(类方法)
    ///
    /// - Parameters:
    ///   - method: 请求方式 get、post...
    ///   - url: 可以是字符串，也可以是URL
    ///   - parameters: 参数字典
    ///   - finishedCallback: 完成请求的回调
    
     //接下来 把 网络请求方法设置为类方法  前面加上关键字
    class func request(method:HTTPMethod,url:String,parameters:Dictionary<String, Any>?, finishedCallback:@escaping (_ result:AnyObject, _ error:Error?)->())
    {
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = NetworkTimeoutInterval
        // 初始化session 实例
        
        sessionManager = SessionManager(configuration: config)
        
        Alamofire.request(url, method: method, parameters: parameters).responseJSON
        { (response) in
                let data = response.result.value
                if (response.result.isSuccess)
                {
                    print("请求成功：\(data)")
                    finishedCallback(data as AnyObject, nil)
                }
                else
                {
                    print("请求失败：\(response.result.error)")
                    finishedCallback(data as AnyObject,response.result.error)
                }
        }
        
    }
    /// 代理方法请求(类方法)
    ///
    /// - Parameters:
    ///   - method: 请求方式 get、post...
    ///   - url: 可以是字符串，也可以是URL
    ///   - requestName: 请求名字，一个成功的代理方法可以处理多个请求，所以用requestName来区分具体请求
    ///   - parameters: 参数字典
    ///   - delegate: 代理对象
    class func requestDelegate(method:HTTPMethod, url:String, requestName:String, parameters:NSDictionary?, delegate:AnyObject)
    {
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = NetworkTimeoutInterval
        sessionManager = SessionManager(configuration: config)
        Alamofire.request(url, method: method, parameters: parameters as? Parameters).responseJSON
            { (response) in
                let data = response.result.value
                if (response.result.isSuccess)
                {
                    delegate.requestDidSuccess?(result: data as AnyObject, requestName: requestName, parameters: parameters)  
                }
                else
                {
                    delegate.requestDidFailed?(result: data as AnyObject, error:response.error, requestName: requestName, parameters: parameters)
                }
        }
    }

    
    
}
