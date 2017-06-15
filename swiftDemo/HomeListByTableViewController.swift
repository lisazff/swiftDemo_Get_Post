//
//  HomeListByTableViewController.swift
//  swiftDemo
//
//  Created by lisa on 2017/5/24.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit
import MJRefresh

class HomeListByTableViewController: UITableViewController {

    var mdata:Array<Dictionary<String,String>>!; //声明一个数据源数组在类中 声明的全局变量
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mdata = Array(); //初始化全局变量
        for a in 1...10{ //循环给数组 添加10个数据
            var dic = Dictionary<String,String>();
            
            dic.updateValue("vvvv"+String(a), forKey: "name");
            dic.updateValue(String(98+a), forKey: "price")
            dic.updateValue("33", forKey: "sale");
            
            mdata.append(dic);
            
        }

        NSLog("11111 :%@", mdata);
    
      self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "headerRefresh")
        
        self.tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: "footerRefresh")
        
    }
    //下拉刷新操作
    func headerRefresh(){
        
//        let delayTime = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(3 * Double(NSEC_PER_SEC)))
//        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
//            //延迟3秒，执行的操作
//        }
        
        
        
        self.tableView.mj_header.endRefreshing()
           
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mdata.count;
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(90)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        struct Holder {
            static var id = "xxx"
        }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: Holder.id) as? ItemCell;
        if(cell == nil){
            cell =  Bundle.main.loadNibNamed("ItemCell", owner: nil, options: nil)?.last as! ItemCell;
        }
        cell?.title.text = mdata[indexPath.row]["name"];
        return cell!;
    
    }
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
