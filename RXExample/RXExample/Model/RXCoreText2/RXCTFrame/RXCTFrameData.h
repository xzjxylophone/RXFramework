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



@property (nonatomic, strong) NSArray *attributedArray;



// 具体的Array
@property (nonatomic, readonly) NSArray *imageAry;
@property (nonatomic, readonly) NSArray *linkAry;

@property (nonatomic, readonly) NSArray *textAry;



@end
