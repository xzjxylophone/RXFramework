//
//  RXUserManager.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXUserManager.h"

#define RXUserManagerUser       @"com.rxUserManagerUser"
@interface RXUserManager ()

@property (nonatomic, copy) NSString *jsonModelClass;

@end

@implementation RXUserManager



- (void)logout
{
    [self clearUserInfo];
    [self saveUserInfoToDisk];
}


- (void)configJSONModelClass:(NSString *)jsonModelClass
{
    self.jsonModelClass = jsonModelClass;
    [self loadUserInfoFromDisk];
}


- (void)saveUserInfoToDisk
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = nil;
    SEL toDic = NSSelectorFromString(@"toDictionary");
    if ([self.user respondsToSelector:toDic]) {
        dic = (NSDictionary *)[self.user performSelector:toDic withObject:nil];
    }
    [ud setValue:dic forKey:RXUserManagerUser];
    [ud synchronize];
    
}



- (void)loadUserInfoFromDisk
{
    
    Class cls = NSClassFromString(self.jsonModelClass);
    if (cls == nil) {
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [ud objectForKey:RXUserManagerUser];
    if (dic != nil) {
        self.user = [[cls alloc] initWithDictionary:dic error:nil];
    }
    
}

- (void)clearUserInfo
{
    SEL clean = NSSelectorFromString(@"clean");
    if ([self.user respondsToSelector:clean]) {
        [self.user performSelector:clean withObject:nil];
    }
}


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

+ (RXUserManager *)sharedInstance
{
    static RXUserManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
