//
//  RXTextFieldView.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/26.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXTextFieldView : UIView


@property (nonatomic, strong) UITextField *tf;

- (void)updateWithLeftPadding:(CGFloat)leftPadding;

@end
