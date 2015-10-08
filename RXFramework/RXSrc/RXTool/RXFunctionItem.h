//
//  RXFunctionItem.h
//  Shangqian
//
//  Created by Rush.D.Xzj on 14-10-16.
//  Copyright (c) 2014年 Wanda Inc. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RXFunctionItem : NSObject

@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) id object;

@property (nonatomic, assign) BOOL isSelected;



- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(int)type;
- (id)initWithIconName:(NSString *)iconName title:(NSString *)title action:(SEL)action type:(int)type object:(id)object;


@end
