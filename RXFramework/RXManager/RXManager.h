//
//  RXManager.h
//  KC
//
//  Created by Rush.D.Xzj on 15/9/1.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>



// 关闭引导页时候的通知
#define NKey_RX_CloseStartGuide      @"NKey_RX_CloseStartGuide"




@class RXManager;
@protocol RXManagerDelegate <NSObject>

@optional
// 在引导页的开始按钮
- (UIButton *)startBtnInGuideVC;

@end






@interface RXManager : NSObject


#pragma mark - URL Types
+ (NSString *)stringTenPaySourceApplication;
+ (NSString *)stringAlixPaySourceApplication;
+ (NSString *)stringAlixPaySourceApplication2;
+ (NSString *)stringTenURLScheme;
+ (NSString *)stringAlixURLScheme;
+ (NSString *)stringTencentURLScheme;
+ (NSString *)stringWeiXinURLScheme;
+ (NSString *)stringSinaURLScheme;

#pragma mark - app version
- (NSString *)appVersion;
- (NSString *)appBuild;



#pragma mark - Safe Data

+ (NSDictionary *)safeDictonaryFromData:(id)data;
+ (NSNumber *)safeNumberFromData:(id)data;
+ (NSString *)safeStringFromData:(id)data;
+ (NSArray *)safeArrayFromData:(id)data;


#pragma mark - Layout Constraint
+ (void)fillTopInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom;
+ (void)fillAllInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillVMiddleHSameInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillVMidInSuperView:(UIView *)superview subView:(UIView *)subView top:(CGFloat)top;
+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top;
+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top width:(CGFloat) width right:(CGFloat)right;

#pragma mark - Guide
// 是否显示过引导页了, key值是version+build
- (BOOL)firstStartGuideValue;
- (void)setFirstStartGuideValue:(BOOL)value;
- (void)addActionToStartBtn:(UIButton *)btn;




@property (nonatomic, weak) id<RXManagerDelegate> delegate;



#pragma mark - Singleton Model
+ (RXManager *)sharedInstance;
@end
