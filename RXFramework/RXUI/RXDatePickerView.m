//
//  RXDatePickerView.m
//  KC
//
//  Created by Rush.D.Xzj on 15/9/12.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXDatePickerView.h"



@interface RXDatePickerView ()

@property (nonatomic, assign) BOOL __m_isInForeground;



@end

@implementation RXDatePickerView

- (BOOL)isInForeground
{
    return self.__m_isInForeground;
}



- (void)autoOK
{
   
    
    [self close];
    [self.delegate rxDatePickerView:self selectedDate:self.datePicker.date];
}



- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [self removeFromSuperview];
}
- (void)close
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    self.rx_top = height;
    self.__m_isInForeground = NO;
    //动画结束
    [UIView commitAnimations];
}
- (void)showInView:(UIView *)view
{
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.rx_top = height;
    [view addSubview:self];
    
    [UIView beginAnimations:@"doflip" context:nil];
    //设置时常
    [UIView setAnimationDuration:0.5];
    
    
    self.rx_top = height - self.rx_height;
    self.__m_isInForeground = YES;
    //动画结束
    [UIView commitAnimations];
    
}
#pragma mark - Action
- (void)btnOKTouchUpInside:(id)sender
{
    [self autoOK];
}
- (void)btnCancelTouchUpInside:(id)sender
{
    [self close];
}

#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        
        CGFloat vTopHeight = 45;
        CGFloat btnWidth = 60;
        self.btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnCancel.frame = CGRectMake(0, 0, btnWidth, vTopHeight);
        [self.btnCancel setTitle:@"取消" forState:UIControlStateNormal];
        [self.btnCancel addTarget:self action:@selector(btnCancelTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        
        self.btnOK = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnOK.frame = CGRectMake(width - btnWidth, 0, btnWidth, vTopHeight);
        [self.btnOK setTitle:@"确认" forState:UIControlStateNormal];
        [self.btnOK addTarget:self action:@selector(btnOKTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        
        
        self.vTop = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, vTopHeight)];
        
        
        
        
        [self.vTop addSubview:self.btnCancel];
        [self.vTop addSubview:self.btnOK];
        
        
        self.datePicker = [[UIDatePicker alloc] init];
        self.datePicker.rx_top = vTopHeight;
        
        
        [self addSubview:self.vTop];
        [self addSubview:self.datePicker];
        
        
        CGFloat height = vTopHeight + self.datePicker.rx_height;
        self.frame = CGRectMake(0, 0, width, height);
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}













+ (id)rxDatePickerView
{
    id result = [[RXDatePickerView alloc] initWithFrame:CGRectZero];
    return result;
}

@end
