//
//  MBProgressHUD+RXUtility.m
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/14.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MBProgressHUD+RXUtility.h"

@implementation MBProgressHUD (RXUtility)

+ (void)showWarningWithText:(NSString *)text
{
    [MBProgressHUD showWarningWithText:text delegate:nil];
}

+ (void)showWarningWithText:(NSString *)text delegate:(id<MBProgressHUDDelegate>)delegate
{
    if (text&&![text isEqualToString:@""]) {
        
        UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.delegate = delegate;
        hud.labelText = text;
        hud.mode = MBProgressHUDModeText;
        hud.dimBackground = NO;
        [hud hide:YES afterDelay:2.0];
    }
    
}
@end
