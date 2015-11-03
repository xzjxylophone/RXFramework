//
//  RXCTFrameData.h
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/3.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface RXCTFrameData : NSObject



@property (nonatomic, assign) CTFrameRef frameRef;
@property (nonatomic, assign) CGFloat height;
@property (strong, nonatomic) NSAttributedString *content;



@property (nonatomic, strong) NSArray *textAry;
@property (nonatomic, strong) NSArray *imageAry;
@property (nonatomic, strong) NSArray *linkAry;


@end
