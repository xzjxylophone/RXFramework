//
//  RXFunctionItem.m
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-16.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import "RXFunctionItem.h"

@implementation RXFunctionItem

- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(int)type
{
    if (self = [self initWithIconName:iconName title:title action:action type:type object:nil]) {
    }
    return self;
}


- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(int)type object:(id)object
{
    
    if (self = [self init]) {
        self.iconName = iconName;
        self.title = title;
        self.action = action;
        self.type = type;
        self.object = object;
        self.isSelected = NO;
    }
    return self;
}

@end
