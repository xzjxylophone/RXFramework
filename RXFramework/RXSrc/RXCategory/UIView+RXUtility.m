//
//  UIView+RXUtility.m
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-30.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UIView+RXUtility.h"
#import <objc/runtime.h>


@implementation UIView (RXUtility)

#pragma mark - Property
- (id)rx_tgr
{
    return objc_getAssociatedObject(self, @"rx_tgr");
}

- (void)setRx_tgr:(id)rx_tgr
{
    objc_setAssociatedObject(self, @"rx_tgr", rx_tgr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)rx_data
{
    return objc_getAssociatedObject(self, @"rx_data");
}

- (void)setRx_data:(id)rx_data
{
    objc_setAssociatedObject(self, @"rx_data", rx_data, OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)rx_left
{
    return self.frame.origin.x;
}

- (void)setRx_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = ceilf(x);
    self.frame = frame;
}

- (CGFloat)rx_top
{
    return self.frame.origin.y;
}

- (void)setRx_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = ceilf(y);
    self.frame = frame;
}

- (CGFloat)rx_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRx_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = ceilf(right - frame.size.width);
    self.frame = frame;
}

- (CGFloat)rx_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setRx_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = ceilf(bottom - frame.size.height);
    self.frame = frame;
}

- (CGFloat)rx_centerX
{
    return self.center.x;
}

- (void)setRx_centerX:(CGFloat)centerX
{
    self.center = CGPointMake(ceilf(centerX), self.center.y);
}

- (CGFloat)rx_centerY
{
    return self.center.y;
}

- (void)setRx_centerY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, ceilf(centerY));
}

- (CGFloat)rx_width
{
    return self.frame.size.width;
}

- (void)setRx_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = ceilf(width);
    self.frame = frame;
}

- (CGFloat)rx_height
{
    return self.frame.size.height;
}

- (void)setRx_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = ceilf(height);
    self.frame = frame;
}

- (CGPoint)rx_origin
{
    return self.frame.origin;
}

- (void)setRx_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)rx_size
{
    return self.frame.size;
}

- (void)setRx_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)rx_makeRound
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.rx_width / 2.0f;
}


- (void)rx_makeRoundWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)rx_makeLeftRightRound
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = self.rx_height / 2.0f;
}

- (void)rx_removeAllSubviews
{
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
}

- (UIImage *)rx_imageFromView
{
    
// 高清
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0);

    
//    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:currnetContext];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
    
//    UIGraphicsBeginImageContext(self.bounds.size);
//    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
}

- (UIImage *)rx_imageByRenderingView
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0f);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



- (id)rx_clsViewFromCls:(Class)cls
{
    UIView *v = self;
    id result;
    do {
        if ([v isKindOfClass:cls]) {
            result = v;
            break;
        } else {
            v = v.superview;
        }
    } while (v != nil);
    return result;
}

- (UIViewController *)rx_viewController
{
    for (UIView *next = self.superview; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}



- (void)rx_addGestureRecognizerWithTarget:(id)target action:(SEL)action
{
    if (self.rx_tgr != nil) {
        [self removeGestureRecognizer:self.rx_tgr];
    }
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    tgr.numberOfTapsRequired = 1;
    self.rx_tgr = tgr;
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:self.rx_tgr];
}

- (void)rx_removeGestureRecognizer
{
    if (self.rx_tgr != nil) {
        [self removeGestureRecognizer:self.rx_tgr];
    }
}












- (void)rx_addAppDidEnterBgNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(uiapplicationDidEnterBackgroundNotification:) name:UIApplicationDidEnterBackgroundNotification object:nil];
}
- (void)rx_removeAppDidEnterBgNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
}

- (void)uiapplicationDidEnterBackgroundNotification:(id)sender
{
    [self rx_removeAppDidEnterBgNotification];
    if ([self isKindOfClass:[UIAlertView class]]) {
        UIAlertView *av = (UIAlertView *)self;
        [av dismissWithClickedButtonIndex:0 animated:YES];
        
    } else if ([self isKindOfClass:[UIActionSheet class]]) {
        UIActionSheet *as = (UIActionSheet *)self;
        [as dismissWithClickedButtonIndex:0 animated:YES];
    } else {
        if ([self respondsToSelector:@selector(close)]) {
            [self performSelector:@selector(close)];
        } else {
            // Do Nothing
        }
    }
}















@end
