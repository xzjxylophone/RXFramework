//
//  RXUtils.m
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-7.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import "RXUtils.h"

@implementation RXUtils


+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName
{
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_h", imageName];
    return [self rxBarButtonItemWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
}
+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    UIButton *btn = [self buttonWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title backgroundImageName:(NSString *)backgroundImageName
{
    UIFont *font = [UIFont boldSystemFontOfSize:17];
    UIImage *image = [UIImage imageNamed:backgroundImageName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 7, image.size.width, image.size.height);
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.titleLabel.textColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

+ (UIBarButtonItem *)rxBarButtonItemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIFont *font = [UIFont boldSystemFontOfSize:17];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
//    NSDictionary *dic = @{NSFontAttributeName:font};
//    CGSize size = [title sizeWithAttributes:dic];
    
    btn.frame = CGRectMake(0, 7, 80, 20);
    btn.titleLabel.font = font;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName
{
    NSString *highlightedImageName = [NSString stringWithFormat:@"%@_h", imageName];
    return [self buttonWithTarget:target action:action imageName:imageName highlightedImageName:highlightedImageName];
}
+ (UIButton *)buttonWithTarget:(id)target action:(SEL)action imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}























#pragma mark - Analysis



#pragma mark - Tool



#pragma mark - Date Fromat

+ (NSString *)dateStringFromDate:(NSDate *)date format:(RXDateFormat)format
{
    NSString *formatStr = @"";
    switch (format) {
        case kRXDateFormatAllFormat1:
            formatStr = @"yyyy年MM月dd日 HH时mm分";
            break;
        case kRXDateFormatAllFormat2:
            formatStr = @"yyyy.MM.dd HH:mm";
            break;
        case kRXDateFormatDate:
            formatStr = @"yyyy-MM-dd";
            break;
        case kRXDateFormatDate2:
            formatStr = @"yyyy年MM月dd日";
            break;
        case kRXDateFormatFormat1:
            formatStr = @"HH:mm";
            break;
        case kRXDateFormatFormat2:
            formatStr = @"M月d日";
            break;
        case kRXDateFormatDate3:
            formatStr = @"yyyyMMdd";
            break;
        case kRXDateFormatDate4:
            formatStr = @"yyyyMM";
            break;
        case kRXDateFormatDate5:
            formatStr = @"M月yyyy年";
            break;
        case kRXDateFormatDate6:
            formatStr = @"yyyyMMddHHmm";
            break;
        case kRXDateFormatDate7:
            formatStr = @"yyyy.M.d HH:mm";
            break;
        case kRXDateFormatDate8:
            formatStr = @"yyyy.MM.dd";
            break;
        case kRXDateFormatDate9:
            formatStr = @"yyyy年M月d日";
            break;
        case  kRXDateFormatDate10:
            formatStr = @"yyyy年M月";
            break;
        default:
            formatStr = @"yyyy年MM月dd日 hh时mm分ss秒";
            break;
    }
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setDateFormat:formatStr];
    NSString *result = [formatter stringFromDate:date];
    return result;
}


+ (NSDate *)dateFromMilliSecond:(long long)milliSecond
{
    return [self dateFromSecond:milliSecond / 1000];
}
+ (NSDate *)dateFromSecond:(long long)second
{
    return [NSDate dateWithTimeIntervalSince1970:second];
}



@end
