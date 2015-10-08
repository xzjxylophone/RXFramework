//
//  RXUtils.h
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-7.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum RXDateFormat {
    kRXDateFormatAllFormat1     =       100,      // yyyy年MM月dd日 HH时mm分
    kRXDateFormatAllFormat2     =       101,      // yyyy.MM.dd HH:mm
    kRXDateFormatFormat1     =       200,      // HH:mm
    kRXDateFormatFormat2     =       201,      // M月d日
    kRXDateFormatDate           =       300,      // yyyy-MM-dd
    kRXDateFormatDate2          =  301, // yyyy年MM月dd日
    kRXDateFormatDate3          =  302, // yyyyMMdd
    kRXDateFormatDate4          =  304, // yyyyMM
    kRXDateFormatDate5          =  305, // M月yyyy年
    kRXDateFormatDate6          =  306, // yyyyMMddHHmm
    kRXDateFormatDate7          =  307, // yyyy.M.d HH:mm
    kRXDateFormatDate8          =  308, // yyyy.MM.dd
    kRXDateFormatDate9          =  309, // yyyy年M月d日
    kRXDateFormatDate10          =  310, // yyyy年M月
}RXDateFormat;

@interface RXUtils : NSObject
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title;
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName;
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName;
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title backgroundImageName:(NSString *)backgroundImageName;


+ (void)drawFrameInView:(UIView *)view top:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;
+ (void)drawFrameInView:(UIView *)view frame:(CGRect)frame;
+ (void)drawLineInView:(UIView *)view frames:(NSArray *)frames;
+ (void)drawLineInView:(UIView *)view top:(CGFloat)top bottom:(CGFloat)bottom;
+ (void)drawLineInView:(UIView *)view left:(CGFloat)left right:(CGFloat)right;


+ (void)iOS6GroupedTableView:(UITableView *)tableView cell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

+ (NSString *)timeFormatted:(int)totalSeconds;
+ (NSString *)timeFormatted2:(int)totalSeconds;


#pragma mark - Layout Constraint
+ (void)fillTopInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillBottomInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom;
+ (void)fillAllInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillVMiddleHSameInSuperView:(UIView *)superview subView:(UIView *)subView;
+ (void)fillVMidInSuperView:(UIView *)superview subView:(UIView *)subView top:(CGFloat)top;
+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top;
+ (void)fillInSuperView:(UIView *)superview subView:(UIView *)subView bottom:(CGFloat)bottom top:(CGFloat)top width:(CGFloat) width right:(CGFloat)right;


+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;


#pragma mark - Analysis
+ (NSDictionary *)dictonaryFromDictionary:(NSDictionary *)dic key:(NSString *)key;
+ (NSNumber *)numberFromDictionary:(NSDictionary *)dic key:(NSString *)key;
+ (NSString *)stringFromDictionary:(NSDictionary *)dic key:(NSString *)key;
+ (NSArray *)arrayFromDictionary:(NSDictionary *)dic key:(NSString *)key;

+ (NSDictionary *)dictonaryFromData:(id)data;
+ (NSNumber *)numberFromData:(id)data;
+ (NSString *)stringFromData:(id)data;
+ (NSArray *)arrayFromData:(id)data;


+ (NSString *)moneyStringWithDouble:(double)money;
+ (NSString *)percentWithDouble:(double)percent;



#pragma mark - Tool
+ (NSString*)getAppVersion;
+ (NSString *)getSystemVersion;
+ (NSString *)getSystemLanguage;
+ (CGFloat)screenWidth;


#pragma mark - Date Fromat

+ (NSString *)dateStringFromDate:(NSDate *)date format:(RXDateFormat)format;


+ (NSDate *)dateFromMilliSecond:(long long)milliSecond;
+ (NSDate *)dateFromSecond:(long long)second;

#pragma mark - friend path
+ (NSString *)getFriendsInfoPath;
+ (NSString *)transformToPinyinWithString:(NSString *)str;


@end
