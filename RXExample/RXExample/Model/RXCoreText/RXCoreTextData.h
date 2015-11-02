//
//  RXCoreTextData.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/2.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>
@interface RXCoreTextData : NSObject


@property (nonatomic, assign) CTFrameRef frameRef;
@property (nonatomic, assign) CGFloat height;
@property (strong, nonatomic) NSAttributedString *content;



@end
