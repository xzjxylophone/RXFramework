//
//  RXHttpBlock.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworkReachabilityManager.h"
@interface RXHttpBlock : NSObject

@property(nonatomic,assign) BOOL isCancelledParse;




+ (RXHttpBlock *)queryCarListWithSuccess:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure;


+ (RXHttpBlock *)sendVerifyCodeWithMobile:(NSString *)mobile success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure;

+ (RXHttpBlock *)loginWithMobile:(NSString *)mobile code:(NSString *)code success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure;


+ (RXHttpBlock *)getCarDetailWithCarId:(NSString *)carId success:(void (^)(RXHttpBlock *http, id content))success failure:(void (^)(NSError *error))failure;


















































@end
