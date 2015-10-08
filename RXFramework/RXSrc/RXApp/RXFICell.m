//
//  RXFICell.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/13.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXFICell.h"

@interface RXFICell ()
@property (nonatomic, assign) CGRect rectLblNoIV;
@property (nonatomic, assign) CGRect rectLblHaveIV;


@end

@implementation RXFICell


- (void)setData:(id)data
{
    if ([data isKindOfClass:[RXFunctionItem class]]) {
        RXFunctionItem *tmp = data;
        
        [self.iv removeFromSuperview];
        [self.lbl removeFromSuperview];
        
        
        UIImage *image = [UIImage imageNamed:tmp.iconName];
        if (image != nil) {
            self.iv.image = image;
            [self addSubview:self.iv];
            self.lbl.frame = self.rectLblHaveIV;
        } else {
            self.lbl.frame = self.rectLblNoIV;
        }
        if (tmp.title.length > 0) {
            self.lbl.text = tmp.title;
            [self addSubview:self.lbl];
        }
        
        self.vLine.frame = CGRectMake(self.lbl.rx_left, self.rx_height - 0.5, [UIScreen mainScreen].bounds.size.width - self.lbl.rx_left, 0.5);
        
        
    } else {
        
    }
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = 48;
        
        CGFloat ivX = 15;
        CGFloat ivWidth = 20;
        CGFloat ivHeight = ivWidth;
        CGFloat ivY = (height - ivHeight) / 2.0f;
        self.iv = [[UIImageView alloc] initWithFrame:CGRectMake(ivX, ivY, ivWidth, ivHeight)];
        
        CGFloat lblHeight = 30;
        CGFloat lblY = (height - lblHeight) / 2.0;
        CGFloat paddingLblAndIv = 10;
        self.rectLblNoIV = CGRectMake(ivX, lblY, width - ivX * 2, lblHeight);
        self.rectLblHaveIV = CGRectMake(ivX + ivWidth + paddingLblAndIv, lblY, width - ivWidth - 3*ivX, lblHeight);
        
        self.lbl = [[UILabel alloc] initWithFrame:self.rectLblHaveIV];
        
        
        CGFloat ivArrowWidth = 20;
        CGFloat ivArrowHeight = 20;
        CGFloat ivArrowX = width - ivWidth - 10;
        CGFloat ivArrowY = (height - ivArrowHeight) / 2.0;
        self.ivArrow = [[UIImageView alloc] initWithFrame:CGRectMake(ivArrowX, ivArrowY, ivArrowWidth, ivArrowHeight)];
        
        [self addSubview:self.ivArrow];
        
        CGFloat vLineX = self.rectLblHaveIV.origin.x;
        CGFloat vLineWidth = width - vLineX;
        self.vLine = [[UIView alloc] initWithFrame:CGRectMake(vLineX, height - 0.5, vLineWidth, 0.5)];
        [self addSubview:self.vLine];
        self.frame = CGRectMake(0, 0, width, height);
    }
    return self;
}

+ (CGFloat)cellHeight
{
    return 48;
}


@end
