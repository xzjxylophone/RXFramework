//
//  RXViewController.h
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/12.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXViewController : UIViewController

@property (nonatomic, strong) UIBarButtonItem *bbiBack;
- (void)bbiBackAction:(id)sender;


#pragma mark - initialize UI And Data
- (void)initializeUIAndData;
- (void)initializeAction;

@end
