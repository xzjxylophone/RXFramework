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


#pragma mark - info.plist

+ (void)testInfoPlist
{
    
    // https://developer.apple.com/library/mac/documentation/General/Reference/InfoPlistKeyReference/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009248-SW1
    
    // info.plist key introduction
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];

    NSLog(@"plistDic:%@", plistDic);
}


+ (NSString *)appVersion
{
    
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *result = plistDic[@"CFBundleShortVersionString"];
    return result;
    
}
+ (NSString *)appBuild
{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *result = plistDic[@"CFBundleVersion"];
    return result;
}

+ (NSString *)appBundleIdentifier
{
    NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
    NSString *result = plistDic[@"CFBundleIdentifier"];
    return result;
}

#pragma mark - Device Info
+ (void)testDeviceInfo
{
//    UIDevice *device = [UIDevice currentDevice];
    
    
}







#pragma mark - Safe Data

+ (NSDictionary *)safeDictonaryFromData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]]) {
        return data;
    } else {
        return [NSDictionary new];
    }
}
+ (NSNumber *)safeNumberFromData:(id)data
{
    if ([data isKindOfClass:[NSNumber class]]) {
        return data;
    } else {
        if ([data respondsToSelector:@selector(doubleValue)]) {
            double dValue = [data doubleValue];
            return [NSNumber numberWithDouble:dValue];
        } else {
            return @(0);
        }
    }
}

+ (NSString *)safeStringFromData:(id)data
{
    if ([data isKindOfClass:[NSString class]]) {
        return data;
    } else if ([data isKindOfClass:[NSNull class]]) {
        return @"";
    } else {
        return [NSString stringWithFormat:@"%@", data];
    }
}

+ (NSArray *)safeArrayFromData:(id)data
{
    if ([data isKindOfClass:[NSArray class]]) {
        return data;
    } else {
        return [NSArray new];
    }
}


#pragma mark - Layout Constraint
+ (void)fillTopInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    [superview addConstraints:@[lc1, lc2, lc3]];
    [subView addConstraint:lc4];
}

+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    [superview addConstraints:@[lc1, lc2, lc3, lc4]];
}

+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top width:(CGFloat)width right:(CGFloat)right
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1 constant:width];
    
    
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:bottom];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:right];
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    [subView addConstraint:lc1];
    [superview addConstraints:@[lc2, lc3, lc4]];
}

+ (void)fillAllInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    [superview addConstraints:@[lc1, lc2, lc3, lc4]];
}


// 垂直居中, 水平左右相距10像素
+ (void)fillVMiddleHSameInSuperView:(UIView *)superview subView:(UIView *)subView
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:-10];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:10];
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    
    // 垂直居中
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    
    [subView addConstraint:lc4];
    
    [superview addConstraints:@[lc1, lc2, lc3]];
}

+ (void)fillVMidInSuperView:(UIView *)superview subView:(UIView *)subView top:(CGFloat)top
{
    [subView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *lc1 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *lc3 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    
    NSLayoutConstraint *lc4 = [NSLayoutConstraint constraintWithItem:superview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:subView attribute:NSLayoutAttributeTop multiplier:1 constant:-top];
    
    
    
    
    NSLayoutConstraint *lc2 = [NSLayoutConstraint constraintWithItem:subView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1 constant:subView.frame.size.height];
    
    [subView addConstraint:lc2];
    
    [superview addConstraints:@[lc1, lc3, lc4]];
}










#pragma mark - Guide
- (NSString *)startGuideKey
{
    NSString *key = [NSString stringWithFormat:@"%@%@", [RXManager appVersion], [RXManager appBuild]];
    return key;
}
- (BOOL)firstStartGuideValue
{
    NSString *key = [self startGuideKey];
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
    NSString *key = [self startGuideKey];
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
