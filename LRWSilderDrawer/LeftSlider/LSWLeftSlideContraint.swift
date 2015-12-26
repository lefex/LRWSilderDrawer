//
//  LeftSlideContraint.swift
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

import UIKit

class LSWLeftSlideContraint: NSObject {
   
    class func defaultBackgroudColor() -> UIColor{
        return UIColor(red: 195/255.0, green: 195/255.0, blue: 195/255.0, alpha: 0.3);
    }
    
    class func defaultContentWidth() -> CGFloat{
        return 200.0;
    }
    
    class func defaultTopHeight() -> CGFloat{
        return 140.0;
    }
    
    class func defaultMenuFontSize() -> CGFloat{
        return 15.0;
    }
    
    class func defaultMenuSmallFontSize() -> CGFloat{
        return 14.0;
    }
    
    class func defaultSettingViewWidth() -> CGFloat{
        return 55.0;
    }
    
    class func defaultCellHeight() -> CGFloat{
        return 44.0;
    }
}
