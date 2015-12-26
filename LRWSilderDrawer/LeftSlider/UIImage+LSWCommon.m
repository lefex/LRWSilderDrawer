//
//  UIImage+LSWCommon.m
//  LeftSlider
//
//  Created by wsy on 15/9/5.
//  Copyright (c) 2015年 WSY. All rights reserved.
//

#import "UIImage+LSWCommon.h"
#import <Accelerate/Accelerate.h>


@implementation UIImage (LSWCommon)

- (UIImage *)bluredImageWithRadius:(CGFloat)blurRadius
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [self scale]);
    CGContextRef effectInContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(effectInContext, 1.0, -1.0);
    CGContextTranslateCTM(effectInContext, 0, -self.size.height);
    CGContextDrawImage(effectInContext, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
    vImage_Buffer effectInBuffer;
    effectInBuffer.data     = CGBitmapContextGetData(effectInContext);
    effectInBuffer.width    = CGBitmapContextGetWidth(effectInContext);
    effectInBuffer.height   = CGBitmapContextGetHeight(effectInContext);
    effectInBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectInContext);
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, [self scale]);
    CGContextRef effectOutContext = UIGraphicsGetCurrentContext();
    vImage_Buffer effectOutBuffer;
    effectOutBuffer.data     = CGBitmapContextGetData(effectOutContext);
    effectOutBuffer.width    = CGBitmapContextGetWidth(effectOutContext);
    effectOutBuffer.height   = CGBitmapContextGetHeight(effectOutContext);
    effectOutBuffer.rowBytes = CGBitmapContextGetBytesPerRow(effectOutContext);
    
    BOOL hasBlur = blurRadius > __FLT_EPSILON__;
    
    if (hasBlur) {
        CGFloat inputRadius = blurRadius * [[UIScreen mainScreen] scale];
        uint32_t radius = floor(inputRadius * 3. * sqrt(2 * M_PI) / 4 + 0.5);
        if (radius % 2 != 1) {
            radius += 1; // force radius to be odd so that the three box-blur methodology works.
        }
        vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
        vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, NULL, 0, 0, radius, radius, 0, kvImageEdgeExtend);
    }
    
    UIImage *returnImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    
    return returnImage;
}

- (UIImage *)scalImageWithSize:(CGSize)size
{
    CGSize newSize = CGSizeMake(self.size.width * self.scale, self.size.height * self.scale);
    
    CGFloat Y = 0;
    CGFloat height = size.height * [UIScreen mainScreen].scale;
    if (newSize.height - height > 0) {
        Y = (newSize.height - height)/2.0;
    }
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 1.0);
    
    [self drawInRect:CGRectMake(0, 0, newSize.width,height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
