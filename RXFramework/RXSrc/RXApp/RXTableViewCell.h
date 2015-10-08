//
//  RXTableViewCell.h
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-20.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RXAppPch.h"

@interface RXTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *vContent;






- (void)setData:(id)data;


// 从xib获取cell,是xib的index为0
+ (id)cell_xib;
// 从 UITableViewCell initWithStyle
+ (instancetype)cell;


+ (CGFloat)cellHeight;
+ (NSString *)identifier;
@end
