//
//  RXCTView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCTView.h"
#import "RXCTImageData.h"
#import "RXCTLinkData.h"
#import "RXCTImageFrame.h"

@implementation RXCTView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 将坐标系上下翻转。对于底层的绘制引擎来说，屏幕的左下角是（0, 0）坐标。而对于上层的 UIKit 来说，左上角是 (0, 0) 坐标。所以我们为了之后的坐标系描述按 UIKit 来做，所以先在这里做一个坐标系的上下翻转操作。翻转之后，底层和上层的 (0, 0) 坐标就是重合的了。
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    if (self.rxctFrameData) {
        CTFrameDraw(self.rxctFrameData.frameRef, context);
    }
    
    
    for (RXCTImageFrame *imageFrame in self.rxctFrameData.imageAry) {
        UIImage *image = [UIImage imageNamed:imageFrame.imageName];
        if (image) {
            CGContextDrawImage(context, imageFrame.imagePosition, image.CGImage);
        }
    }
    
}


@end
