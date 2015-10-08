//
//  UINavigationController+RXSDK.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (RXSDK)
- (BOOL)rx_openString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate;


- (BOOL)rx_presentString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate completion:(void (^)(void))completion;


@end
