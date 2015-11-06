//
//  RXTextFieldView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/26.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXTextFieldView.h"

@implementation RXTextFieldView


- (UITextField *)tf
{
    if (_tf == nil) {
        _tf = [[UITextField alloc] initWithFrame:CGRectZero];
        
        _tf.placeholder = @"";
        [self addSubview:_tf];
    }
    return _tf;
}




- (void)updateWithLeftPadding:(CGFloat)leftPadding
{
    UIEdgeInsets padding = UIEdgeInsetsMake(0, leftPadding, 0, leftPadding);
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(padding);
    }];
}


@end
