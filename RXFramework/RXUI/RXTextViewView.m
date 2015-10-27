//
//  RXTextViewView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/26.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXTextViewView.h"

#import "RXTextView.h"
@interface RXTextViewView ()


@end


@implementation RXTextViewView


#pragma mark - Private

- (RXTextView *)tv
{
    if (_tv == nil) {
        _tv = [[RXTextView alloc] initWithFrame:CGRectZero];
        [self addSubview:_tv];
    }
    return _tv;
}




- (void)updateWithLeftPadding:(CGFloat)leftPadding
{
    [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(leftPadding);
        make.right.equalTo(self.mas_right).offset(-leftPadding);
    }];
}



@end
