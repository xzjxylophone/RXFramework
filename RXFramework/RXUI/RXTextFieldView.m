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
        [self addSubview:_tf];
    }
    return _tf;
}




- (void)updateWithLeftPadding:(CGFloat)leftPadding
{
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(leftPadding);
        make.right.equalTo(self.mas_right).offset(-leftPadding);
    }];
}


@end
