//
//  RXDataProvider.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/30.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YTKKeyValueStore.h"




/**
 缓存策略
 
 kE_RX_DPCachePolicy_IgnoreCache:只从网络获取数据，且数据不会缓存在本地，这是默认的缓存策略。
 
 kE_RX_DPCachePolicy_CacheOnly:只从缓存读数据，如果缓存没有数据，返回一个空数组。
 
 kE_RX_DPCachePolicy_NetworkOnly:只从网络获取数据，同时会在本地缓存数据。
 
 kE_RX_DPCachePolicy_CacheElseNetwork:先从缓存读取数据，如果没有再从网络获取。
 
 kE_RX_DPCachePolicy_NetworkElseCache:先从网络获取数据，如果没有，此处的没有可以理解为访问网络失败，再从缓存读取。
 
 kE_RX_DPCachePolicy_CacheThenNetwork:先从缓存读取数据，无论结果如何都会再次从网络获取数据，在这种情况下，Block将产生两次调用。通常这种做法是先快速从缓存读取数据显示在界面，然后在后台连接网络获取最新数据，取到后再更新界面。
 */
typedef enum E_RX_DPCachePolicy {
    kE_RX_DPCachePolicy_IgnoreCache,
    kE_RX_DPCachePolicy_CacheOnly,
    kE_RX_DPCachePolicy_NetworkOnly,
    kE_RX_DPCachePolicy_CacheElseNetwork,
    kE_RX_DPCachePolicy_NetworkElseCache,
    kE_RX_DPCachePolicy_CacheThenNetwork,
}E_RX_DPCachePolicy;

@class RXDataProvider;

@protocol RXDataProviderDelegate <NSObject>



@end



@interface RXDataProvider : NSObject







- (void)query;

- (void)refresh;

- (void)loadMore;


@property (nonatomic, readonly) NSString *tableName;
@property (nonatomic, readonly) NSInteger validTime; // 有效的持续时间

@property (nonatomic, assign) E_RX_DPCachePolicy cachePolicy;


@property (nonatomic, copy) NSString *key;















@end
