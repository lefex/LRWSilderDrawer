//
//  LeftSliderTopView.swift
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSliderTopView: UIImageView {

    let iconWidth :CGFloat = 45.0
    let leftEdge :CGFloat = 10.0
    let topEdge :CGFloat = 50.0
    let labelHeight :CGFloat = 20.0
    
    var WLStopIconImageView :UIImageView!
    var WLSloginNameLabel :UILabel!
    var WLSdetailLable :UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = true
        createUI()
    }
    
    private func createUI(){
        // icon
        WLStopIconImageView = UIImageView(frame: CGRect(x: leftEdge, y: topEdge, width: iconWidth, height: iconWidth))
        WLStopIconImageView.layer.cornerRadius = iconWidth/2.0
        WLStopIconImageView.layer.masksToBounds = true
        self.addSubview(WLStopIconImageView)
        
        // loginName
        WLSloginNameLabel = UILabel(frame: CGRect(x: leftEdge*2 + iconWidth, y: topEdge, width: self.frame.size.width - leftEdge*3 - iconWidth, height: labelHeight))
        WLSloginNameLabel.textColor = UIColor.whiteColor()
        WLSloginNameLabel.font = UIFont.systemFontOfSize(LSWLeftSlideContraint.defaultMenuSmallFontSize())
        self.addSubview(WLSloginNameLabel)
        
        // user detail message
        WLSdetailLable = UILabel(frame: CGRect(x: leftEdge*2 + iconWidth, y: topEdge + labelHeight, width: self.frame.size.width - leftEdge*3 - iconWidth, height: labelHeight))
        WLSdetailLable.textColor = UIColor.whiteColor()
        WLSdetailLable.font = UIFont.systemFontOfSize(LSWLeftSlideContraint.defaultMenuSmallFontSize())
        self.addSubview(WLSdetailLable)
    }
    
    func loadData(userMessage: LSWUserMessage){
        WLStopIconImageView.image = userMessage.icon
        WLSloginNameLabel.text = userMessage.longinName
        WLSdetailLable.text = userMessage.detailName
        self.image = userMessage.blueIcon
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
