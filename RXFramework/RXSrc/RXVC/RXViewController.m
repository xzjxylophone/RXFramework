//
//  RXViewController.m
//  YYTS
//
//  Created by Rush.D.Xzj on 15/8/12.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXViewController.h"

@interface RXViewController ()

@end

@implementation RXViewController
#pragma mark - Action
- (void)bbiBackAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


/*
#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    [super initializeUIAndData];
}
- (void)initializeAction
{
    [super initializeAction];
}

*/

#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
}
- (void)initializeAction
{
    
}

#pragma mark - Property
- (UIBarButtonItem *)bbiBack
{
    if (_bbiBack == nil) {
        _bbiBack = [RXUtils rxBarButtonItemWithTarget:self action:@selector(bbiBackAction:) imageName:@"icon_back"];
    }
    return _bbiBack;
}


#pragma mark - Override

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem = self.bbiBack;

    [self initializeUIAndData];
    [self initializeAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
