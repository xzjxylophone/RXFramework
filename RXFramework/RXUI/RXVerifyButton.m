//
//  RXVerifyButton.m
//  A2A
//
//  Created by Rush.D.Xzj on 15-4-9.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXVerifyButton.h"


@interface RXVerifyButton ()



@property (nonatomic, strong) UILabel *lblShow;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) int usedTime; // 花费的时间
@property (nonatomic, assign) int maxTime;
@property (nonatomic, assign) ESQPwdViewStatus esqLastPwdViewStatus;



@property (nonatomic, copy) NSString *initalizationBtnTitle; // 初始化的时候按钮的文案
@property (nonatomic, copy) NSString *okBtnTitle;   // 设置OK的时候的按钮的文案
@property (nonatomic, copy) NSString *againBtnTitle; // 再发一次的按钮的文案
@property (nonatomic, copy) NSString *formatShowString; // 倒计时 label 显示的, default format  %ds
@property (nonatomic, copy) NSString *showLabelTextColor; // 倒计时的label的字体颜色啊






@end


@implementation RXVerifyButton


- (void)setBtnAttributes:(NSDictionary *)attributes
{
    
}

- (void)updateToLastStatues
{
    switch (self.esqLastPwdViewStatus) {
        case kESQPwdViewStatusAgain:
            self.esqPwdViewStatus = kESQPwdViewStatusAgain;
            return;
        case kESQPwdViewStatusCountDown:
            if (self.timer == nil) {
                self.esqPwdViewStatus = kESQPwdViewStatusAgain;
            } else {
                self.esqPwdViewStatus = kESQPwdViewStatusCountDown;
            }
            break;
        case kESQPwdViewStatusOK:
        case kESQPwdViewStatusInit:
        default:
            // 目前应该不会出现此状况
            break;
    }
}

- (void)setEsqPwdViewStatus:(ESQPwdViewStatus)esqPwdViewStatus
{
    self.esqLastPwdViewStatus = self.esqPwdViewStatus;
    _esqPwdViewStatus = esqPwdViewStatus;
    switch (esqPwdViewStatus) {
        case kESQPwdViewStatusInit:
        {
            [self.lblShow removeFromSuperview];
            self.lblShow.text = @"";
            [self setTitle:@"获取验证码" forState:UIControlStateNormal];
            self.enabled = YES;
        }
            break;
        case kESQPwdViewStatusCountDown:
        {
            [self addSubview:self.lblShow];
            [self setTitle:@"" forState:UIControlStateNormal];
            
            NSString *text = [NSString stringWithFormat:@"%ds", self.maxTime];
            self.lblShow.text = text;

            [RXUtils fillAllInSuperView:self subView:self.lblShow];
            self.enabled = NO;
            [self startTimer];
        }
            break;
        case kESQPwdViewStatusAgain:
        {
            [self.lblShow removeFromSuperview];
            [self setTitle:@"再发一次" forState:UIControlStateNormal];
            self.enabled = YES;
        }
            break;
        case kESQPwdViewStatusOK:
        {
            [self.lblShow removeFromSuperview];
            [self setTitle:@"确定" forState:UIControlStateNormal];
            self.enabled = YES;
        }
            break;
        default:
            break;
    }
}

- (void)startTimer
{
    if (self.timer == nil) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
}
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
#pragma mark - Action
- (void)btnTouchUpInside:(id)sender
{
    switch (self.esqPwdViewStatus) {
        case kESQPwdViewStatusInit:
        case kESQPwdViewStatusAgain:
        {
            self.esqPwdViewStatus = kESQPwdViewStatusCountDown;
            [self.delegate sendAgainInRXVerifyButton:self];
        }
            break;
        case kESQPwdViewStatusCountDown:
            // 几乎不可能
            break;
        case kESQPwdViewStatusOK:
        default:
            [self.delegate okFuncInRXVerifyButton:self];
            break;
    }
}


- (void)timerAction:(id)sender
{
    int remainTime = self.maxTime - self.usedTime;
    if (remainTime == 0) {
        [self stopTimer];
        self.usedTime = 0;
        switch (self.esqPwdViewStatus) {
            case kESQPwdViewStatusOK:
                // Do Nothing
                // 上一次是倒计时的话,把上一次改成再次发送
                if (self.esqLastPwdViewStatus == kESQPwdViewStatusCountDown) {
                    self.esqLastPwdViewStatus = kESQPwdViewStatusAgain;
                }
                break;
            case kESQPwdViewStatusCountDown:
                self.esqPwdViewStatus = kESQPwdViewStatusAgain;
                break;
            default:
                break;
        }
    } else {
        self.usedTime++;
        NSString *text = [NSString stringWithFormat:@"%ds", remainTime];
        self.lblShow.text = text;
    }
}

#pragma mark - Override

- (void)awakeFromNib
{
    [self initializeUIAndData];
}


- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initializeUIAndData];
    }
    return self;
}

- (void)initializeUIAndData
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    self.lblShow = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    self.lblShow.backgroundColor = [UIColor clearColor];
    self.lblShow.textAlignment = NSTextAlignmentCenter;
    self.lblShow.textColor = [UIColor whiteColor];
    
    [self addTarget:self action:@selector(btnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
#if DEBUG
    self.maxTime = 10;
#else
    self.maxTime = 60;
#endif
    
    self.esqPwdViewStatus = kESQPwdViewStatusInit;
}









@end
