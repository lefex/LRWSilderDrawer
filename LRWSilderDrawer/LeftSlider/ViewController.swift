//
//  ViewController.swift
//  LeftSlider
//
//  Created by wsy on 15/9/4.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LeftSliderDelegate {

    var leftView :LSWLeftSliderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let height: CGFloat = UIScreen.mainScreen().bounds.size.height
        
        let icons :NSMutableArray = NSMutableArray();
        icons.addObjectsFromArray(["about_us","album_book","password","personal"])
        let contents :NSMutableArray = NSMutableArray();
        contents.addObjectsFromArray(["首页","笔记本","音乐笔记","帮助"])
        let configures: NSMutableArray = NSMutableArray()
        
        for(var i = 0; i < contents.count; i++){
            let configure: LSWLeftCellConfigure = LSWLeftCellConfigure(icon: icons[i] as! String, content: contents[i] as! String, isSelected: false)
            configures.addObject(configure)
        }
        
        leftView = LSWLeftSliderView(frame: CGRect(x: 0, y: 0, width:height, height: self.view.frame.size.height), cellConfigures: configures)
        leftView.delegate = self
        let APP = UIApplication.sharedApplication().delegate as! AppDelegate
        APP.window?.addSubview(leftView)
        
        createLeftNavigationItem()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panGestureCloseLeftView:"))
        self.view.addGestureRecognizer(panGesture)
    }
    
    func createLeftNavigationItem(){
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        button.addTarget(self, action: Selector("leftItemClick"), forControlEvents: UIControlEvents.TouchUpInside)
        button.setBackgroundImage(UIImage(named: "groupNoteMine"), forState: UIControlState.Normal)
        let leftItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func leftItemClick(){
        if(leftView.isOpen){
            leftView.closeSlider()
        }else{
            leftView.openSlider()
        }
    }
    
    func panGestureCloseLeftView(panGesture :UIPanGestureRecognizer){
        leftView.panMainContentView(panGesture)
    }
    
    // LeftSliderDelegate
    func leftSliderIconClick(leftSliderView: LSWLeftSliderView) {
        print("leftSliderIconClick")
    }
    
    func leftSliderMenuItemClickIndex(leftSliderView: LSWLeftSliderView, index: Int) {
        print("leftSliderMenuItemClickIndex \(index)")
    }
    
    func leftSliderSettingClick(leftSliderView: LSWLeftSliderView) {
        print("leftSliderSettingClick")
    }


}

