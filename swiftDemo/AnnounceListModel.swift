//
//  AnnounceListModel.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/27.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

class AnnounceListModel: NSObject {

    var close_time = ""
    var create_accid = ""
    var createby = ""
    var createbyaccount = ""
    var createtime = ""
    var icon = ""
    var id = ""
    var notice_desc = ""
    var notice_title = ""
    var notice_type = ""
    var view_count = ""
    
    var undefine:String = ""
    
    
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
//        if key =="Int"
//        {
//            undefine = valueas! String
//            
//        }

    }
    
 override init() {  //重写构造函数
    super.init()
    let dic = ["age":18,"name":"Clement","sex":"man","Int":"test"] as [String : Any]
    //模型一键赋值这个其实是运用了kvc的原理
    self.setValuesForKeys(dic)
    
    }
    
    init(dic:[String:AnyObject])  //构造函数
    {
        super.init()
        //模型一键赋值这个其实是运用了kvc的原理
        self.setValuesForKeys(dic)
        
    }
    
    
}
