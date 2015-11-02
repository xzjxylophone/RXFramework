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
            break;
        }
    }
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
