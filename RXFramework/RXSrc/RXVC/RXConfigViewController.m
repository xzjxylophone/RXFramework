//
//  RXConfigViewController.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/23.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigViewController.h"
#import "RXTVSectionItem.h"

#import "RXLabelView.h"
@interface RXConfigViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation RXConfigViewController
#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    [super initializeUIAndData];
    
    
    self.title = @"各种信息及调试开关";
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 50;
    
    RXLabelView *baseInfoLabelView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [baseInfoLabelView updateWithLeftPadding:10];
    baseInfoLabelView.lbl.text = @"手机及iOS系统信息";
    self.baseInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.baseInfoSectionItem.data = baseInfoLabelView;
    
    
    UIDevice *device = [UIDevice currentDevice];
    NSString *sizeString = NSStringFromCGRect([UIScreen mainScreen].bounds);
    RXFunctionItem *item00 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"宽高" action:nil type:0 object:sizeString];
    RXFunctionItem *item01 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:device.model];
    RXFunctionItem *item02 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"iOS系统" action:nil type:0 object:device.systemVersion];
    RXFunctionItem *item03 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机名称" action:nil type:0 object:device.name];
//    RXFunctionItem *item04 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"验证码" action:nil type:0 object:device.uniqueIdentifier];
    
    self.baseInfoSectionItem.items = @[item00, item01, item02, item03];
    
    
    RXLabelView *appInfoLabelView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [appInfoLabelView updateWithLeftPadding:10];
    appInfoLabelView.lbl.text = @"App应用基本信息";
    
    self.appInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.appInfoSectionItem.data = appInfoLabelView;
    
    
    RXFunctionItem *item10 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"App version" action:nil type:0 object:([RXManager appVersion])];
    RXFunctionItem *item11 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"App build" action:nil type:0 object:([RXManager appBuild])];
    RXFunctionItem *item12 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"App identifier" action:nil type:0 object:([RXManager appBundleIdentifier])];
    
    self.appInfoSectionItem.items = @[item10, item11, item12];
    
    
}
- (void)initializeAction
{
    [super initializeAction];
}


#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
