//
//  RXTableViewCell.m
//  Taka
//
//  Created by Rush.D.Xzj on 15-1-20.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXTableViewCell.h"

@implementation RXTableViewCell


- (void)setData:(id)data
{
    // Do Nothing
}

- (void)awakeFromNib {
    // Initialization code
    
    // 重新添加一下, 这样解决iOS8和滑动删除
    if (self.vContent.superview == self.contentView) {
        [self.vContent removeFromSuperview];
        [self.contentView addSubview:self.vContent];
        [RXManager fillAllInSuperView:self.contentView subView:self.vContent];
    }
    
    // 记得子类需要调用 [super awakeFromNib];
    
}


+ (id)cell_xib
{
    NSArray *nibView =  [[NSBundle mainBundle] loadNibNamed:[self identifier] owner:nil options:nil];
    return nibView[0];
}

+ (instancetype)cell
{
    Class cls = [self class];
    id cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self identifier]];
    return cell;
}



+ (CGFloat)cellHeight
{
    return 0;
}

+ (NSString *)identifier
{
    return NSStringFromClass([self class]);
}
@end
