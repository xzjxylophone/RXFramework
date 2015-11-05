//
//  UIViewController+REBase.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/5.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UIViewController+REBase.h"
#import <objc/runtime.h>

@implementation UIViewController (REBase)

#pragma mark - Property
- (UIBarButtonItem *)bbiBack
{
    return objc_getAssociatedObject(self, @"rx_bbiBack");
}
- (void)setBbiBack:(UIBarButtonItem *)bbiBack
{
    objc_setAssociatedObject(self, @"rx_bbiBack", bbiBack, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark - Action
- (void)bbiBackAction:(id)sender
{
    UIViewController *vc = [self.navigationController popViewControllerAnimated:YES];
    if (vc == nil) {
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            // Do Nothing
        }];
    }
}




@end
