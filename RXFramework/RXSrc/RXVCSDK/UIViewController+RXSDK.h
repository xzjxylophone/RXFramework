//
//  UIViewController+RXSDK.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>








@interface UIViewController (SDK)

@property (nonatomic, copy) NSString *rx_string;
@property (nonatomic, strong) NSDictionary *rx_params;
@property (nonatomic, strong) NSDictionary *rx_query;
@property (nonatomic, strong) NSURL *rx_url;


// 当状态栏是显示的情况下
@property (nonatomic, readonly) CGFloat rx_viewRealHeight;


#pragma mark - Public


- (void)rx_tapAnywhereToDismissKeyboard;


#pragma mark - 工厂方法创建VC
+ (id)rx_vcWithString:(NSString *)string;
+ (id)rx_vcWithString:(NSString *)string query:(NSDictionary *)query;


@end
