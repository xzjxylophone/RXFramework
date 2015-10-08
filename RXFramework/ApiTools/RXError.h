//
//  RXError.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kRXErrorText    @"网络错误"
#define kRXErrorDomain @"com.lekan.error_domain"

typedef enum RXEErrorType {
    kRXEErrorTypeNetError        =       -10000, // 网络错误
    kRXEErrorTypeNoError         =       0,
    kRXEErrorTypeOtherError      =       1000, // 其他错误
    kRXEErrorTypeTokenExpired       =       9999, // 用户过期
}RXEErrorType;


@interface RXError : NSError

- (id)initWithCode:(int)code msg:(NSString *)msg;


+ (id)defaultError;



@end
