//
//  RXCustomAlertView.h
//  RXCustomAlertView
//
//  Created by Richard on 20/09/2013.
//  Copyright (c) 2013 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import <UIKit/UIKit.h>
@class RXCustomAlertView;
@protocol RXCustomAlertViewDelegate <NSObject>

@optional
- (void)rxCustomAlertView:(RXCustomAlertView *)rxCustomAlertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface RXCustomAlertView : UIView

@property (nonatomic, strong) UIView *contentView; // Container within the dialog (place your ui elements here)
@property (nonatomic, strong) UIView *btnView;    // Buttons on the bottom of the dialog

@property (nonatomic, weak) id<RXCustomAlertViewDelegate> delegate;
@property (nonatomic, strong) NSArray *btnTitles;
@property (nonatomic, assign) BOOL useMotionEffects;


- (id)init;

- (void)show;
- (void)close;




@end
