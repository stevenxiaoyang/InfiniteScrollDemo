//
//  ViewController.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/5.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let cellIdentifier = "cellId";
    let titleArray = ["scrollView","tableView","CollectionView","多个View"];
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - TableViewDataSource
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    //MARK: - TableViewDelegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = titleArray[indexPath.row];
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            self.navigationController?.pushViewController(ScrollViewController(), animated: true)
        }
        else if indexPath.row == 1{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("TableVC") 
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("CollectionVC") as! UICollectionViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            self.navigationController?.pushViewController(ViewsViewController(), animated: true)
        }
    }
}

