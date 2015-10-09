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



@end
