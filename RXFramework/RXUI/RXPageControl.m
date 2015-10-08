//
//  RXPageControl.m
//  KC
//
//  Created by Rush.D.Xzj on 15/9/27.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXPageControl.h"
@interface RXPageControl ()

@property (nonatomic, strong) UIImage *activeImage;

@property (nonatomic, strong) UIImage *inactiveImage;
@end

@implementation RXPageControl


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.activeImage = [UIImage imageNamed:@"icon_dot_seleted"];
        self.inactiveImage = [UIImage imageNamed:@"icon_dot_normal"];
    }
    return self;
}

- (void)updateDots
{
    NSArray *views = self.subviews;
    for (NSInteger i = 0; i < views.count; i++) {
//        UIImageView *iv = views[i];
//        if (i == self.currentPage) {
//            iv.image = self.activeImage;
//        } else {
//            iv.image = self.inactiveImage;
//        }
    }
}

- (void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    [self updateDots];
}




























@end
