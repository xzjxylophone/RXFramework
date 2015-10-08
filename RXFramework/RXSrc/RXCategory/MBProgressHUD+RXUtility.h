//
//  MBProgressHUD+RXUtility.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/14.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (RXUtility)

+ (void)showWarningWithText:(NSString *)text;
+ (void)showWarningWithText:(NSString *)text delegate:(id<MBProgressHUDDelegate>)delegate;



@end
