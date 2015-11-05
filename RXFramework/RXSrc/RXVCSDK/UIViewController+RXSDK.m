//
//  UIViewController+RXSDK.m
//  TestURL
//
//  Created by Rush.D.Xzj on 15-3-26.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "UIViewController+RXSDK.h"
#import <objc/runtime.h>
#import "NSURL+RXUtility.h"
#import "RXDefine.h"
#import "RXSDKConfigManager.h"

@implementation UIViewController (SDK)

#pragma mark - ReadOnly
- (CGFloat)rx_viewRealHeight
{
    UIViewController *vc = [self.view rx_viewController];
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    
    if (vc.navigationController.navigationBar.translucent) {
        return screenHeight;
    } else {
        return screenHeight - 64;
    }
}


#pragma mark - Property
- (NSString *)rx_string
{
    return objc_getAssociatedObject(self, @"rx_string");
}

- (void)setRx_string:(NSString *)rx_string
{
    objc_setAssociatedObject(self, @"rx_string", rx_string, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *)rx_query
{
    return objc_getAssociatedObject(self, @"rx_query");
}

- (void)setRx_query:(NSDictionary *)rx_query
{
    objc_setAssociatedObject(self, @"rx_query", rx_query, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)rx_params
{
    return objc_getAssociatedObject(self, @"rx_params");
}

- (void)setRx_params:(NSDictionary *)rx_params
{
    objc_setAssociatedObject(self, @"rx_params", rx_params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSURL *)rx_url
{
    return objc_getAssociatedObject(self, @"rx_url");
}

- (void)setRx_url:(NSURL *)rx_url
{
    objc_setAssociatedObject(self, @"rx_url", rx_url, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
#pragma mark - private
- (void)rx_private_tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer
{
    [self.view endEditing:YES];
}


#pragma mark - Public

- (void)rx_tapAnywhereToDismissKeyboard
{
    __weak __typeof(self) weakSelf = self;
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rx_private_tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    [nc addObserverForName:UIKeyboardWillShowNotification object:nil queue:mainQuene usingBlock:^(NSNotification *note) {
        [weakSelf.view addGestureRecognizer:singleTapGR];
    }];
    [nc addObserverForName:UIKeyboardWillHideNotification object:nil queue:mainQuene usingBlock:^(NSNotification *note) {
        [weakSelf.view removeGestureRecognizer:singleTapGR];
    }];
}

#pragma mark - Constructor And Destructor
- (id)initWithString:(NSString *)string
{
    if (self = [self initWithString:string query:nil]) {
    }
    return self;
}

- (id)initWithString:(NSString *)string query:(NSDictionary *)query
{
    if (self = [self init]) {
        self.rx_string = string;
        self.rx_query = query;
    }
    return self;
}

#pragma mark - 工厂方法创建VC
+ (id)rx_vcWithString:(NSString *)string
{
    return [self rx_vcWithString:string query:nil];
}
+ (id)rx_vcWithString:(NSString *)string query:(NSDictionary *)query
{
    NSURL *url = [NSURL URLWithString:string];
    // 表示传递过来的不能得到URL
    if (url == nil) {
        // 转换成utf8编码的
        NSString *uft8String = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        url = [NSURL URLWithString:uft8String];
    }
    // 还是不可以
    if (url == nil) {
        return nil;
    }
    NSString *scheme = url.scheme;
    NSString *host = url.host;
    
    Class cls = nil;
    // 本地跳转页面
    if ([scheme isEqualToString:RX_SDKURLScheme]) {
        cls = NSClassFromString(host);
    } else if ([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"]) {
        cls = NSClassFromString([RXSDKConfigManager sharedInstance].webVCString);
    } else {
        // 有可能将来是有其他的
    }
    if (cls == nil) {
        return nil;
    }
    UIViewController *result = [[cls alloc] initWithString:string query:query];
    result.rx_url = url;
    result.rx_params = url.rx_params;
    return result;
    
    
}



#pragma mark - Override
#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif


@end
