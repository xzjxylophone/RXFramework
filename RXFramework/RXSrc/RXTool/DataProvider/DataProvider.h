//
//  DataProvider.h
//  Wanhui
//
//  Created by Rush.D.Xzj on 13-9-13.
//  Copyright (c) 2013年 Wanda Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "MagicalRecord.h"


#pragma mark - CoreData Experir Time
#define CDExpiredTime_OneHour       (1 * 60 * 60)      // 一小时
#define CDExpiredTime_ThreeMinute   (3 * 60)           // 三分钟
#define CDExpiredTime_OneMinute     (1 * 60)           // 三分钟
#define CDExpiredTime_FiveSeconds   (5)                // 5秒钟
#define CDExpiredTime_ZeroSeconds   (0)                // 表示没有过期时间


typedef enum DataProviderStatus {
    kDataProviderInit               =               0,
    kDataProviderLoading            =               1,
    kDataProviderLoadSuccess        =               2,
    kDataProviderLoadFailed         =               3,
    kDataProviderLoadingMore        =               4,
}DataProviderStatus;


@class DataProvider;


typedef void (^DataProviderBlock)(DataProvider *dp);


@protocol DataProviderDelegate <NSObject>

@optional
- (void)querySuccessed:(DataProvider *)dp;
- (void)netRequestBegin:(DataProvider *)dp;
- (void)netFinishedFailed:(DataProvider *)dp;
- (void)netRequestFailed:(DataProvider *)dp error:(NSError *)error;


@end

@interface DataProvider : NSObject


@property (nonatomic, readonly) BOOL haveDatas;
@property (nonatomic, readonly) DataProviderStatus currentStatus;



@property (nonatomic, strong) NSArray *allDatas;
@property (nonatomic, weak) id<DataProviderDelegate> delegate;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong) NSMutableDictionary *params;

@property (nonatomic, readonly) int onePageNum;

- (BOOL)needToRefreshWhenQuery;


- (void)query;
- (void)refresh;
- (void)loadMore;



+ (NSNumber *)currentTime;
- (void)updateAllDatas;
- (void)clearOldData;






#pragma mark - Safe Delegate
- (void)safeDelegate_QuerySuccessed:(DataProvider *)dp;
- (void)safeDelegate_NetRequestBegin:(DataProvider *)dp;
- (void)safeDelegate_NetFinishedFailed:(DataProvider *)dp;
- (void)safeDelegate_NetRequestFailed:(DataProvider *)dp error:(NSError *)error;


#pragma mark - Constructor And Destructor
- (id)initWithDelegate:(id<DataProviderDelegate>)delegate;
@end
