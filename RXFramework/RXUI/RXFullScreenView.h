//
//  RXFullScreenView.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/25.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXFullScreenView : UIView
#pragma mark - Public
- (void)close;
- (void)showInView:(UIView *)view;
- (void)showInCurWindow;
@end
