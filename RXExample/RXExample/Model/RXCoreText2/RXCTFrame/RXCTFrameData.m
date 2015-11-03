//
//  RXCTFrameData.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCTFrameData.h"
#import "RXCTImageFrame.h"
#import "RXCTImageData.h"
@implementation RXCTFrameData

#pragma mark - Property
- (void)setFrameRef:(CTFrameRef)frameRef
{
    if (_frameRef != frameRef) {
        if (_frameRef != nil) {
            CFRelease(_frameRef);
        }
        CFRetain(frameRef);
        _frameRef = frameRef;
    }
}


- (void)setImageAry:(NSArray *)imageAry
{
    _imageAry = imageAry;
    [self fillImagePosition];
}


#pragma mark - Private
- (void)fillImagePosition
{
    if (self.imageAry.count == 0) {
        return;
    }
#warning 也许有点问题
    NSArray *lines = (NSArray *)CTFrameGetLines(self.frameRef);
    NSUInteger lineCount = lines.count;
    
    CGPoint lineOrigins[lineCount];
    CTFrameGetLineOrigins(self.frameRef, CFRangeMake(0, 0), lineOrigins);
    
    int imgIndex = 0;
    
    RXCTImageFrame *imageFrame = self.imageAry[0];
    
    for (int i = 0; i < lineCount; i++) {
        if (imageFrame == nil) {
            break;
        }
        CTLineRef line = (__bridge CTLineRef)lines[i];
        NSArray *runObjAry = (NSArray *)CTLineGetGlyphRuns(line);
        for (id runObj in runObjAry) {
            CTRunRef runRef = (__bridge CTRunRef)runObj;
            NSDictionary *runAttributes = (NSDictionary *)CTRunGetAttributes(runRef);
            CTRunDelegateRef delegateRef = (__bridge CTRunDelegateRef)[runAttributes valueForKey:(id)kCTRunDelegateAttributeName];
            if (delegateRef == nil) {
                continue;
            }
            
            
            // 这一段代码真的需要吗??
            RXCTImageData *imageData = CTRunDelegateGetRefCon(delegateRef);
            if (![imageData isKindOfClass:[RXCTImageData class]]) {
                continue;
            }
            // end 这一段代码真的需要吗??
            
            CGRect runBounds;
            CGFloat ascent;
            CGFloat descent;
            runBounds.size.width = CTRunGetTypographicBounds(runRef, CFRangeMake(0, 0), &ascent, &descent, NULL);
            runBounds.size.height = ascent + descent;
            
            CGFloat xOffset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(runRef).location, NULL);
            runBounds.origin.x = lineOrigins[i].x + xOffset;
            runBounds.origin.y = lineOrigins[i].y;
            runBounds.origin.y -= descent;
            
            CGPathRef pathRef = CTFrameGetPath(self.frameRef);
            CGRect colRect = CGPathGetBoundingBox(pathRef);
            
            CGRect delegateBounds = CGRectOffset(runBounds, colRect.origin.x, colRect.origin.y);
            imageFrame.imagePosition = delegateBounds;
            imgIndex++;
            if (imgIndex == self.imageAry.count) {
                imageFrame = nil;
            } else {
                imageFrame = self.imageAry[imgIndex];
            }
            
            
            
        }
        
    }
}




#pragma mark - Constructor And Destructor
- (void)dealloc
{
    if (_frameRef != nil) {
        CFRelease(_frameRef);
        _frameRef = nil;
    }
}






@end
