//
//  RXPushTokenManager.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

/*
 
 PushToken 管理
 
 
 */


#import <Foundation/Foundation.h>

@interface RXPushTokenManager : NSObject

// TODD:
// 还有各种错误的实现

+ (NSString *)pushTokenFromData:(NSData *)data;

// 保存是否上传
+ (void)saveIsUploadPushToken:(BOOL)value;

// 保存token
+ (void)savePushToken:(NSString *)pushToken;
+ (NSString *)lastPushToken;

// 用户退出时需要用到
+ (void)cleanInfo;



// 是否需要重新上传pushToken
+ (BOOL)needToUpdateWithPushToken:(NSString *)pushToken;



@end
