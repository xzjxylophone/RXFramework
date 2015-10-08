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
    return self.stateCode == kRXEErrorTypeNoError;
}
- (void)setSuccessInfoWithMsg:(NSString *)msg
{
    self.stateMsg = msg;
    self.stateCode = kRXEErrorTypeNoError;
}
- (void)setFailedInfoWithMsg:(NSString *)msg
{
    self.stateMsg = msg;
    self.stateCode = kRXEErrorTypeOtherError;
}

- (id)initWithResultString:(NSString *)str
{
    if (self = [super init]) {
        
        NSData *jsonData = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];

        id errorno = [dic objectForKey:@"errno"];
        if (errorno == nil) {
            self.stateCode = 0;
        } else {
            int error = [errorno intValue];
            self.stateCode = error;
            self.stateMsg = [dic objectForKey:@"error"];
        }
    }
    return self;
}



@end
