//
//  RXVCIntercepter.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/11/5.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXVCIntercepter.h"
#import <Aspects/Aspects.h>
#import <UIKit/UIKit.h>

#import "UIViewController+REBase.h"



@implementation RXVCIntercepter

+ (void)load
{
    /* + (void)load 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵” */
    [super load];
    [RXVCIntercepter sharedInstance];
}

/*
 按道理来说，这个sharedInstance单例方法是可以放在头文件的，但是对于目前这个应用来说，暂时还没有放出去的必要
 当业务方对这个单例产生配置需求的时候，就可以把这个函数放出去
 */
+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static RXVCIntercepter *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RXVCIntercepter alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        /* 在这里做好方法拦截 */
        [UIViewController aspect_hookSelector:@selector(loadView) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
            [self loadView:[aspectInfo instance]];
        } error:NULL];
        
        
        
//        [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo){
//            [self viewDidLoad:[aspectInfo instance]];
//        } error:NULL];
    }
    return self;
}

/*
 你也可以随便找一个什么其他的UIViewController，只要加入工程中，不需要额外添加什么代码，就可以做到自动拦截了。
 所以在你原来的架构中，大部分封装UIViewController的基类或者其他的什么基类，都可以使用这种方法让这些基类消失。
 */
#pragma mark - fake methods
- (void)loadView:(UIViewController *)viewController
{
    /* 你可以使用这个方法进行打日志，初始化基础业务相关的内容 */
    
    // 只有在vc显示的时候
    NSLog(@"[%@ loadView]", [viewController class]);
    
//    viewController.view.backgroundColor = [UIColor redColor];
//    UIBarButtonItem *bbiBack = [RXUtils rxBarButtonItemWithTarget:viewController action:@selector(bbiBackAction:) imageName:@"icon_back"];
//    bbiBack = [[UIBarButtonItem alloc] initWithTitle:@"返回上一级" style:(UIBarButtonItemStylePlain) target:viewController action:@selector(bbiBackAction:)];
//    viewController.bbiBack = bbiBack;
//    viewController.navigationItem.leftBarButtonItem = viewController.bbiBack;
//    
//    viewController.view.backgroundColor = [UIColor redColor];
    
    
    
    
}
- (void)viewDidLoad:(UIViewController *)viewController
{
    
    // 几乎所有的VC都在调用
//    NSLog(@"[%@ viewDidLoad]", [viewController class]);
    
    
    
}




@end
