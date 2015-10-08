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






#pragma mark - Date Fromat

+ (NSString *)dateStringFromDate:(NSDate *)date format:(RXDateFormat)format;


+ (NSDate *)dateFromMilliSecond:(long long)milliSecond;
+ (NSDate *)dateFromSecond:(long long)second;

#pragma mark - friend path



@end
