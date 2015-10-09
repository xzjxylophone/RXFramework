//
//  RXError.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define k_CS_RX_ErrorText    @"网络错误"
#define k_CS_RX_ErrorDomain @"com.lekan.error_domain"

typedef enum E_RX_ErrorType {
    kE_RX_ErrorType_NetError        =       -10000, // 网络错误
    kE_RX_ErrorType_NoError         =       0,
    kE_RX_ErrorType_OtherError      =       1000, // 其他错误
    kE_RX_ErrorType_TokenExpired       =       9999, // 用户过期
}E_RX_ErrorType;


@interface RXError : NSError

- (id)initWithCode:(int)code msg:(NSString *)msg;


+ (id)defaultError;



@end
