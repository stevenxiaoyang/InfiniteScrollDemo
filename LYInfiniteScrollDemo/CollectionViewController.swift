//
//  CollectionViewController.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/5.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCellId"

class CollectionViewController: UICollectionViewController, LayoutDelegate{
    var dataArray = [1,2,3,4,5]
    var layout:CustomLayout!
    let cellSize = CGSizeMake(100, 100)
    let cellMargin = (Screen_Width - 300)/2

    var loading:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIColor.whiteColor()
        layout = self.collectionViewLayout as! CustomLayout
        layout.delegate = self
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! imageCell
        cell.imageView.image = UIImage(named:"00\(dataArray[indexPath.row]).jpg")
        return cell
    }
    
    // MARK: UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView.contentOffset.x > CGFloat(dataArray.count - 3) * (cellMargin + cellSize.width) && loading{
            dataArray = dataArray + [6,7,8,9,1]
            let time: NSTimeInterval = 1.0
            let delay = dispatch_time(DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.collectionView?.reloadData()
                self.loading = true
            }
            loading = false
        }
    }
    
    // MARK: LayoutDelegate
    func fetchCellMargin() -> CGFloat {
        return cellMargin
    }
    
    func fetchCellSize() -> CGSize {
        return cellSize
    }
}

class imageCell : UICollectionViewCell{
    @IBOutlet weak var imageView: UIImageView!
}