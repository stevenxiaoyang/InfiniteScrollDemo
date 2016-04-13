//
//  ScrollViewController.swift
//  LYInfiniteScrollDemo
//
//  Created by LuYang on 16/4/12.
//  Copyright © 2016年 LuYang. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    let scrollView = customScrollView.init(frame: CGRectMake(100, 100, 200, 300))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSizeMake(200, 900)
        self.view.addSubview(scrollView)
        
        let redView = UIView.init(frame: CGRectMake(0, 0, 200, 300))
        redView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(redView)
        
        let greenView = UIView.init(frame: CGRectMake(0, 300, 200, 300))
        greenView.backgroundColor = UIColor.greenColor()
        scrollView.addSubview(greenView)
        
        let yellowView = UIView.init(frame: CGRectMake(0, 600, 200, 300))
        yellowView.backgroundColor = UIColor.yellowColor()
        scrollView.addSubview(yellowView)

    }
}

class customScrollView: UIView {
    var contentSize:CGSize
    override init(frame: CGRect) {
        self.contentSize = frame.size
        super.init(frame: frame)
        self.clipsToBounds = true
        let panGes = UIPanGestureRecognizer.init(target: self, action: "handlePanGesture:")
        self.addGestureRecognizer(panGes)
    }
    
    func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer){
        let translation = gestureRecognizer.translationInView(self)
        let bounds = self.bounds
        let newBoundsOriginY = bounds.origin.y - translation.y
        
        if newBoundsOriginY + self.frame.size.height <= contentSize.height && newBoundsOriginY >= 0{
            self.bounds = CGRectMake(bounds.origin.x, newBoundsOriginY, bounds.size.width, bounds.size.height)
            gestureRecognizer .setTranslation(CGPointZero, inView: self)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}