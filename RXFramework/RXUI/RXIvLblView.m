//
//  RXIvLblView.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/27.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXIvLblView.h"


@interface RXIvLblView ()



@end


@implementation RXIvLblView

- (UILabel *)lbl
{
    if (_lbl == nil) {
        _lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        [self addSubview:_lbl];
    }
    return _lbl;
}


- (UIImageView *)iv
{
    if (_iv == nil) {
        _iv = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_iv];
    }
    return _iv;
}


- (void)fitToSuitable
{
    CGFloat ivWidth = self.iv.width;
    CGFloat ivHeight = self.iv.height;
    
    [self.lbl sizeToFit];
    CGFloat lblWidth = self.lbl.width;
    CGFloat lblHeight = self.lbl.height;
    
    
    CGFloat realWidth = ivWidth + lblWidth + self.offset;
    
    if (self.maxSize.width > 0) {
        realWidth = MIN(self.maxSize.width, realWidth);
    }
    
    CGFloat realHeight = MAX(ivHeight, lblHeight);
    
    if (self.maxSize.height > 0) {
        realHeight = MIN(realHeight, self.maxSize.height);
    }
    
    
    CGFloat ivX = 0;
    CGFloat lblX = 0;
    switch (self.e_RX_IvLblViewAlignment) {
        case kE_RX_IvLblViewAlignmengt_Iv_Lbl:
        {
            ivX = 0;
            lblX = ivX + ivWidth + self.offset;
        }
            break;
        case kE_RX_IvLblViewAlignmengt_Lbl_Iv:
        default:
        {
            lblX = 0;
            ivX = lblX + lblWidth + self.offset;
        }
            break;
    }
    
    
    
    CGFloat ivY = (realHeight - ivHeight) / 2.0f;
    CGFloat lblY = (realHeight - lblHeight) / 2.0f;
    
    self.iv.frame = CGRectMake(ivX, ivY, ivWidth, ivHeight);
    self.lbl.frame = CGRectMake(lblX, lblY, lblWidth, lblHeight);
    
    
    self.frame = CGRectMake(self.left, self.top, realWidth, realHeight);
    
    
    
    
    
    
}





@end
