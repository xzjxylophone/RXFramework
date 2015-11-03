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

static CGFloat ascentCallback(void *ref)
{
    RXCTImageData *imageData = (__bridge RXCTImageData *)ref;
    return imageData.height;
}
static CGFloat descentCallback(void *ref)
{
    return 0;
}
static CGFloat widthCallback(void *ref)
{
    RXCTImageData *imageData = (__bridge RXCTImageData *)ref;
    return imageData.width;
}








+ (RXCTFrameData *)parseWithArray:(NSArray *)ary config:(RXCTFrameParserConfig *)config
{
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *linkArray = [NSMutableArray array];
    NSMutableArray *textArray = [NSMutableArray array];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    
    for (RXCTData *ctData in ary) {
        
       
        if ([ctData isKindOfClass:[RXCTTextData class]]) {
            NSUInteger startPos = attributedString.length;
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
            
            NSUInteger length = attributedString.length - startPos;
            NSRange range = NSMakeRange(startPos, length);
            
            RXCTTextFrame *textFrame = [[RXCTTextFrame alloc] init];
            textFrame.data = tmp;
            textFrame.range = range;
            [textArray addObject:textFrame];
            
        } else if ([ctData isKindOfClass:[RXCTImageData class]]) {
            RXCTImageData *tmp = (RXCTImageData *)ctData;
            NSUInteger startPos = attributedString.length;
            CTRunDelegateCallbacks callbacks;
            memset(&callbacks, 0, sizeof(CTRunDelegateCallbacks));
            callbacks.version = kCTRunDelegateVersion1;
            callbacks.getAscent = ascentCallback;
            callbacks.getDescent = descentCallback;
            callbacks.getWidth = widthCallback;
            CTRunDelegateRef delegateRef = CTRunDelegateCreate(&callbacks, (__bridge void *)(tmp));
            // 使用 0xFFFC 作为空白的占位符
            unichar objectReplacementChar = 0xFFFC;
            NSString *content = [NSString stringWithCharacters:&objectReplacementChar length:1];
            NSDictionary *attributes = config.attributes;
            NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
            CFAttributedStringSetAttribute((CFMutableAttributedStringRef)space, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegateRef);
            CFRelease(delegateRef);
            [attributedString appendAttributedString:space];
            
            
            NSUInteger length = attributedString.length - startPos;
            NSRange range = NSMakeRange(startPos, length);
            RXCTImageFrame *imageFrame = [[RXCTImageFrame alloc] init];
            imageFrame.data = tmp;
            imageFrame.range = range;
            [imageArray addObject:imageFrame];
        } else if ([ctData isKindOfClass:[RXCTLinkData class]]) {
            RXCTLinkData *tmp = (RXCTLinkData *)ctData;
            NSUInteger startPos = attributedString.length;
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
            
            
            NSUInteger length = attributedString.length - startPos;
            NSRange range = NSMakeRange(startPos, length);
            
            RXCTLinkFrame *linkFrame = [[RXCTLinkFrame alloc] init];
            linkFrame.data = tmp;
            linkFrame.range = range;
            [linkArray addObject:linkFrame];
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
    ctFrameData.imageAry = imageArray;
    ctFrameData.linkAry = linkArray;
    ctFrameData.textAry = textArray;
    
    CFRelease(frameRef);
    CFRelease(framesetterRef);
    return ctFrameData;
    
}















































@end
