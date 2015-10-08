//
//  RXDefine.h
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


// 此文件的内容 都是RX部分的,跟app 无关


#ifndef RX_SDKURLScheme
#define RX_SDKURLScheme        @"wdpage"
#endif


#define RXLogSwitch        1


#if RXLogSwitch
#define RXLog(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)
#define RXWarning(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)
#else
#define RXLog(frmt, ...)   do{}while(0)
#define RXWarning(frmt, ...)   do{}while(0)
#endif


#define RX_IsIPhone4_4s        ([UIScreen mainScreen].bounds.size.height < 500)


#define RX_GCD_BLOCK(block) dispatch_async(dispatch_get_global_queue(0, 0), block)
#define RX_GCD_MAIN(block) dispatch_async(dispatch_get_main_queue(), block)


#define UIColorFromRGB(rgbValue) [UIColor \
                                        colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                                        green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                                        blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define UIColorFromARGB(argbValue) [UIColor \
                                        colorWithRed:((float)((argbValue & 0xFF0000) >> 16))/255.0 \
                                        green:((float)((argbValue & 0xFF00) >> 8))/255.0 \
                                        blue:((float)(argbValue & 0xFF))/255.0 \
                                        alpha:(float)((argbValue & 0xFF000000) >> 24)/255.0]

#define IDS_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero


#define IsIphone4_4s    ([UIScreen mainScreen].bounds.size.height == 480)
