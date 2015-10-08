//
//  UINavigationController+RXSDK.m
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UINavigationController+RXSDK.h"
#import "UIViewController+RXSDK.h"
#import "RXDefine.h"
#import "RXNavigationController.h"
@implementation UINavigationController (RXSDK)
- (BOOL)rx_openString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate
{
    UIViewController *vc = [UIViewController rx_vcWithString:str query:query];
    if (vc != nil) {
        [self pushViewController:vc animated:animate];
        return YES;
    } else {
        RXWarning(@"open String:(%@) is nil", str);
        return NO;
    }
}


- (BOOL)rx_presentString:(NSString *)str query:(NSDictionary *)query animate:(BOOL)animate completion:(void (^)(void))completion
{
    UIViewController *vc = [UIViewController rx_vcWithString:str query:query];
    if (vc != nil) {
        
        RXNavigationController *nc = [[RXNavigationController alloc] initWithRootViewController:vc];
        
        [self presentViewController:nc animated:animate completion:nil];
        return YES;
    } else {
        RXWarning(@"present String:(%@) is nil", str);
        return NO;
    }
}

@end
