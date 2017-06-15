//
//  HttpRequestInterface.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/27.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
import Alamofire

let BaseURL:String = "http://api1cs.fangchuang.com/api.php?"
//把所有的接口都写在这个类
class HttpRequestInterface: NSObject {

    /// 根据知乎日报二次封装的一个网络请求
    ///
    /// - Parameters:
    ///   - url:            当前接口需要的 URL
    ///   - requestName:    请求名称
    ///   - delegate:       处理网络请求成功和失败的代理
    ///   - param:          请求参数                    可选参数，默认为nil
    ///   - method:         网络请求类型                 可选参数，默认为 Get 请求方式
    
    
    class func WRRequest(url:String, requestName:String, delegate:HttpRequestDelegate, param:NSDictionary? = nil, method: HTTPMethod? = .get)
    {
        HttpRequest.requestDelegate(method: .get, url: url, requestName: requestName, parameters: nil, delegate: delegate)
    }
}

// MARK: - 所有接口的集合
extension HttpRequestInterface
{
    // 启动页闪屏
    class func requestSplashImage(delegate:HttpRequestDelegate)
    {
        let curURL = BaseURL.appending("7/prefetch-launch-images/1080*1920")
        WRRequest(url: curURL, requestName: "requestSplashImage", delegate: delegate)
    }
    
    
}
