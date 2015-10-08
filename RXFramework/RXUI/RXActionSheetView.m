//
//  RXActionSheetView.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/9/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXActionSheetView.h"

@implementation RXActionSheetView

- (void)vBgAction:(id)sender
{
    [self close];
}

- (void)setIsSupportClickOtherToClose:(BOOL)isSupportClickOtherToClose
{
    _isSupportClickOtherToClose = isSupportClickOtherToClose;
    if (isSupportClickOtherToClose) {
        [self.vBg rx_addGestureRecognizerWithTarget:self action:@selector(vBgAction:)];
    } else {
        [self.vBg rx_removeGestureRecognizer];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.vBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, [UIScreen mainScreen].bounds.size.height)];
        self.vBg.backgroundColor = [UIColorFromRGB(0xb3b3b3) colorWithAlphaComponent:0.5];
        self.isSupportClickOtherToClose = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



- (CGFloat)showY
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    return (height - self.height) / 2.0f;
}


- (void)show
{
    [self.vBg addSubview:self];
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.vBg];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat selfY = self.showY;
    self.top = height;
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"abc" context:nil];
        [UIView setAnimationDuration:0.5];
    }
    self.top = selfY;
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
    }
    
}
- (void)close
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    if (self.isSupportAnimate) {
        [UIView beginAnimations:@"stop" context:nil];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:)];
    } else {
        [self.vBg removeFromSuperview];
        [self removeFromSuperview];
    }
    self.top = height;
    if (self.isSupportAnimate) {
        [UIView commitAnimations];
    }
    
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    
    [self.vBg removeFromSuperview];
    [self removeFromSuperview];
}


+ (id)rxActionSheetView
{
    Class cls = [self class];
    id result = [[cls alloc] initWithFrame:CGRectZero];
    return result;
}

@end
