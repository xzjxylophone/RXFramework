//
//  RXDisplayView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXDisplayView.h"
#import "RXCoreTextData.h"
#import "RXCoreTextImageData.h"
#import "RXCoreTextLinkData.h"

@interface RXDisplayView () <UIGestureRecognizerDelegate>

@end


@implementation RXDisplayView

#pragma mark - UIGestureRecognizerDelegate


#pragma mark - Action
- (void)tgrAction:(id)sender
{
    UITapGestureRecognizer *tgr = sender;
    CGPoint point = [tgr locationInView:self];
    for (RXCoreTextImageData *imageData in self.data.imageAry) {
        // 翻转坐标系, 因为 imageData 中的坐标是CoreText的坐标系
        CGRect imageRect = imageData.imagePosition;
        CGPoint imagePosition = imageRect.origin;
        imagePosition.y = self.bounds.size.height - imageRect.origin.y - imageRect.size.height;
        CGRect rect = CGRectMake(imagePosition.x, imagePosition.y, imageRect.size.width, imageRect.size.height);
        if (CGRectContainsPoint(rect, point)) {
            NSLog(@"click");
            return;
        }
    }
    
    
    
    CTFrameRef frameRef = self.data.frameRef;
    CFArrayRef lines = CTFrameGetLines(frameRef);
    if (lines == NULL) {
        return;
    }
    
    CFIndex count = CFArrayGetCount(lines);
    
    // 获得每一行的origin坐标
    CGPoint origins[count];
    CTFrameGetLineOrigins(frameRef, CFRangeMake(0, 0), origins);
    
    // 翻转坐标系
    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, self.bounds.size.height);
    transform = CGAffineTransformScale(transform, 1.0f, -1.0f);
    
    CFIndex idx = -1;
    for (int i = 0; i < count; i++) {
        CGPoint linePoint = origins[i];
        CTLineRef lineRef = CFArrayGetValueAtIndex(lines, i);
        // 获取每一行的CGRect信息
        CGFloat ascent = 0.0f;
        CGFloat descent = 0.0f;
        CGFloat leading = 0.0f;
        CGFloat width = (CGFloat)CTLineGetTypographicBounds(lineRef, &ascent, &descent, &leading);
        CGFloat height = ascent + descent;
        CGRect flippedRect = CGRectMake(linePoint.x, linePoint.y, width, height);
        CGRect rect = CGRectApplyAffineTransform(flippedRect, transform);
        
        if (CGRectContainsPoint(rect, point)) {
            // 将点击的坐标转换成相对于当前行的坐标
            CGPoint relativePoint = CGPointMake(point.x - CGRectGetMinX(rect), point.y - CGRectGetMinY(rect));
            // 获得当前点击坐标对应的字符串偏移
            idx = CTLineGetStringIndexForPosition(lineRef, relativePoint);
        }
    }
    
    if (idx == -1) {
        NSLog(@"你没有点击任何文字区域");
        return;
    }
    
    RXCoreTextLinkData *foundLink = nil;
    for (RXCoreTextLinkData *linkData in self.data.linkAry) {
        NSLog(@"idx:%zd, range:%@", idx, NSStringFromRange(linkData.range));
        if (NSLocationInRange(idx, linkData.range)) {
            foundLink = linkData;
            break;
        }
    }

    if (foundLink == nil) {
        NSLog(@"没有点击到可连接区域文字");
        return;
    }
    
    NSLog(@"click:kkkkkkkk");
}
- (void)initialize
{
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tgrAction:)];
    tgr.delegate = self;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tgr];
}


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
    
    if (self.data) {
        CTFrameDraw(self.data.frameRef, context);
    }
    
    
    for (RXCoreTextImageData *imageData in self.data.imageAry) {
        UIImage *image = [UIImage imageNamed:imageData.name];
        if (image) {
            CGContextDrawImage(context, imageData.imagePosition, image.CGImage);
        }
    }
    
    
}


#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initialize];
    }
    return self;
}
@end
