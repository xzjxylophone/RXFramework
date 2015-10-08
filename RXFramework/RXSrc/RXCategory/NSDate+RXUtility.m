//
//  NSDate+RXUtility.m
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "NSDate+RXUtility.h"

@implementation NSDate (RXUtility)
- (NSInteger)daysSinceDate:(NSDate *)date
{
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:date];
    
    return timeInterval / 3600. / 24.;
}

- (BOOL)rx_isEqualWithYearMonthDayWithDate:(NSDate *)date
{
    return self.year == date.year && self.month == date.month && self.day == date.day;
}

- (NSInteger)rx_weekdayIndex
{
    NSInteger weekday = self.weekday;
    NSInteger result = weekday - 2;
    if (result < 0) {
        return 6;
    } else {
        return result;
    }
}


+ (NSString *)rx_weekdayStringWithWeek:(NSInteger)week
{
    NSString *result = @"";
    switch (week) {
        case 0:
            result = @"周一";
            break;
        case 1:
            result = @"周二";
            break;
        case 2:
            result = @"周三";
            break;
        case 3:
            result = @"周四";
            break;
        case 4:
            result = @"周五";
            break;
        case 5:
            result = @"周六";
            break;
        case 6:
        default:
            result = @"周日";
            break;
    }
    return result;
}

@end
