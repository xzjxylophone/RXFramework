//
//  RXTVSectionItem.h
//  A2A
//
//  Created by Rush.D.Xzj on 15/4/24.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXTVSectionItem : NSObject

@property (nonatomic, strong) NSArray *items;

// 有可能是字符串,view等等
@property (nonatomic, strong) id object;

@end
