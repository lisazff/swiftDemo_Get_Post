//
//  HomeDetailViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import Foundation
import UIKit

class HomeDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.view.backgroundColor = UIColor.white
      self.title = "首页详情"
    
        //自定义navigationBar的返回按钮
        let btn:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn.frame = CGRect(x: -40, y: 0, width: 30, height: 30)  //改变x的坐标是没用的
        btn.backgroundColor = UIColor.red
        btn.setImage(UIImage(named:"com_arrows_left"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(backToPrevious), for: UIControlEvents.touchUpInside)
        
        let leftItem = UIBarButtonItem(customView: btn)
        
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,action: nil)
        spacer.width = -15;
        self.navigationItem.leftBarButtonItems = [spacer, leftItem]
        
        
        let btn1:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn1.frame = CGRect(x: 10, y: 240, width: 200, height: 40)
        btn1.setTitle("Press me", for: UIControlState())
        btn1.addTarget(self, action: #selector(HomeDetailViewController.buttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn1)
        
       

    }
    
    func buttonPressed() {
        let subView = ProjectDetailViewController()
        self.navigationController?.pushViewController(subView, animated: true)
    }

    func backToPrevious()  {
        self.navigationController!.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
