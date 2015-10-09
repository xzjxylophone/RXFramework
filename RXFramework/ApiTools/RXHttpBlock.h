//
//  RXHttpBlock.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworkReachabilityManager.h"

#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
@class RXApiResult;
@interface RXHttpBlock : NSObject


@property (nonatomic, strong) AFHTTPRequestOperation *httpOperation;
@property (nonatomic, strong) AFHTTPRequestOperationManager *httpOperationManager;

// Demo
+ (RXHttpBlock *)queryCarListWithBlock:(void (^)(RXHttpBlock *http, RXApiResult *apiResult, NSError *error))block;





#pragma mark - Get Post Method
- (void)GETWithUrl:(NSString *)url parameters:(NSDictionary *)parameters block:(void (^)(id contentObject, NSError *error))block;

- (void)POSTWithUrl:(NSString *)url parameters:(NSDictionary *)parameters block:(void (^)(id contentObject, NSError *error))block;











































@end
