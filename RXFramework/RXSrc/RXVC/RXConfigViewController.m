//
//  RXConfigViewController.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/23.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXConfigViewController.h"
#import "RXTVSectionItem.h"
#import "RXConfigCell.h"
#import "RXLabelView.h"
@interface RXConfigViewController () 

@property (strong, nonatomic) UITableView *tableView;



@end

@implementation RXConfigViewController




#pragma mark - UITableViewDataSource
#pragma mark Required
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RXTVSectionItem *sectionItem = self.functionItems[section];
    return sectionItem.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    RXFunctionItem *item = sectionItem.items[indexPath.row];
    NSString *identify = [RXConfigCell identifier];
    RXConfigCell *cell = (RXConfigCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[RXConfigCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setData:item];
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.functionItems.count;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RXConfigCell cellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RXTVSectionItem *sectionItem = self.functionItems[indexPath.section];
    RXFunctionItem *item = sectionItem.items[indexPath.row];
    if (item.action != nil) {
        [self performSelector:item.action withObject:nil afterDelay:0];
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    RXTVSectionItem *sectionItem = self.functionItems[section];
    UIView *view = sectionItem.object;
    return view.rx_height;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    RXTVSectionItem *sectionItem = self.functionItems[section];
    UIView *view = sectionItem.object;
    return view;
}



#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIColor *bgColor = [UIColor grayColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.tableView];
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(padding);
    }];
    
    
    self.title = @"各种信息及调试开关";
    
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = 50;
    
    
    
    RXLabelView *baseInfoLabelView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    baseInfoLabelView.backgroundColor = bgColor;
    [baseInfoLabelView updateWithLeftPadding:10];
    baseInfoLabelView.lbl.text = @"手机及iOS系统信息";
    self.baseInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.baseInfoSectionItem.object = baseInfoLabelView;
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    
    
    UIScreen *screen = [UIScreen mainScreen];
    
    CGFloat width1 = screen.bounds.size.width;
    CGFloat height1 = screen.bounds.size.height;
    NSString *sizeString = [NSString stringWithFormat:@"%.0f*%.0f", width1, height1];
    
    
    NSString *nativeSizeString = @"iOS 8系统以下不支持读取实际分辨率";
    NSString *nativeScaleString = @"iOS 8系统以下不支持读取实际比率";
    if ([screen respondsToSelector:@selector(nativeBounds)]) {
        CGFloat width2 = screen.nativeBounds.size.width;
        CGFloat height2 = screen.nativeBounds.size.height;
        nativeSizeString = [NSString stringWithFormat:@"%.0f*%.0f", width2, height2];
        nativeScaleString = [NSString stringWithFormat:@"%.2f", screen.nativeScale];
    }
    
    
    NSString *scaleString = [NSString stringWithFormat:@"%.2f", screen.scale];
    
    RXFunctionItem *item00 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑宽高" action:nil type:0 object:sizeString];
    RXFunctionItem *item01 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际宽高" action:nil type:0 object:nativeSizeString];
    RXFunctionItem *item02 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"逻辑比率" action:nil type:0 object:scaleString];
    RXFunctionItem *item03 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"实际比率" action:nil type:0 object:nativeScaleString];
    //    RXFunctionItem *item04 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:device.model];
    RXFunctionItem *item05 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"iOS系统" action:nil type:0 object:[NSString stringWithFormat:@"%@ %@", device.systemName, device.systemVersion]];
    RXFunctionItem *item06 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机名称" action:nil type:0 object:device.name];
    RXFunctionItem *item07 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机序列号" action:nil type:0 object:device.identifierForVendor.UUIDString];
    
    RXFunctionItem *item08 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"当前手机号" action:nil type:0 object:[UIDevice rx_currentPhoneNumber]];
    RXFunctionItem *item09 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"手机型号" action:nil type:0 object:[UIDevice rx_currentDeviceModel]];
    
    self.baseInfoSectionItem.items = @[item00, item01, item02, item03, item05, item06, item07, item08, item09];
    
    
    RXLabelView *appInfoLabelView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    appInfoLabelView.backgroundColor = [UIColor clearColor];
    [appInfoLabelView updateWithLeftPadding:10];
    appInfoLabelView.lbl.text = @"App应用基本信息";
    
    self.appInfoSectionItem = [[RXTVSectionItem alloc] init];
    self.appInfoSectionItem.object = appInfoLabelView;
    
    
    RXFunctionItem *item10 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Version" action:nil type:0 object:([RXManager appVersion])];
    RXFunctionItem *item11 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Build" action:nil type:0 object:([RXManager appBuild])];
    RXFunctionItem *item12 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"Identifier" action:nil type:0 object:([RXManager appBundleIdentifier])];
    RXFunctionItem *item13 = [[RXFunctionItem alloc] initWithIconName:@"" title:@"应用名称" action:nil type:0 object:([RXManager appBundleName])];
    
    self.appInfoSectionItem.items = @[item10, item11, item12, item13];
    
    self.view.backgroundColor = bgColor;
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
