//
//  RXFrameParserConfig.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXFrameParserConfig : NSObject

@property (nonatomic, assign) CGFloat width;            // 宽度
@property (nonatomic, strong) UIFont *font;             // 字体
@property (nonatomic, assign) CGFloat lineSpace;        // 行距
@property (nonatomic, strong) UIColor *textColor;       // 文字颜色



@property (nonatomic, readonly) NSMutableDictionary *attributes;


@end
