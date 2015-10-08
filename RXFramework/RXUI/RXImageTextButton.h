//
//  RXImageTextButton.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/5/25.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXImageTextButton : UIButton
@property (nonatomic, strong) UIImageView *iv;
@property (nonatomic, strong) UILabel *lbl;

// offset 指的是图片和文字的间距
- (id)initWithFrame:(CGRect)frame offset:(CGFloat)offset;


- (void)updateWithImageName:(NSString *)imageName text:(NSString *)text;

@end
