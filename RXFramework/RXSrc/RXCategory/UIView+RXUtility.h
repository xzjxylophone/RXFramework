//
//  UIView+RXUtility.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RXUtility)


@property (nonatomic, retain) id rx_data;


@property (nonatomic, readwrite) CGFloat rx_left;
@property (nonatomic, readwrite) CGFloat rx_top;
@property (nonatomic, readwrite) CGFloat rx_right;
@property (nonatomic, readwrite) CGFloat rx_bottom;
@property (nonatomic, readwrite) CGFloat rx_centerX;
@property (nonatomic, readwrite) CGFloat rx_centerY;
@property (nonatomic, readwrite) CGFloat rx_width;
@property (nonatomic, readwrite) CGFloat rx_height;
@property (nonatomic, readwrite) CGPoint rx_origin;
@property (nonatomic, readwrite) CGSize rx_size;


@property (nonatomic, strong) UITapGestureRecognizer *rx_tgr;

// 使整个UIView 变成圆形,  当且只有width = height 的时候才是圆形
- (void)rx_makeRound;

- (void)rx_makeRoundWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii;

// 是UIView 左右变成半圆形
- (void)rx_makeLeftRightRound;

- (void)rx_removeAllSubviews;
- (UIImage *)rx_imageFromView;
- (UIImage *)rx_imageByRenderingView;

- (id)rx_clsViewFromCls:(Class)cls;

- (UIViewController *)rx_viewController;

- (void)rx_addGestureRecognizerWithTarget:(id)target action:(SEL)action;
- (void)rx_removeGestureRecognizer;


- (void)rx_addAppDidEnterBgNotification;
- (void)rx_removeAppDidEnterBgNotification;


@end
