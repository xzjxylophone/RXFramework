//
//  RXCTData.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RXCTFrame;
@class RXCTFrameParserConfig;


/*
 输入数据的基类
 */
@interface RXCTData : NSObject



/*
 此函数的作用是
 */
- (NSAttributedString *)attributedStringWithConfig:(RXCTFrameParserConfig *)config outRXCTFrame:(RXCTFrame **)outRXCTFrame;


@end
