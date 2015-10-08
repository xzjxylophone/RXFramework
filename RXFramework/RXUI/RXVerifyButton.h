//
//  RXVerifyButton.h
//  A2A
//
//  Created by Rush.D.Xzj on 15-4-9.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>





typedef enum ESQPwdViewStatus {
    kESQPwdViewStatusInit           =       0, // 初始化
    kESQPwdViewStatusCountDown      =       1, // 倒计时
    kESQPwdViewStatusAgain          =       2, // 再发一次
    kESQPwdViewStatusOK             =       3, // OKFunc // 当填充完验证码的时候自动发送
}ESQPwdViewStatus;



@class RXVerifyButton;

@protocol RXVerifyButtonDelegate <NSObject>

- (void)sendAgainInRXVerifyButton:(RXVerifyButton *)rxVB;
- (void)okFuncInRXVerifyButton:(RXVerifyButton *)rxVB;

@end


@interface RXVerifyButton : UIButton
@property (nonatomic, assign) ESQPwdViewStatus esqPwdViewStatus;
@property (nonatomic, weak) id<RXVerifyButtonDelegate> delegate;



- (void)setBtnAttributes:(NSDictionary *)attributes;



- (void)updateToLastStatues;


@end
