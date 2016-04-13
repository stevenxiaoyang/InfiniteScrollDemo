//
//  TableViewController.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/7.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    var dataArray = ["1","2","3","4","5"]
    let cellIdentifity = "reuseIdentifier"
    var loading = true
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifity, forIndexPath: indexPath)
        cell.imageView?.image = UIImage(named:"00\(dataArray[indexPath.row]).jpg")
        return cell
    }
    
    // MARK: - Table view Delegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    // MARK: - Scroll view Delegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 && loading{
            loading = false
            dataArray = ["6","7","8","9","1"] + dataArray
            let time: NSTimeInterval = 1.0
            let delay = dispatch_time(DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.tableView.reloadData()
                self.loading = true
            }

            self.tableView.contentOffset = CGPointMake(0,500)
        }
    }
}
