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

#import "RXCoreTextHeader.h"

#import "RXCTHeader.h"
#import "NSString+MethodSwizzling.h"

#import <objc/runtime.h>
@interface REMainViewController ()
@property (weak, nonatomic) IBOutlet RXLabelView *rxLabelView;
@property (strong, nonatomic) IBOutlet UIView *vTest;


@property (weak, nonatomic) IBOutlet UILabel *lbl;


@property (nonatomic, strong) RXDisplayView *rxDisplayView;


@end

@implementation REMainViewController


- (void)lblAction:(id)sender
{
    [self.navigationController rx_openString:@"rxpage://REConfigViewController" query:nil animate:YES];
}







#pragma mark - Private
- (void)testConfigVC
{
    self.lbl.text = @"我们一起来测试";
    [self.rxLabelView updateWithLeftPadding:10];
    self.rxLabelView.lbl.backgroundColor = [UIColor blueColor];
    [self.lbl rx_addGestureRecognizerWithTarget:self action:@selector(lblAction:)];
}
- (void)testHttp
{
    [RXHttpBlock queryCarListWithBlock:^(RXHttpBlock *http, id contentObject, NSError *error) {
        NSLog(@"contentObj:%@, error:%@", contentObject, error);
    }];

}
- (void)testYTK
{
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"cache.db"];
    NSString *tableName = @"user_table";
    [store createTableWithName:tableName];
    
    [store putString:@"123456" withId:@"1" intoTable:tableName];
    
    NSString *str = [store getStringById:@"1" fromTable:tableName];
    NSLog(@"str:%@", str);
    
    YTKKeyValueItem *item = [store getYTKKeyValueItemById:@"1" fromTable:tableName];
    
    NSLog(@"item:%@", item);

}
- (void)testAttributedText
{
    RXFrameParserConfig *config = [[RXFrameParserConfig alloc] init];
    config.textColor = [UIColor blackColor];
    config.width = k_CS_RX_WinWidth;
    config.font = [UIFont systemFontOfSize:17];
    config.lineSpace = 15;
    
    
    NSString *content =
    @" 对于上面的例子，我们给 CTFrameParser 增加了一个将 NSString 转 "
    " 换为 CoreTextData 的方法。"
    " 但这样的实现方式有很多局限性，因为整个内容虽然可以定制字体 "
    " 大小，颜色，行高等信息，但是却不能支持定制内容中的某一部分。"
    " 例如，如果我们只想让内容的前三个字显示成红色，而其它文字显 "
    " 示成黑色，那么就办不到了。"
    "\n\n"
    " 解决的办法很简单，我们让`CTFrameParser`支持接受 "
    "NSAttributeString 作为参数，然后在 NSAttributeString 中设置好 "
    " 我们想要的信息。";
    
    NSDictionary *attr = config.attributes;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content attributes:attr];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 7)];
    RXCoreTextData *data = [RXFrameParser parseAttributedContent:attributedString config:config];
    
    
    
    self.rxDisplayView = [[RXDisplayView alloc] initWithFrame:CGRectMake(0, 0, k_CS_RX_WinWidth, 0)];
    self.rxDisplayView.data = data;
    self.rxDisplayView.height = data.height;
    self.rxDisplayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.rxDisplayView];
}

- (void)testContentJson1
{
    RXFrameParserConfig *config = [[RXFrameParserConfig alloc] init];
    config.width = k_CS_RX_WinWidth;
    config.lineSpace = 25;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content1" ofType:@"json"];
    RXCoreTextData *data = [RXFrameParser parseTemplateFile:path config:config];
    
    
    
    
    self.rxDisplayView = [[RXDisplayView alloc] initWithFrame:CGRectMake(0, 0, k_CS_RX_WinWidth, 0)];
    self.rxDisplayView.data = data;
    self.rxDisplayView.height = data.height;
    self.rxDisplayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.rxDisplayView];
}

- (void)testContentJson2
{
    RXFrameParserConfig *config = [[RXFrameParserConfig alloc] init];
    config.width = k_CS_RX_WinWidth;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content2" ofType:@"json"];
    RXCoreTextData *data = [RXFrameParser parseTemplateFile:path config:config];
    
    
    
    
    self.rxDisplayView = [[RXDisplayView alloc] initWithFrame:CGRectMake(0, 0, k_CS_RX_WinWidth, 0)];
    self.rxDisplayView.data = data;
    self.rxDisplayView.height = data.height;
    self.rxDisplayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.rxDisplayView];
}



- (void)testContentJson3
{
    RXFrameParserConfig *config = [[RXFrameParserConfig alloc] init];
    config.width = k_CS_RX_WinWidth;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content3" ofType:@"json"];
    RXCoreTextData *data = [RXFrameParser parseTemplateFile:path config:config];
    
    
    
    
    self.rxDisplayView = [[RXDisplayView alloc] initWithFrame:CGRectMake(0, 0, k_CS_RX_WinWidth, 0)];
    self.rxDisplayView.data = data;
    self.rxDisplayView.height = data.height;
    self.rxDisplayView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.rxDisplayView];
}



- (void)testMyContent1
{
    RXCTFrameParserConfig *config = [[RXCTFrameParserConfig alloc] init];
    config.width = k_CS_RX_WinWidth;
    config.lineSpace = 10;
    config.font = [UIFont systemFontOfSize:22];
    config.textColor = [UIColor greenColor];
    
    // 普通文本
    RXCTTextData *textData = [[RXCTTextData alloc] init];
    textData.textColor = [UIColor redColor];
    textData.font = [UIFont boldSystemFontOfSize:15];
    textData.content = @"此段文本是一个普通文本,可以设置文字的字体,颜色等其他样式";
    
    
    // 普通文本,用config的信息
    RXCTTextData *textData2 = [[RXCTTextData alloc] init];
    textData2.content = @"此段文本是一个普通文本,使用默认的配置字体颜色";
    
    // 图片
    RXCTImageData *imageData = [[RXCTImageData alloc] init];
    imageData.imageName = @"coretext-image-1.jpg";
    imageData.imageUrl = @"";
    imageData.width = 340;
    imageData.height = 160;
    
    
    // 可点击文本
    RXCTLinkData *linkData = [[RXCTLinkData alloc] init];
    linkData.textColor = [UIColor blueColor];
    linkData.font = [UIFont boldSystemFontOfSize:15];
    linkData.content = @"此段文字是一个类似于超链接文本,跟普通文本有点类似,只是多了一个下划线和点击事件";
    
    
    NSArray *ary = @[textData, textData2, imageData, linkData];
    
    RXCTFrameData *data = [RXCTFrameData parseWithArray:ary config:config];
    RXCTView *rxctView = [[RXCTView alloc] initWithFrame:CGRectMake(0, 0, k_CS_RX_WinWidth, 0)];
    rxctView.rxctFrameData = data;
    rxctView.height = data.height;
    rxctView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:rxctView];
}



- (void)testMethodSwizzling
{
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swapMethod = class_getInstanceMethod([NSString class], @selector(myAction));
    
    method_exchangeImplementations(originalMethod, swapMethod);
    
    NSString *str = @"THis is a TESt!";
    
    NSString *str2 = [str lowercaseString];
    NSLog(@"str2:%@", str2);
    
    method_exchangeImplementations(originalMethod, swapMethod);

    
    
}






#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    
    
    
    
    
    
    
    
//    [self testAttributedText];
    
    
//    [self testContentJson1];
//    [self testContentJson2];
    
//    [self testContentJson3];
    
    [self testMyContent1];
    
//    self.view.backgroundColor = [UIColor redColor];
    
//    [self testConfigVC];
    
//    [self testMethodSwizzling];
    
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
