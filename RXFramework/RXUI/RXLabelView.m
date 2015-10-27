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
    UIEdgeInsets padding = UIEdgeInsetsMake(0, leftPadding, 0, leftPadding);
    [self.lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).width.insets(padding);
    }];
    
}





@end
