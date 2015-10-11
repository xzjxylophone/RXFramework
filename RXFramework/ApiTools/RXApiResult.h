//
//  RXApiResult.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXError.h"
@interface RXApiResult : NSObject


// 是否成功
@property (nonatomic, readonly) BOOL success;

@property (nonatomic, assign) NSInteger stateCode;
@property (nonatomic, copy) NSString *stateMsg;


@property (nonatomic, strong) NSDictionary *dataDic;



- (id)initWithString:(NSString *)str;
- (id)initWithData:(id)data;
- (id)initWithDictionary:(NSDictionary *)dic;



@end
