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
    NSString *domain = kRXErrorDomain;
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey:msg};
    if (self = [super initWithDomain:domain code:code userInfo:userInfo]) {
        
    }
    return self;
}

+ (id)defaultError
{
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:kRXErrorText forKey:NSLocalizedDescriptionKey];
    RXError *result = [[RXError alloc] initWithDomain:kRXErrorDomain code:kRXEErrorTypeNetError userInfo:userInfo];
    return result;
}

@end
