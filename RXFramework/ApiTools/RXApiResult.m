//
//  RXApiResult.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXApiResult.h"

@implementation RXApiResult

- (BOOL)success
{
    return self.stateCode == kE_RX_ErrorType_NoError;
}
- (void)setSuccessInfoWithMsg:(NSString *)msg
{
    self.stateMsg = msg;
    self.stateCode = kE_RX_ErrorType_NoError;
}
- (void)setFailedInfoWithMsg:(NSString *)msg
{
    self.stateMsg = msg;
    self.stateCode = kE_RX_ErrorType_OtherError;
}

- (id)initWithResultString:(NSString *)str
{
    if (self = [super init]) {
    }
    return self;
}

- (id)initWithData:(id)data
{
    if ([data isKindOfClass:[NSData class]]) {
        NSData *tmp = data;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:tmp options:NSJSONReadingMutableLeaves error:nil];
        if (self = [self initWithDictionary:dic]) {
            
        }
    } else if ([data isKindOfClass:[NSString class]]) {
        if (self = [self initWithResultString:data]) {
            
        }
    } else {
        if (self = [self init]) {
            
        }
    }
    return self;
}
- (id)initWithDictionary:(NSDictionary *)dic
{
    if (self = [self init]) {
        
    }
    return self;
}


@end
