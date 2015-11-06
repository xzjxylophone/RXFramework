//
//  NSString+MethodSwizzling.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/6.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "NSString+MethodSwizzling.h"

@implementation NSString (MethodSwizzling)


- (NSString *)myAction
{
    NSString *string = [self myAction];
    NSLog(@"%@ => %@", self, string);
    return string;
}


@end
