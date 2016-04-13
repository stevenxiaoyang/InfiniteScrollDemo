//
//  ViewsViewController.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/13.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit

class ViewsViewController: UIViewController {
    var leftFrame:CGRect!
    var middleFrame:CGRect!
    var rightFrame:CGRect!
    var viewArray:Array<photoView>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.clipsToBounds = true
        leftFrame = CGRectMake(-self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height)
        middleFrame = self.view.frame
        rightFrame = CGRectMake(self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height)
        
        let leftView = photoView(frame: leftFrame)
        self.view.addSubview(leftView)
        
        let middleView = photoView(frame: middleFrame)
        self.view.addSubview(middleView)
        
        let rightView = photoView(frame: rightFrame)
        self.view.addSubview(rightView)
        
        viewArray = [leftView,middleView,rightView];
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "leftSwipeEvent")
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "rightSwipeEvent")
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    func leftSwipeEvent(){
        let leftView = viewArray[0]
        viewArray.append(leftView)
        viewArray.removeAtIndex(0)
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                () -> Void in
                self.viewArray[0].frame = self.leftFrame
                self.viewArray[1].frame = self.middleFrame
            
            }) {
                (finished:Bool) -> Void in
                self.viewArray[2].frame = self.rightFrame
        }
    }
    
    func rightSwipeEvent(){
        let rightView = viewArray[2]
        viewArray.insert(rightView, atIndex: 0)
        viewArray.removeLast()
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            () -> Void in
            self.viewArray[2].frame = self.rightFrame
            self.viewArray[1].frame = self.middleFrame
            
            }) {
                (finished:Bool) -> Void in
                self.viewArray[0].frame = self.leftFrame
        }
    }
    
}

class photoView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        let image = UIImage(named:"00\(random()%9+1).jpg")
        let imageView = UIImageView(frame: CGRectMake((Screen_Width - 100)/2, 100, 100, 100))
        imageView.image = image
        self.addSubview(imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
