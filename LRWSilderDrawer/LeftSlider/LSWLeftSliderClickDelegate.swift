//
//  LeftSliderClickDelegate.swift
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import Foundation

protocol LeftSliderDelegate: class{
    func leftSliderIconClick(leftSliderView: LSWLeftSliderView);
    func leftSliderMenuItemClickIndex(leftSliderView: LSWLeftSliderView, index: Int);
    func leftSliderSettingClick(leftSliderView: LSWLeftSliderView);
}


protocol LeftTableViewRowClickDelegate: class{
    func leftTableRowClickIndex(index: Int);
}

protocol LeftSettingClickDelegate: class{
    func leftSettingClick();
}