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
#define RX_SDKURLScheme        @"rxpage"
#endif


#ifndef RXLogSwitch
#define RXLogSwitch        1
#endif





#if RXLogSwitch
#define RXLog(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)
#define RXWarning(frmt, ...)   NSLog(frmt, ##__VA_ARGS__)

#define RXClassMethod   NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#else
#define RXLog(frmt, ...)   do{}while(0)
#define RXWarning(frmt, ...)   do{}while(0)

#define RXClassMethod   do{}while(0)

#endif




// Notification Key example
#define NKey_RX_kkkkkk  @"NKey_RX_kkkkkk"

// UserDefault Key example
#define UDKey_RX_kkkk       @"UDKey_RX_kkkk"



// enum example
typedef enum E_RX_Type {
    kE_RX_Type_1,
    kE_RX_Type_2,
}E_RX_Type;


// UI example
#define k_UI_RX_Font12       [UIFont systemFontOfSize:12]
#define k_UI_RX_FontB12      [UIFont boldSystemFontOfSize:12]
#define k_UI_RX_LineColor   UIColorFromRGB(0xe1e1e1)

// ActionSheet Example
#define k_ActionSheet_RX_DeleteCourseOnce           1


// AlertView Example
#define k_AlertView_RX_DeleteCourseOnce           1


// 常量各种定义的key
#define k_CS_RX_QQ_AppId        @"1104800507"
#define k_CS_RX_Bmob_Secret_Key             @"85fcb166119163e1"
#define K_CS_RX_WeiXin_AppSecert    @"bbab14abb374389f694e681316890217"

#define k_CS_RX_WinWidth     ([UIScreen mainScreen].bounds.size.width)
#define k_CS_RX_WinHeight    ([UIScreen mainScreen].bounds.size.height)


#define RX_IsIPhone4_4s        ([UIScreen mainScreen].bounds.size.height < 500)
#define RX_IsiOS8_0_Or_Later   ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0f)



































