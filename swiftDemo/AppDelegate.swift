//
//  AppDelegate.swift
//  swiftDemo
//
//  Created by lisa on 2017/4/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
        
        self.initTab();
        return true
    }
    
    //初始化tabbar
    func initTab() {  //无参数无返回值的方法
        let nav1 = UINavigationController()  //初始化一个导航控制器
        nav1.tabBarItem.title = "首页"  //导航上面有tabbarItem 选项  设置其标题
        
        var tabBarImage = UIImage(named: "homeIcon")  //图片
        tabBarImage = tabBarImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav1.tabBarItem.image = tabBarImage  //设置选项图片
        
        var tabBarImageSelected = UIImage(named:"home2Icon")
        tabBarImageSelected = tabBarImageSelected?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav1.tabBarItem.selectedImage = tabBarImageSelected;
        
        //需要把这两个图片的渲染模式即UIImageRenderingMode都设置为原始状态即AlwaysOriginal这样就可以显示图片原本的颜色了
        
        /*
         .Automatic  // 根据图片的使用环境和所处的绘图上下文自动调整渲染模式。
         .AlwaysOriginal   // 始终绘制图片原始状态，不使用Tint Color。
         .AlwaysTemplate   // 始终根据Tint Color绘制图片，忽略图片的颜色信息。
 
        */
        
        
       let HomeVC = HomeViewController(nibName: nil, bundle: nil)
//         let HomeVC = ViewController(nibName: nil, bundle: nil)  //有闭包的解读
        HomeVC.view.backgroundColor = UIColor.white
        HomeVC.title = "首页"

        nav1.viewControllers = [HomeVC]  //每个tab选项 一个自己的导航栈 控制器
        
        //自定义navigationBar的返回按钮
        let btn:UIButton = UIButton(type:UIButtonType.system )as UIButton
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        btn.backgroundColor = UIColor.red
        btn.setImage(UIImage(named:"com_arrows_left"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(backToPrevious), for: UIControlEvents.touchUpInside)
        
        let leftItem = UIBarButtonItem(customView: btn)
        nav1.navigationItem.leftBarButtonItem = leftItem;
        
        

        
       //第二个
        let nav2 = UINavigationController()
        nav2.tabBarItem.title = "项目"
        tabBarImage = UIImage(named: "briefcase")
        nav2.tabBarItem.image = tabBarImage
        
        tabBarImageSelected = UIImage(named:"briefcase2")
        tabBarImageSelected = tabBarImageSelected?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav2.tabBarItem.selectedImage = tabBarImageSelected;

        
        let ProjectVC = ProjectViewController(nibName: nil, bundle: nil)
        ProjectVC.view.backgroundColor = UIColor.white
        ProjectVC.title = "项目"
        nav2.viewControllers = [ProjectVC]
        
        //第三个
        let nav3 = UINavigationController()
        nav3.tabBarItem.title = "发布"
        tabBarImage = UIImage(named: "extendUnSelected")
        nav3.tabBarItem.image = tabBarImage
        
        tabBarImageSelected = UIImage(named:"extendSelected")
        tabBarImageSelected = tabBarImageSelected?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav3.tabBarItem.selectedImage = tabBarImageSelected;
        
        
        let PublishVC = PublishViewController(nibName: nil, bundle: nil)
        PublishVC.view.backgroundColor = UIColor.white
        PublishVC.title = "发布"
        nav3.viewControllers = [PublishVC]
        
        //第四个
        let nav4 = UINavigationController()
        nav4.tabBarItem.title = "消息"
        tabBarImage = UIImage(named: "chatIcon")
        nav4.tabBarItem.image = tabBarImage
        tabBarImageSelected = UIImage(named:"chatIconSelected")
        tabBarImageSelected = tabBarImageSelected?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav4.tabBarItem.selectedImage = tabBarImageSelected;
        
        
        let MessageVC = MessageViewController(nibName: nil, bundle: nil)
        MessageVC.view.backgroundColor = UIColor.white
        MessageVC.title = "消息"
        nav4.viewControllers = [MessageVC]
        
        //第五个
        let nav5 = UINavigationController()
        nav5.tabBarItem.title = "个人"
        tabBarImage = UIImage(named: "meIcon")
        nav5.tabBarItem.image = tabBarImage
        
        tabBarImageSelected = UIImage(named:"meIconSelected")
        tabBarImageSelected = tabBarImageSelected?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        nav5.tabBarItem.selectedImage = tabBarImageSelected;
        
        
        let MeVC = MeViewController(nibName: nil, bundle: nil)
        MeVC.view.backgroundColor = UIColor.white
        MeVC.title = "个人"
        nav5.viewControllers = [MeVC]
        
        
        let tabs = UITabBarController()
        tabs.viewControllers = [nav1,nav2,nav3,nav4,nav5]
        
        self.window!.rootViewController = tabs;
        self.window?.makeKeyAndVisible();

    }
    
    //返回按钮点击响应
    func backToPrevious(){
        //self.navigationController!.popViewController(animated: true)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

