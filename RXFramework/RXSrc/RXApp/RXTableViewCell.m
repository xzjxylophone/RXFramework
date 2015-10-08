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
