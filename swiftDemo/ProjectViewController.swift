//
//  ProjectViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import Foundation
import UIKit

class ProjectViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn.frame = CGRect(x: 10, y: 240, width: 200, height: 40)
        btn.setTitle("Press me", for: UIControlState())
        btn.addTarget(self, action: #selector(ProjectViewController.buttonPressed), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    
    func buttonPressed() {
        let subView = ProjectDetailViewController()
        
        self.navigationController?.pushViewController(subView, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
