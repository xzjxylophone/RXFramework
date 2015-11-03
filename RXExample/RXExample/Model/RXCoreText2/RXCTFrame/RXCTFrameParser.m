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



@implementation RXCTFrameParser













+ (RXCTFrameData *)parseWithArray:(NSArray *)ary config:(RXCTFrameParserConfig *)config
{
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *linkArray = [NSMutableArray array];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    for (RXCTData *ctData in ary) {
        switch (ctData.dataType) {
            case kE_RX_CTDataType_Text:
            {
                RXCTTextData *tmp = (RXCTTextData *)ctData;
                NSMutableDictionary *attributes = config.attributes;

                UIColor *textColor = tmp.textColor;
                CGFloat fontSize = tmp.font.pointSize;
                attributes[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
                CTFontRef fontRef = CTFontCreateWithName((CFStringRef)tmp.font.fontName, fontSize, NULL);
                attributes[(id)kCTFontAttributeName] = (__bridge id)fontRef;
                CFRelease(fontRef);
                NSString *content = tmp.content;
                NSAttributedString *appendAttr = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
                [attributedString appendAttributedString:appendAttr];
                
            }
                break;
            case kE_RX_CTDataType_Img:
            {
                RXCTImageData *tmp = (RXCTImageData *)ctData;
            }
                break;
            case kE_RX_CTDataType_Link:
            default:
            {
                RXCTLinkData *tmp = (RXCTLinkData *)ctData;
            }
                break;
        }
        
        
        
        
        
        
        
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
    
    CFRelease(frameRef);
    CFRelease(framesetterRef);
    return ctFrameData;
    
}















































@end
