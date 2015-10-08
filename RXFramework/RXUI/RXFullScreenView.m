//
//  RXFullScreenView.m
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/25.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXFullScreenView.h"


@interface RXFullScreenView ()


@end

@implementation RXFullScreenView


- (void)tgrAction:(id)sender
{
    [self close];
}

#pragma mark - 
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self tmpInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        
        [self tmpInit];
    }
    return self;
}
- (void)tmpInit
{
    [self rx_addGestureRecognizerWithTarget:self action:@selector(tgrAction:)];
}
#pragma mark - Public
- (void)close
{
    [self removeFromSuperview];
}
- (void)showInView:(UIView *)view
{
    [view addSubview:self];
}
- (void)showInCurWindow
{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [self showInView:window];
}

@end
