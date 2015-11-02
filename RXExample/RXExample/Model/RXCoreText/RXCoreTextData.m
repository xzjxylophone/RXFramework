//
//  RXCoreTextData.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXCoreTextData.h"

@implementation RXCoreTextData


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


- (void)dealloc
{
    if (_frameRef != nil) {
        CFRelease(_frameRef);
        _frameRef = nil;
    }
}




@end
