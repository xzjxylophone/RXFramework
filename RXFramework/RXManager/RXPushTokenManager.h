//
//  RXPushTokenManager.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXPushTokenManager : NSObject


- (NSString *)pushTokenFromData:(NSData *)data;

// 保存是否上传
- (void)saveIsUploadPushToken:(BOOL)value;

// 保存token
- (void)savePushToken:(NSString *)pushToken;
- (NSString *)lastPushToken;

// 用户退出时需要用到
- (void)cleanInfo;


- (NSData *)lastPushTokenData;
- (void)savePushTokenData:(NSData *)pushToken;

// 是否需要重新上传pushToken
- (BOOL)needToUpdateWithPushToken:(NSString *)pushToken;


#pragma mark - Signal Mode
+ (RXPushTokenManager *)sharedInstance;
+ (void)releaseInstance;
@end
