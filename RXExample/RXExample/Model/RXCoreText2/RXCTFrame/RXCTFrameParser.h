//
//  RXCTFrameParser.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXCTFrameData.h"
#import "RXCTFrameParserConfig.h"
@interface RXCTFrameParser : NSObject



+ (RXCTFrameData *)parseWithArray:(NSArray *)ary config:(RXCTFrameParserConfig *)config;




@end
