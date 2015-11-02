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
#import "RXCoreTextImageData.h"
#import "RXCoreTextLinkData.h"
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



+ (RXCoreTextData *)parseTemplateFile:(NSString *)path config:(RXFrameParserConfig *)config
{
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSMutableArray *imageArray = [NSMutableArray array];
    NSMutableArray *linkArray = [NSMutableArray array];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    if (data != nil) {
        NSArray *ary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        if ([ary isKindOfClass:[NSArray class]]) {
            for (NSDictionary *dic in ary) {
                NSString *type = dic[@"type"];
                if ([type isEqualToString:@"txt"]) {
                    NSAttributedString *as = [self parseAttributedContentFromDictionary:dic config:config];
                    [attributedString appendAttributedString:as];
                } else if ([type isEqualToString:@"img"]) {
                    NSAttributedString *as = [self parseImageDataFromDictonary:dic config:config];
                    [attributedString appendAttributedString:as];
                    
                    
                    // 创建 RXCoreTextImageData
                    RXCoreTextImageData *imageData = [[RXCoreTextImageData alloc] init];
                    imageData.name = dic[@"name"];
                    imageData.position = attributedString.length;
                    [imageArray addObject:imageData];
                } else if ([type isEqualToString:@"link"]) {
                    
                    NSUInteger startPos = attributedString.length;
                    
                    
                    NSAttributedString *as = [self parseAttributedContentFromDictionary:dic config:config];
                    [attributedString appendAttributedString:as];
                    // 创建 RXCoreTextLineData
                    NSUInteger length = attributedString.length - startPos;
                    NSRange linkRange = NSMakeRange(startPos, length);
                    RXCoreTextLinkData *linkData = [[RXCoreTextLinkData alloc] init];
                    linkData.title = dic[@"content"];
                    linkData.url = dic[@"url"];
                    linkData.range = linkRange;
                    [linkArray addObject:linkData];
                } else {
                    // Do Nothing
                }
            }
        }
    }
    
    
    RXCoreTextData *ctData = [self parseAttributedContent:attributedString config:config];
    ctData.imageAry = imageArray;
    ctData.linkAry = linkArray;
    return ctData;
}


#pragma mark - Static

static CGFloat ascentCallback(void *ref)
{
    NSDictionary *dic = (__bridge NSDictionary *)ref;
    NSNumber *number = dic[@"height"];
    return [number floatValue];
}
static CGFloat descentCallback(void *ref)
{
    return 0;
}
static CGFloat widthCallback(void *ref)
{
    NSDictionary *dic = (__bridge NSDictionary *)ref;
    NSNumber *number = dic[@"width"];
    return [number floatValue];
}




#pragma mark - Private

+ (NSAttributedString *)parseAttributedContentFromDictionary:(NSDictionary *)dic config:(RXFrameParserConfig *)config
{
    NSMutableDictionary *attributes = config.attributes;
    
    UIColor *color = [self colorFromTemplate:dic[@"color"]];
    
    if (color) {
        attributes[(id)kCTForegroundColorAttributeName] = (id)color.CGColor;
    }
    CGFloat fontSize = [dic[@"size"] floatValue];
    if (fontSize > 0) {
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)config.font.fontName, fontSize, NULL);
        attributes[(id)kCTFontAttributeName] = (__bridge id)fontRef;
        CFRelease(fontRef);
    }
    
    NSString *content = dic[@"content"];
    return [[NSAttributedString alloc] initWithString:content attributes:attributes];
}

+ (NSAttributedString *)parseImageDataFromDictonary:(NSDictionary *)dic config:(RXFrameParserConfig *)config
{
    CTRunDelegateCallbacks callbacks;
    memset(&callbacks, 0, sizeof(CTRunDelegateCallbacks));
    callbacks.version = kCTRunDelegateVersion1;
    callbacks.getAscent = ascentCallback;
    callbacks.getDescent = descentCallback;
    callbacks.getWidth = widthCallback;
    
    CTRunDelegateRef delegateRef = CTRunDelegateCreate(&callbacks, (__bridge void *)(dic));
    
    
    // 使用 0xFFFC 作为空白的占位符
    unichar objectReplacementChar = 0xFFFC;
    NSString *content = [NSString stringWithCharacters:&objectReplacementChar length:1];
    NSDictionary *attributes = config.attributes;
    NSMutableAttributedString *space = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
    
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)space, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegateRef);
    CFRelease(delegateRef);
    return space;
    
}

+ (UIColor *)colorFromTemplate:(NSString *)name {
    if ([name isEqualToString:@"blue"]) {
        return [UIColor blueColor];
    } else if ([name isEqualToString:@"red"]) {
        return [UIColor redColor];
    } else if ([name isEqualToString:@"black"]) {
        return [UIColor blackColor];
    } else {
        return nil;
    }
}



@end
