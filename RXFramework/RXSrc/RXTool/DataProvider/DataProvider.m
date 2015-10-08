//
//  DataProvider.m
//  Wanhui
//
//  Created by Rush.D.Xzj on 13-9-13.
//  Copyright (c) 2013年 Wanda Inc. All rights reserved.
//

#import "DataProvider.h"
#include <mach/mach_time.h>

@interface DataProvider ()
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, assign) DataProviderStatus internalStatus;


@end


@implementation DataProvider

#pragma mark - ReadOnly
- (DataProviderStatus)currentStatus
{
    return self.internalStatus;
}
- (BOOL)haveDatas
{
    return self.allDatas.count > 0;
}
- (int)onePageNum
{
    return 20;
}
#pragma mark - NeedToOverride
- (NSString *)entityName
{
    return @"";
}
- (double)expiredTime
{
    return 0.0f;
}
- (NSFetchedResultsController *)customFetchedResultsController
{
    Class cls = NSClassFromString(self.entityName);
    NSFetchedResultsController *frc = [cls MR_fetchAllSortedBy:@"updatetime" ascending:YES withPredicate:nil groupBy:nil delegate:nil];
    return frc;
}


#pragma mark - Private
// 删除过期数据
- (void)clearExpirdData
{
    Class cls = NSClassFromString(self.entityName);
    NSArray *all = [cls MR_findAllSortedBy:@"updatetime" ascending:YES];
    if (all.count > 3000) {
        for (int i = 0; i < all.count - 75; i++) {
            NSManagedObject *mo = [all objectAtIndex:i];
            [mo MR_deleteEntity];
        }
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfAndWait];
}

#pragma mark - Safe Delegate
- (void)safeDelegate_QuerySuccessed:(DataProvider *)dp
{
    self.internalStatus = kDataProviderLoadSuccess;
    if ([self.delegate respondsToSelector:@selector(querySuccessed:)]) {
        [self.delegate querySuccessed:dp];
    }
    if (self.isRefresh) {
        [self clearExpirdData];
    }
}
- (void)safeDelegate_NetRequestBegin:(DataProvider *)dp
{
    if ([self.delegate respondsToSelector:@selector(netRequestBegin:)]) {
        [self.delegate netRequestBegin:dp];
    }
}

- (void)safeDelegate_NetFinishedFailed:(DataProvider *)dp
{
    self.internalStatus = kDataProviderLoadFailed;
    if ([self.delegate respondsToSelector:@selector(netFinishedFailed:)]) {
        [self.delegate netFinishedFailed:dp];
    }
}


- (void)safeDelegate_NetRequestFailed:(DataProvider *)dp error:(NSError *)error
{
    self.internalStatus = kDataProviderLoadFailed;
    if ([self.delegate respondsToSelector:@selector(netRequestFailed:error:)]) {
        [self.delegate netRequestFailed:dp error:error];
    }
}


#pragma mark - Private
- (BOOL)needToRefreshWhenQuery
{
    if (self.allDatas.count == 0) {
        return YES;
    }
    if (fabs(self.expiredTime) < 0.00001) {
        return NO;
    }
    // 判断是否过期
    unsigned long long now = [[DataProvider currentTime] unsignedLongLongValue];
    unsigned long long expiredTime = (unsigned long long)(self.expiredTime * NSEC_PER_SEC);
    for (NSManagedObject *mo in self.allDatas) {
        unsigned long long updatetime = [[mo valueForKey:@"updatetime"] unsignedLongLongValue];
        unsigned long long guoqu = (now -  updatetime);
        if (guoqu > expiredTime) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Property
- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController == nil) {
        _fetchedResultsController = [self customFetchedResultsController];
    }
    return _fetchedResultsController;
}

#pragma mark - Public
- (void)query
{
    // 只要有数据缓存，无论是否过期，先展示给用户，同时在后台刷新数据
    // 无数据缓存时，只能直接刷新
    if (self.allDatas.count == 0) {
        [self updateAllDatas];
    }
    [self safeDelegate_QuerySuccessed:self];
    if ([self needToRefreshWhenQuery]) {
        [self refresh];
    }
}
- (void)refresh
{
    self.isRefresh = YES;
    self.internalStatus = kDataProviderLoading;
    [self safeDelegate_NetRequestBegin:self];
}
- (void)loadMore
{
    self.isRefresh = NO;
    self.internalStatus = kDataProviderLoadingMore;
    [self safeDelegate_NetRequestBegin:self];
}

- (void)clearOldData
{
    if (self.isRefresh) {
        for (NSManagedObject *mo in self.allDatas) {
            [mo MR_deleteEntity];
        }
    }
    _fetchedResultsController = nil;
}
+ (NSNumber *)currentTime
{
    NSTimeInterval ti = [[NSDate date] timeIntervalSinceReferenceDate];
    
    unsigned long long updatetime = mach_absolute_time() + ti * NSEC_PER_SEC;
    // 纳秒级时间戳
    return [NSNumber numberWithUnsignedLongLong:updatetime];
}

- (void)updateAllDatas
{
    _fetchedResultsController = nil;
    id<NSFetchedResultsSectionInfo> frsi = [[self.fetchedResultsController sections] objectAtIndex:0];
    self.allDatas = frsi.objects;
}


#pragma mark - Constructor And Destructor
- (id)initWithDelegate:(id<DataProviderDelegate>)delegate
{
    if (self = [super init]) {
        self.isRefresh = NO;
        self.delegate = delegate;
        self.internalStatus = kDataProviderInit;
        _fetchedResultsController = nil;
    }
    return self;
}


@end
