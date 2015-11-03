//
//  RXCTFrameParser.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCTFrameParser.h"

#import "RXCTImageData.h"
#import "RXCTLinkData.h"
#import "RXCTTextData.h"

#import "RXCTImageFrame.h"
#import "RXCTLinkFrame.h"
#import "RXCTTextFrame.h"

@implementation RXCTFrameParser

#pragma mark - Static
+ (RXCTFrameData *)parseWithArray:(NSArray *)ary config:(RXCTFrameParserConfig *)config
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSMutableArray *array = [NSMutableArray array];
    for (RXCTData *ctData in ary) {
        NSUInteger startPos = attributedString.length;
        RXCTFrame *rxctFrame = nil;
        NSAttributedString *ctDataAttributedString = [ctData attributedStringWithConfig:config outRXCTFrame:&rxctFrame];
        [attributedString appendAttributedString:ctDataAttributedString];
        NSUInteger length = attributedString.length - startPos;
        NSRange range = NSMakeRange(startPos, length);
        rxctFrame.range = range;
        [array addObject:rxctFrame];
    }
    
    // 创建 CTFramesetterRef 实例
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
    
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
    RXCTFrameData *ctFrameData = [[RXCTFrameData alloc] init];
    ctFrameData.frameRef = frameRef;
    ctFrameData.height = textHeight;
    ctFrameData.content = attributedString;
    ctFrameData.attributedArray = array;
    
    CFRelease(frameRef);
    CFRelease(framesetterRef);
    return ctFrameData;
    
}















































@end
