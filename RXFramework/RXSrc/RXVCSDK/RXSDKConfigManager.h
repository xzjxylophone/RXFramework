//
//  RXSDKConfigManager.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RXSDKConfigManager;

@protocol RXSDKConfigManagerDelegate <NSObject>

@optional
- (NSString *)customWebVCNameInRXSDKConfigManager:(RXSDKConfigManager *)cm;

@end



@interface RXSDKConfigManager : NSObject





@property (nonatomic, weak) id<RXSDKConfigManagerDelegate> delegate;


@property (nonatomic, readonly) NSString *webVCString;





#pragma mark - Signal Mode
+ (RXSDKConfigManager *)sharedInstance;
+ (void)releaseInstance;

@end
