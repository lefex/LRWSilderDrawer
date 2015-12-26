//
//  LeftSliderView.swift
//  LeftSlider
//
//  Created by wsy on 15/9/4.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSliderView: UIView, LeftTableViewRowClickDelegate, LeftSettingClickDelegate, UIGestureRecognizerDelegate{

    let contentWidth: CGFloat = LSWLeftSlideContraint.defaultContentWidth()
    let animateDuration: NSTimeInterval = 0.25
    let topY: CGFloat = LSWLeftSlideContraint.defaultTopHeight()
    let settingWidth: CGFloat = LSWLeftSlideContraint.defaultSettingViewWidth()
    
    var changeLocationX: CGFloat = 0
    var cellData: NSMutableArray!
    
    var isOpen: Bool = true
    var mainContentView: UIView!
    var leftTableView: LSWLeftSliderTableView!
    var topView: LSWLeftSliderTopView!
    var settingView: LSWLeftSettingView!
    
    weak var delegate: LeftSliderDelegate!
    
    init(frame: CGRect, cellConfigures: NSMutableArray) {
        super.init(frame: frame)
        self.cellData = cellConfigures;
        self.backgroundColor = LSWLeftSlideContraint.defaultBackgroudColor();
        self.userInteractionEnabled = true;
        createUI();
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("tapMainContentView:"));
        tapGesture.delegate = self
        self.addGestureRecognizer(tapGesture);
        
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panMainContentView:"))
        self.addGestureRecognizer(panGesture)
    }
    
    func createUI(){
        mainContentView = createContentView()
        self.addSubview(mainContentView);
        
        topView = createLeftTopView()
        mainContentView.addSubview(topView)
        
        leftTableView = createLeftTableView()
        mainContentView.addSubview(leftTableView)
        
        settingView = createLeftSettingView()
        mainContentView.addSubview(settingView)
    }
    
    func createContentView() -> UIView {
        mainContentView = UIView(frame: CGRect(x: 0, y: 0, width: contentWidth, height: CGRectGetHeight(self.frame)));
        return mainContentView;
    }
    
    func createLeftTopView() -> LSWLeftSliderTopView {
        let topView :LSWLeftSliderTopView = LSWLeftSliderTopView(frame: CGRect(x: 0, y: 0, width: contentWidth, height: topY));
        let iconImage: UIImage = UIImage(named: "music_love")!
        let userMessage = LSWUserMessage(icon: iconImage, longinName: "王素燕", detailName: "wsyxyxs@126.com")
        topView.loadData(userMessage)
        
        let topTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("topViewClick:"));
        topView.addGestureRecognizer(topTapGesture);
        return topView;
    }
    
    func createLeftTableView() -> LSWLeftSliderTableView {
        let leftTableView = LSWLeftSliderTableView(frame:  CGRect(x: 0, y: topY, width: contentWidth, height: CGRectGetHeight(mainContentView.frame)-topY), cellConfigures:self.cellData);
        leftTableView.delegate = self
        return leftTableView;
    }
    
    func createLeftSettingView() -> LSWLeftSettingView {
        let setView: LSWLeftSettingView = LSWLeftSettingView(frame: CGRect(x: contentWidth - settingWidth, y: CGRectGetHeight(mainContentView.frame) - settingWidth, width: settingWidth, height: settingWidth))
        setView.delegate = self
        return setView;
    }
    
    func openSlider(){
        self.frame.origin.x = 0;
        UIView.animateWithDuration(animateDuration, delay: 0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: { () -> Void in
            self.isOpen = true;
            self.mainContentView.frame.origin.x = 0.0;
            self.alpha = 1.0;
            }) { (isComplete) -> Void in
                if(isComplete){

                }
        }
    }
    
    func closeSlider(){
        UIView.animateWithDuration(animateDuration, delay: 0, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: { () -> Void in
            self.isOpen = false
            self.mainContentView.frame.origin.x = -self.contentWidth;
            self.alpha = 0.0;
        }) { (isComplete) -> Void in
            if isComplete{
                self.frame.origin.x = -self.frame.size.width;
            }
        }
    }
    
    func tapMainContentView(tapGesture :UITapGestureRecognizer){
        closeSlider()
    }
    
    func panMainContentView(panGesture :UIPanGestureRecognizer){
        
        let currentPoint :CGPoint = panGesture.translationInView(self);
        if(panGesture.state == UIGestureRecognizerState.Began)
        {
            changeLocationX = self.isOpen ? 0.0 : -contentWidth;
            self.alpha = self.isOpen ? 1.0 : 0.1;
        }
        
        if(panGesture.state == UIGestureRecognizerState.Changed)
        {
            if(self.isOpen){
                // 关闭
                if(currentPoint.x >= -contentWidth && currentPoint.x <= 0){
                    mainContentView.frame.origin.x = currentPoint.x;
                    changeLocationX = currentPoint.x;
                    self.alpha = (contentWidth + changeLocationX) / contentWidth;
                }
            }else{
                if(currentPoint.x >= -contentWidth && currentPoint.x <= 0){
                    mainContentView.frame.origin.x = currentPoint.x;
                    changeLocationX = currentPoint.x;
                    self.alpha = -changeLocationX / contentWidth;
                }
            }

        }
        
        if( panGesture.state == UIGestureRecognizerState.Ended ||
            panGesture.state == UIGestureRecognizerState.Cancelled ||
            panGesture.state == UIGestureRecognizerState.Failed)
        {
            if(changeLocationX <= -contentWidth/3)
            {
                UIView.animateWithDuration(animateDuration/2.0, animations: { () -> Void in
                    self.isOpen = false;
                    self.mainContentView.frame.origin.x = -self.contentWidth;
                }, completion: { (isComplete) -> Void in
                    if isComplete{
                        self.frame.origin.x = -self.frame.size.width;
                    }
                })
            }
            else
            {
                UIView.animateWithDuration(animateDuration/2.0, animations: { () -> Void in
                    self.isOpen = true;
                    self.mainContentView.frame.origin.x = 0;
                }, completion: { (isComplete) -> Void in
                    if isComplete{
                        self.frame.origin.x = 0;
                    }
                })
            }
            
            self.alpha = self.isOpen ? 1.0 : 0.1;

        }
    }
    
    // UIGestureRecognizerDelegate
     override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        let clickPoint: CGPoint = gestureRecognizer.locationInView(self)
        if clickPoint.x < 200{
            return false
        }else{
            return true
        }
    }
    
    // LeftSliderDelegate
    func topViewClick(tapGesture: UITapGestureRecognizer){
        closeSlider();
        self.delegate.leftSliderIconClick(self);
    }
    
    func leftTableRowClickIndex(index: Int) {
        closeSlider();
        self.delegate.leftSliderMenuItemClickIndex(self, index: index);
    }
    
    func leftSettingClick() {
        closeSlider();
        self.delegate.leftSliderSettingClick(self);
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
