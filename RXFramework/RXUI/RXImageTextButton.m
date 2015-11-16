//
//  RXImageTextButton.m
//  A2A
//
//  Created by Rush.D.Xzj on 15/5/25.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXImageTextButton.h"


@interface RXImageTextButton ()

@property (nonatomic, assign) CGFloat offset;




@end


@implementation RXImageTextButton



- (void)updateWithImageName:(NSString *)imageName text:(NSString *)text
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    UIImage *image = [UIImage imageNamed:imageName];
    CGFloat ivWidth = image.size.width;
    CGFloat ivHeight = image.size.height;
    CGFloat ivY = (height - ivHeight) / 2.0f;
    
    self.lbl.text = text;
    [self.lbl sizeToFit];
    
    CGFloat lblWidth = self.lbl.width;
    CGFloat lblHeight = self.lbl.height;
    CGFloat lblY = (height - lblHeight) / 2.0f;
    CGFloat totalWidth = ivWidth + self.offset + lblWidth;
    CGFloat ivX = (width - totalWidth) / 2.0f;
    CGFloat lblX = ivX + ivWidth + self.offset;
    
    self.iv.image = image;
    self.iv.frame = CGRectMake(ivX, ivY, ivWidth, ivHeight);
    self.lbl.frame = CGRectMake(lblX, lblY, lblWidth, lblHeight);
    
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [self initWithFrame:frame offset:0]) {
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame offset:(CGFloat)offset
{
    if (self = [super initWithFrame:frame]) {
        self.offset = offset;
        self.iv = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.lbl = [[UILabel alloc] initWithFrame:CGRectZero];
        
        [self addSubview:self.iv];
        [self addSubview:self.lbl];
    }
    return self;
}


@end
