//
//  RXCTLinkData.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCTLinkData.h"
#import "RXCTFrameParserConfig.h"
#import <CoreText/CoreText.h>
#import "RXCTLinkFrame.h"
@implementation RXCTLinkData

- (NSAttributedString *)attributedStringWithConfig:(RXCTFrameParserConfig *)config outRXCTFrame:(RXCTFrame **)outRXCTFrame
{
    NSMutableDictionary *attributes = config.attributes;
    UIColor *textColor = self.textColor;
    CGFloat fontSize = self.font.pointSize;
    attributes[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)self.font.fontName, fontSize, NULL);
    attributes[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    
    // 添加一条线
    attributes[(id)kCTUnderlineStyleAttributeName] = [NSNumber numberWithInt:kCTUnderlineStyleSingle];
    
    
    CFRelease(fontRef);
    NSString *content = self.content;
    NSAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content attributes:attributes];
    
    RXCTLinkFrame *rxctFrame = [[RXCTLinkFrame alloc] init];
    rxctFrame.data = self;
    *outRXCTFrame = rxctFrame;
    
    return attributedString;
}



@end
