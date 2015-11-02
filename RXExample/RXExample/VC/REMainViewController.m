//
//  REMainViewController.m
//  RXExample
//
//  Created by Rush.D.Xzj on 15/10/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "REMainViewController.h"
#import "RXHttpBlock.h"

#import "RXLabelView.h"

#import "YTKKeyValueStore.h"

#import "RXCTHeader.h"
@interface REMainViewController ()
@property (weak, nonatomic) IBOutlet RXLabelView *rxLabelView;


@property (weak, nonatomic) IBOutlet UILabel *lbl;


@property (nonatomic, strong) RXDisplayView *rxDisplayView;

@end

@implementation REMainViewController


- (void)lblAction:(id)sender
{
    [self.navigationController rx_openString:@"rxpage://REConfigViewController" query:nil animate:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lbl.backgroundColor = [UIColor redColor];
    self.lbl.text = @"我们一起来测试";

    NSLog(@"self.view:%@, self.label:%@", self.view, self.lbl);
    
    
    
    [self.rxLabelView updateWithLeftPadding:10];
    self.rxLabelView.lbl.backgroundColor = [UIColor blueColor];
    
    [self.lbl rx_addGestureRecognizerWithTarget:self action:@selector(lblAction:)];
    
//    [RXHttpBlock queryCarListWithBlock:^(RXHttpBlock *http, id contentObject, NSError *error) {
//        NSLog(@"contentObj:%@, error:%@", contentObject, error);
//    }];
    
    
    
//    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"cache.db"];
//    NSString *tableName = @"user_table";
//    [store createTableWithName:tableName];
//    
//    [store putString:@"123456" withId:@"1" intoTable:tableName];
    
//    NSString *str = [store getStringById:@"1" fromTable:tableName];
//    NSLog(@"str:%@", str);
    
//    YTKKeyValueItem *item = [store getYTKKeyValueItemById:@"1" fromTable:tableName];
//
//    NSLog(@"item:%@", item);
    
    
    
    
    
    RXFrameParserConfig *config = [[RXFrameParserConfig alloc] init];
    config.textColor = [UIColor redColor];
    config.width = k_CS_RX_WinWidth;
    config.font = [UIFont systemFontOfSize:17];
    config.lineSpace = 15;
    
    RXCoreTextData *data = [RXFrameParser parseContent:@" 按照以上原则，我们将`CTDisplayView`中的部分内容拆开。 按照以上原则，我们将`CTDisplayView`中的部分内容拆开。 按照以上原则，我们将`CTDisplayView`中的部分内容拆开。" config:config];
    
    
    self.rxDisplayView = [[RXDisplayView alloc] initWithFrame:CGRectMake(0, 250, k_CS_RX_WinWidth, 0)];
    
    self.rxDisplayView.data = data;
    self.rxDisplayView.rx_height = data.height;
    self.rxDisplayView.backgroundColor = [UIColor yellowColor];
    
    
    [self.view addSubview:self.rxDisplayView];
    
    
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
