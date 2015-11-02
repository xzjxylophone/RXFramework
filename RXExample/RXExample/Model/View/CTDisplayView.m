//
//  CTDisplayView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "CTDisplayView.h"
#import <CoreText/CoreText.h>
@implementation CTDisplayView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor redColor];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    [super drawRect:rect];
    
    
    // 步骤 1
    // 得到当前绘制画布的上下文，用于后续将内容绘制在画布上。
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 步骤 2
    // 将坐标系上下翻转。对于底层的绘制引擎来说，屏幕的左下角是（0, 0）坐标。而对于上层的 UIKit 来说，左上角是 (0, 0) 坐标。所以我们为了之后的坐标系描述按 UIKit 来做，所以先在这里做一个坐标系的上下翻转操作。翻转之后，底层和上层的 (0, 0) 坐标就是重合的了。
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 步骤 3
    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
    
    
    CGPathAddEllipseInRect(path, NULL, self.bounds);
    
    // 步骤 4
//    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World!"];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:@"Hello World! "
                                     " 创建绘制的区域，CoreText 本身支持各种文字排版的区域，"
                                     " 我们这里简单地将 UIView 的整个界面作为排版的区域。"
                                     " 为了加深理解，建议读者将该步骤的代码替换成如下代码，"
                                     " 测试设置不同的绘制区域带来的界面变化。"];
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    // 步骤 5
    CTFrameDraw(frame, context);
    
    // 步骤 6
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
    
    
}



@end
