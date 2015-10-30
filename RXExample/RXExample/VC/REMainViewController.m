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
@interface REMainViewController ()
@property (weak, nonatomic) IBOutlet RXLabelView *rxLabelView;


@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation REMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.lbl.backgroundColor = [UIColor redColor];
    self.lbl.text = @"我们一起来测试";

    NSLog(@"self.view:%@, self.label:%@", self.view, self.lbl);
    
    
    
    [self.rxLabelView updateWithLeftPadding:10];
    self.rxLabelView.lbl.backgroundColor = [UIColor blueColor];
    
    [RXHttpBlock queryCarListWithBlock:^(RXHttpBlock *http, id contentObject, NSError *error) {
        NSLog(@"contentObj:%@, error:%@", contentObject, error);
    }];
    
    
    
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"cache.db"];
    NSString *tableName = @"user_table";
//    [store createTableWithName:tableName];
//    
//    [store putString:@"123456" withId:@"1" intoTable:tableName];
    
//    NSString *str = [store getStringById:@"1" fromTable:tableName];
//    NSLog(@"str:%@", str);
    
    YTKKeyValueItem *item = [store getYTKKeyValueItemById:@"1" fromTable:tableName];
    
    NSLog(@"item:%@", item);
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
