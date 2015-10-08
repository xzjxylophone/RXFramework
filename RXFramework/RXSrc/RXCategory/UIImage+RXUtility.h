//
//  UIImage+RXUtility.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RXUtility)
- (UIImage *)scaleToSize:(CGSize)newSize;
//翻转UIImage
- (UIImage *)rotateWithimageOrientation:(UIImageOrientation)imageOrientation;

//根据color得到图片
+ (UIImage *)createImageWithColor:(UIColor *)color;

@end
