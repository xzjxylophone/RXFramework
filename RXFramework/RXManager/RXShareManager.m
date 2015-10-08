//
//  RXShareManager.m
//  KC
//
//  Created by Rush.D.Xzj on 15/9/25.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXShareManager.h"

@implementation RXShareManager







#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
    }
    return self;
}
- (void)dealloc
{
    
}

#pragma mark - Singleton Model

+ (RXShareManager *)sharedInstance
{
    static RXShareManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
