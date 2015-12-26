//
//  LSWUserMessage.swift
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWUserMessage: NSObject {
   
    var icon: UIImage!
    var longinName: String!
    var detailName: String!
    var blueIcon: UIImage!
    
    init(icon: UIImage, longinName: String, detailName: String){
        super.init()
        self.icon = icon
        self.longinName = longinName
        self.detailName = detailName
        if self.icon == nil{
            let defaultBlueImage: UIImage = UIImage(named: "music_love")!
            self.icon = UIImage(named: "personal_defaut_icon")
            self.blueIcon = defaultBlueImage.bluredImageWithRadius(2.0)
        }else{
            self.blueIcon = self.icon.bluredImageWithRadius(2.0)
        }
    }
    
    
    

}
