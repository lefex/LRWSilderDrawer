//
//  LeftSliderCell.swift
//  LeftSlider
//
//  Created by wsy on 15/9/4.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSliderCell: UITableViewCell {
    
    let width = UIScreen.mainScreen().bounds.size.width
    
    private let imageWidth :CGFloat = 30.0
    private let leftEdge :CGFloat = 10.0
    private let topEdge :CGFloat = 10.0
    private let redIconWidth: CGFloat = 13.0
    
    var leftIconImageView :UIImageView!
    var contentLabel :UILabel!
    var redIcon: UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        createUI()
     }

    private func createUI(){
        redIcon = UIImageView(frame: CGRect(x: leftEdge, y: (self.contentView.frame.size.height - redIconWidth)/2.0 + 3.0, width: redIconWidth, height: redIconWidth))
        redIcon.layer.cornerRadius = redIconWidth / 2.0
        redIcon.layer.masksToBounds = true
        redIcon.image = UIImage(named: "red_point")
        self.contentView.addSubview(redIcon)
        
        leftIconImageView = UIImageView(frame: CGRectMake(leftEdge + redIconWidth, topEdge, imageWidth, imageWidth))
        self.contentView.addSubview(leftIconImageView)
        
        contentLabel = UILabel(frame: CGRectMake(leftEdge*2 + imageWidth + redIconWidth, topEdge, width-imageWidth - leftEdge*3 , imageWidth))
        contentLabel.font = UIFont.systemFontOfSize(LSWLeftSlideContraint.defaultMenuFontSize());
        self.contentView.addSubview(contentLabel)
    }
    
    func loadDataWithIcon(iconName: String, content: String, isSelected: Bool){
        leftIconImageView.image = UIImage(named: iconName)
        contentLabel.text = content
        redIcon.hidden = !isSelected
    }
    
    func loadDataWithLeftCellConfigure(configure: LSWLeftCellConfigure){
        loadDataWithIcon(configure.icon, content: configure.content, isSelected: configure.isSelected)
    }

    
    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

}
