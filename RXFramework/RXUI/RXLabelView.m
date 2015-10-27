//
//  RXLabelView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/23.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXLabelView.h"


@implementation RXLabelView



- (UILabel *)lbl
{
    if (_lbl == nil) {
        _lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_lbl];
    }
    return _lbl;
}




- (void)updateWithLeftPadding:(CGFloat)leftPadding
{
    [self.lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(leftPadding);
        make.right.equalTo(self.mas_right).offset(-leftPadding);
    }];
}





@end
