//
//  CustomLayout.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/5.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit
let Screen_Width = UIScreen.mainScreen().bounds.width
let Screen_Height = UIScreen.mainScreen().bounds.height

protocol LayoutDelegate : NSObjectProtocol{
    func fetchCellMargin() -> CGFloat
    func fetchCellSize() -> CGSize
}


class CustomLayout: UICollectionViewLayout {
    var numberOfCells:Int!
    var cellMargin:CGFloat!
    var cellSize:CGSize!
    weak var delegate:LayoutDelegate?
    
    override func prepareLayout() {
        super.prepareLayout()
        self.initData()
    }
    
    override func collectionViewContentSize() -> CGSize {
        return CGSizeMake((100 + cellMargin) * CGFloat(numberOfCells) - cellMargin, Screen_Height-64);
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var array = [UICollectionViewLayoutAttributes]()
        for var index = 0; index < numberOfCells; index++ {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            let attribute = self.layoutAttributesForItemAtIndexPath(indexPath)
            array.insert(attribute!, atIndex: index)
        }
        return array;
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        attribute.center = CGPointMake(50 + CGFloat(indexPath.row)*(100 + cellMargin) , (Screen_Height - 64)/2)
        attribute.size = cellSize
        return attribute;
    }
    
    
    func initData(){
        numberOfCells = self.collectionView?.numberOfItemsInSection(0)
        if delegate != nil {
            cellMargin = delegate?.fetchCellMargin()
            cellSize = delegate?.fetchCellSize()
        }
        else{
            cellMargin = 10
            cellSize = CGSizeMake(100, 100)
        }
    }
}
