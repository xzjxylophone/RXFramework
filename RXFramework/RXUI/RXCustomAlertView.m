//
//  RXCustomAlertView.m
//  RXCustomAlertView
//
//  Created by Richard on 20/09/2013.
//  Copyright (c) 2013 Wimagguc.
//
//  Lincesed under The MIT License (MIT)
//  http://opensource.org/licenses/MIT
//

#import "RXCustomAlertView.h"
#import <QuartzCore/QuartzCore.h>

@interface RXCustomAlertView () <RXCustomAlertViewDelegate>

@property (nonatomic, strong) UIView *dialogView;    // Dialog's container view

@end

@implementation RXCustomAlertView

#pragma mark - Public
// Create the dialog view, and animate opening the dialog
- (void)show
{
    self.dialogView = [self createDialogView];
    self.dialogView.layer.shouldRasterize = YES;
    self.dialogView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    self.dialogView.backgroundColor = [UIColor clearColor];
    self.dialogView.layer.opacity = 0.5f;
    self.dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    [self addSubview:self.dialogView];
    // Can be attached to a view or to the top most window
    // Attached to a view:
    __weak __typeof(self) weakSelf = self;
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    switch (interfaceOrientation) {
        case UIInterfaceOrientationLandscapeLeft:
            self.transform = CGAffineTransformMakeRotation(M_PI * 270.0 / 180.0);
            break;
        case UIInterfaceOrientationLandscapeRight:
            self.transform = CGAffineTransformMakeRotation(M_PI * 90.0 / 180.0);
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            self.transform = CGAffineTransformMakeRotation(M_PI * 180.0 / 180.0);
            break;
        default:
            break;
    }
    [self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [[[[UIApplication sharedApplication] windows] firstObject] addSubview:self];
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
					 animations:^{
						 weakSelf.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4f];
                         weakSelf.dialogView.layer.opacity = 1.0f;
                         weakSelf.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
					 } completion:nil];
}
// Dialog close animation then cleaning and removing the view from the parent
- (void)close
{
    __weak __typeof(self) weakSelf = self;
    CATransform3D currentTransform = self.dialogView.layer.transform;
    CGFloat startRotation = [[self.dialogView valueForKeyPath:@"layer.transform.rotation.z"] floatValue];
    CATransform3D rotation = CATransform3DMakeRotation(-startRotation + M_PI * 270.0 / 180.0, 0.0f, 0.0f, 0.0f);
    self.dialogView.layer.transform = CATransform3DConcat(rotation, CATransform3DMakeScale(1, 1, 1));
    self.dialogView.layer.opacity = 1.0f;
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         weakSelf.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         weakSelf.dialogView.layer.transform = CATransform3DConcat(currentTransform, CATransform3DMakeScale(0.6f, 0.6f, 1.0));
                         weakSelf.dialogView.layer.opacity = 0.0f;
                     } completion:^(BOOL finished) {
                         for (UIView *v in weakSelf.subviews) {
                             [v removeFromSuperview];
                         }
                         [weakSelf removeFromSuperview];
                     }];
}

#pragma mark - Private
- (UIView *)createDialogView
{
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    CGSize dialogSize = self.contentView.size;
    // For the black background
    self.frame = CGRectMake(0, 0, screenSize.width, screenSize.height);
    UIView *dialogContainer = [[UIView alloc] initWithFrame:CGRectMake((screenSize.width - dialogSize.width) / 2, (screenSize.height - dialogSize.height) / 2, dialogSize.width, dialogSize.height)];
    self.contentView.origin = CGPointMake(0, 0);
    [dialogContainer addSubview:self.contentView];
    return dialogContainer;
}

#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.delegate = self;
        self.useMotionEffects = NO;
    }
    return self;
}
- (void)dealloc
{
}
@end
