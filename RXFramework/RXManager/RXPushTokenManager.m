//
//  RXPushTokenManager.m
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPushTokenManager.h"
#define UDKey_RX_PushToken        @"UDKey_RX_PushToken"
#define UDKey_RX_IsUploadPushToken        @"UDKey_RX_IsUploadPushToken"


@implementation RXPushTokenManager

+ (NSString *)pushTokenFromData:(NSData *)data
{
    NSString *result = [NSString stringWithFormat:@"%@", data];
    result = [[result stringByReplacingOccurrencesOfString:@"<" withString:@""] stringByReplacingOccurrencesOfString:@">" withString:@""];
    result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
    return result;
}
+ (BOOL)isUploadPushToken
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id value = [ud valueForKey:UDKey_RX_IsUploadPushToken];
    if (value == nil) {
        return NO;
    } else {
        return [value boolValue];
    }
}

+ (void)cleanInfo
{
    [self saveIsUploadPushToken:NO];
}
+ (void)saveIsUploadPushToken:(BOOL)value
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:@(value) forKey:UDKey_RX_IsUploadPushToken];
    [ud synchronize];
}

+ (NSString *)lastPushToken
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id value = [ud valueForKey:UDKey_RX_PushToken];
    if (value == nil) {
        return @"";
    } else {
        return value;
    }
}
+ (void)savePushToken:(NSString *)pushToken
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:pushToken forKey:UDKey_RX_PushToken];
    [ud synchronize];
}


+ (BOOL)needToUpdateWithPushToken:(NSString *)pushToken
{
    NSString *lastPushToken = [self lastPushToken];
    if (![lastPushToken isEqualToString:pushToken]) {
        return YES;
    }
    
    BOOL isUpload = [self isUploadPushToken];
    if (isUpload) {
        return NO;
    } else {
        return YES;
    }
    
}







#pragma mark - Singal Instance
static RXPushTokenManager *sharedInstance = nil;
#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)dealloc
{
}

#pragma mark - Singleton Model

+ (RXPushTokenManager *)sharedInstance
{
    @synchronized(self) {
        if(sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

+ (void)releaseInstance
{
    sharedInstance = nil;
}

+ (id)allocWithZone:(NSZone *)zone
{
    @synchronized(self) {
        if(sharedInstance == nil) {
            sharedInstance = [super allocWithZone:zone];
            return sharedInstance;
        }
    }
    return sharedInstance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return self;
}
@end
