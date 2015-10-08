//
//  RXUserManager.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//



#import <Foundation/Foundation.h>



#define NKey_RX_UserLogin        @"NKey_RX_UserLogin"
#define NKey_RX_UserLogout       @"NKey_RX_UserLogout"





// JsonModel
@interface RXUserManager : NSObject
@property (nonatomic, strong) id user;


- (void)configJSONModelClass:(NSString *)jsonModelClass;

// User
- (void)saveUserInfoToDisk;
- (void)loadUserInfoFromDisk;
- (void)clearUserInfo;

- (void)logout;


#pragma mark - Signal Mode
+ (RXUserManager *)sharedInstance;
@end
