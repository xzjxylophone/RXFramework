//
//  RXCoreTextData.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCoreTextData.h"
#import "RXCoreTextImageData.h"

@implementation RXCoreTextData


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
    
    RXCoreTextImageData *imageData = self.imageAry[0];
    
    for (int i = 0; i < lineCount; i++) {
        if (imageData == nil) {
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
            NSDictionary *metaDic = CTRunDelegateGetRefCon(delegateRef);
            if (![metaDic isKindOfClass:[NSDictionary class]]) {
                continue;
            }
            
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
            imageData.imagePosition = delegateBounds;
            imgIndex++;
            if (imgIndex == self.imageAry.count) {
                imageData = nil;
            } else {
                imageData = self.imageAry[imgIndex];
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
