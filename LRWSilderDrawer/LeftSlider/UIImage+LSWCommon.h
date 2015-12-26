//
//  UIImage+LSWCommon.h
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LSWCommon)

- (UIImage *)bluredImageWithRadius:(CGFloat)blurRadius;

- (UIImage *)scalImageWithSize:(CGSize)size;

@end
