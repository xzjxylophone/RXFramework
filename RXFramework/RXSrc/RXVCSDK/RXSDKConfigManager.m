//
//  RXSDKConfigManager.m
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXSDKConfigManager.h"
#import "UIRXSDKWebViewController.h"

@implementation RXSDKConfigManager
#pragma mark - Property
- (NSString *)webVCString
{
    return [self safeDelegate_customWebVCNameInRXSDKConfigManager:self];
}

#pragma mark - Safe Delegate
- (NSString *)safeDelegate_customWebVCNameInRXSDKConfigManager:(RXSDKConfigManager *)cm
{
    if ([self.delegate respondsToSelector:@selector(customWebVCNameInRXSDKConfigManager:)]) {
        return [self.delegate customWebVCNameInRXSDKConfigManager:cm];
    }
    return NSStringFromClass([UIRXSDKWebViewController class]);
}


#pragma mark - Singal Instance
static RXSDKConfigManager *sharedInstance = nil;
#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - Singleton Model

+ (RXSDKConfigManager *)sharedInstance
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
