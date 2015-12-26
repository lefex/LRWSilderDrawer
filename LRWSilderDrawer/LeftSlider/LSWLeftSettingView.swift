//
//  LeftSettingView.swift
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSettingView: UIView {

    private var imageWidth: CGFloat!
    private let edge: CGFloat = 14.0
    var settingButton: UIButton!
    
    weak var delegate: LeftSettingClickDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.layer.masksToBounds = true
        self.imageWidth = self.frame.size.width - 2*edge
        createUI()
    }
    
    private func createUI(){
        settingButton = UIButton(frame: CGRect(x: edge, y: edge, width:imageWidth , height: imageWidth))
        settingButton.setBackgroundImage(UIImage(named: "setting"), forState: UIControlState.Normal)
        settingButton.setBackgroundImage(UIImage(named: "setting"), forState: UIControlState.Highlighted)
        settingButton.addTarget(self, action: Selector("buttonClick:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(settingButton)
    }
    
    func buttonClick(button: UIButton){
        self.delegate!.leftSettingClick();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
