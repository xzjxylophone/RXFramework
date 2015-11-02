//
//  RXFrameParser.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXFrameParser.h"
#import "RXCoreTextData.h"
#import "RXFrameParserConfig.h"
#import <CoreText/CoreText.h>
#import "RXCoreTextData.h"
@interface RXFrameParser ()

@end

@implementation RXFrameParser



#pragma mark - Public
+ (RXCoreTextData *)parseContent:(NSString *)content config:(RXFrameParserConfig *)config
{
    NSDictionary *attributes = config.attributes;
    NSAttributedString *contentString = [[NSAttributedString alloc] initWithString:content attributes:attributes];
    
    
    return [self parseAttributedContent:contentString config:config];
    
}


+ (RXCoreTextData *)parseAttributedContent:(NSAttributedString *)content config:(RXFrameParserConfig *)config
{
    // 创建 CTFramesetterRef 实例
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)content);
    
    // 获得要绘制的区域的高度
    CGSize restrictSize = CGSizeMake(config.width, CGFLOAT_MAX); // 限制的区域
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetterRef, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    // 创建 CTFrameRef 实例
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGPathAddRect(pathRef, NULL, CGRectMake(0, 0, config.width, textHeight));
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetterRef, CFRangeMake(0, 0), pathRef, NULL);
    CFRelease(pathRef);
    
    // 将生成好的 CTFrameRef 实例和计算好的绘制高度保存到 CoreTextData 实例中,最后返回CoreTextData实例
    RXCoreTextData *data = [[RXCoreTextData alloc] init];
    data.frameRef = frameRef;
    data.height = textHeight;
    data.content = content;
    
    CFRelease(frameRef);
    CFRelease(framesetterRef);
    return data;
    
}




@end
