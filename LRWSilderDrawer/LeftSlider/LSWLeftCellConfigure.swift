//
//  LeftCellConfigure.swift
//  LeftSlider
//
//  Created by wsy on 15/9/6.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftCellConfigure: NSObject {
    var icon: String!
    var content: String!
    var isSelected: Bool!
    
    init(icon: String, content: String, isSelected: Bool){
        super.init()
        self.icon = icon
        self.content = content
        self.isSelected = isSelected
    }
}
