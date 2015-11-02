//
//  RXFrameParser.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RXCoreTextData;
@class RXFrameParserConfig;


@interface RXFrameParser : NSObject


+ (RXCoreTextData *)parseContent:(NSString *)content config:(RXFrameParserConfig *)config;

+ (RXCoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(RXFrameParserConfig *)config;

+ (RXCoreTextData *)parseTemplateFile:(NSString *)path config:(RXFrameParserConfig *)config;

@end
