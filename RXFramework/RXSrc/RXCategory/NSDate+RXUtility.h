//
//  NSDate+RXUtility.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RXUtility)
- (NSInteger)daysSinceDate:(NSDate *)date;

// 年月日比较
- (BOOL)rx_isEqualWithYearMonthDayWithDate:(NSDate *)date;


// 星期一是0, 星期二是1, 星期日是6
- (NSInteger)rx_weekdayIndex;
+ (NSString *)rx_weekdayStringWithWeek:(NSInteger)week;

@end
