//
//  RXDatePickerView.h
//  KC
//
//  Created by Rush.D.Xzj on 15/9/12.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RXDatePickerView;

@protocol RXDatePickerViewDelegate <NSObject>

- (void)rxDatePickerView:(RXDatePickerView *)rxDPV selectedDate:(NSDate *)selectedDate;

@end


@interface RXDatePickerView : UIView

@property (nonatomic, strong) UIView *vTop;
@property (nonatomic, strong) UIButton *btnOK;
@property (nonatomic, strong) UIButton *btnCancel;

@property (nonatomic, strong) UIDatePicker *datePicker;

@property (nonatomic, weak) id<RXDatePickerViewDelegate> delegate;
@property (nonatomic, readonly) BOOL isInForeground;

- (void)close;
- (void)showInView:(UIView *)view;
- (void)autoOK;




+ (id)rxDatePickerView;

@end
