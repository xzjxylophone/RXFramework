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


@interface RXCTData : NSObject




- (NSAttributedString *)attributedStringWithConfig:(RXCTFrameParserConfig *)config outRXCTFrame:(RXCTFrame **)outRXCTFrame;


@end
