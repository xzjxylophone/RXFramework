//
//  RXManager.m
//  KC
//
//  Created by Rush.D.Xzj on 15/9/1.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXManager.h"

@implementation RXManager

#pragma mark - Private
- (void)startGuideAction:(id)sender
{
    [self setFirstStartGuideValue:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:NKey_RX_CloseStartGuide object:nil];
    
}


#pragma mark - URLScheme From Plist
+ (NSString *)stringURLSchemeWithKeyword:(NSString *)keyworkd
{
    NSArray *ary = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"];
    for (NSDictionary *dic in ary) {
        NSString *urlName = [dic objectForKey:@"CFBundleURLName"];
        if ([urlName isEqualToString:keyworkd]) {
            NSArray *schemes = [dic objectForKey:@"CFBundleURLSchemes"];
            for (NSString *scheme in schemes) {
                if (scheme.length > 0) {
                    return scheme;
                }
            }
        }
    }
    return @"";
}

#pragma mark - URL Types
+ (NSString *)stringTenPaySourceApplication
{
    return @"com.tenpay.mobile.iphone";
}
+ (NSString *)stringAlixPaySourceApplication
{
    return @"com.alipay.safepayclient";
}
+ (NSString *)stringAlixPaySourceApplication2
{
    return @"com.alipay.iphoneclient";
}
+ (NSString *)stringTenURLScheme
{
    return [RXManager stringURLSchemeWithKeyword:@"ten"];
}
+ (NSString *)stringAlixURLScheme
{
    return [RXManager stringURLSchemeWithKeyword:@"alix"];
}
+ (NSString *)stringTencentURLScheme
{
    return [RXManager stringURLSchemeWithKeyword:@"tencent"];
}
+ (NSString *)stringWeiXinURLScheme
{
    return [RXManager stringURLSchemeWithKeyword:@"weixin"];
}
+ (NSString *)stringSinaURLScheme
{
    return [RXManager stringURLSchemeWithKeyword:@"sina"];
}


#pragma mark - app version
- (NSString *)appVersion
{
    
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *result = plistDic[@"CFBundleShortVersionString"];
    return result;
    
}
- (NSString *)appBuild
{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *result = plistDic[@"CFBundleVersion"];
    return result;
}

#pragma mark - Device Info
+ (void)printDeviceInfo
{
//    UIDevice *device = [UIDevice currentDevice];
    
    
}


#pragma mark - Guide
- (BOOL)firstStartGuideValue
{
    NSString *key = [NSString stringWithFormat:@"%@%@", [self appVersion], [self appBuild]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id value = [ud objectForKey:key];
    if (value == nil) {
        return NO;
    } else {
        return [value boolValue];
    }
}
- (void)setFirstStartGuideValue:(BOOL)value
{
    NSString *key = [NSString stringWithFormat:@"%@%@", [self appVersion], [self appBuild]];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@(value) forKey:key];
    [ud synchronize];
}


- (void)addActionToStartBtn:(UIButton *)btn
{
    [btn addTarget:self action:@selector(startGuideAction:) forControlEvents:UIControlEventTouchUpInside];
}


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

+ (RXManager *)sharedInstance
{
    static RXManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
