//
//  RXError.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-22.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXError.h"

@implementation RXError


- (id)initWithCode:(int)code msg:(NSString *)msg
{
    NSString *domain = k_CS_RX_ErrorDomain;
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:msg};
    if (self = [super initWithDomain:domain code:code userInfo:userInfo]) {
        
    }
    return self;
}

+ (id)defaultError
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:k_CS_RX_ErrorText forKey:NSLocalizedDescriptionKey];
    RXError *result = [[RXError alloc] initWithDomain:k_CS_RX_ErrorDomain code:kE_RX_ErrorType_NetError userInfo:userInfo];
    return result;
}

@end
