//
//  REConfigViewController.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/30.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "REConfigViewController.h"

@interface REConfigViewController ()

@end

@implementation REConfigViewController

#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    [super initializeUIAndData];
    
    self.functionItems = @[self.baseInfoSectionItem, self.appInfoSectionItem];
}
- (void)initializeAction
{
    [super initializeAction];
}

#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
