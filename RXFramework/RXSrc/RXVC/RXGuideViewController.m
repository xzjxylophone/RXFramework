//
//  RXGuideViewController.m
//  KC
//
//  Created by Rush.D.Xzj on 15/9/1.
//  Copyright (c) 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXGuideViewController.h"

#import "RXPageControl.h"

@interface RXGuideViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *btnStart;


@property (nonatomic, strong) IBOutlet RXPageControl *pageControl;

@end

@implementation RXGuideViewController

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)sender
{

    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2)/pageWidth)+1;
    self.pageControl.currentPage = page;
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    self.btnStart = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.btnStart setTitle:@"开始" forState:UIControlStateNormal];
    [[RXManager sharedInstance] addActionToStartBtn:self.btnStart];
    self.btnStart.frame = CGRectMake(20, height - 50 - 20, width - 20 * 2, 50);
    self.btnStart.backgroundColor = [UIColor blueColor];
    
    
    UIButton *btnShow = nil;
    
    NSMutableArray *viewAry = [NSMutableArray array];
    BOOL isTest = NO;
    if (isTest) {
        for (NSUInteger i = 0; i < 3; i++) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, height)];
            lbl.textAlignment = NSTextAlignmentCenter;
            lbl.font = [UIFont systemFontOfSize:40];
            lbl.numberOfLines = 0;
            lbl.text = [NSString stringWithFormat:@"这是引导页第%zd页", i + 1];
            lbl.userInteractionEnabled = YES;
            UIColor *bgColor = nil;
            switch (i) {
                case 0:
                    bgColor = [UIColor redColor];
                    break;
                case 1:
                    bgColor = [UIColor greenColor];
                    break;
                case 2:
                default:
                    bgColor = [UIColor orangeColor];
                    break;
            }
            lbl.backgroundColor = bgColor;
            [view addSubview:lbl];
            [viewAry addObject:view];
        }
        btnShow = self.btnStart;
    } else {
        NSArray *imgAry = @[@"info5_1", @"info5_2", @"info5_3", @"info5_4"];
        for (NSUInteger i = 0; i < imgAry.count; i++) {
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
            NSString *imageName = imgAry[i];
            iv.userInteractionEnabled = YES;
            iv.image = [UIImage imageNamed:imageName];
            [viewAry addObject:iv];
        }
        btnShow = [[RXManager sharedInstance].delegate startBtnInGuideVC];
    }
    
    NSUInteger count = viewAry.count;
    for (NSUInteger i = 0; i < count; i++) {
        UIView *view = viewAry[i];
        [self.scrollView addSubview:view];
        if (i == count - 1) {
            [view addSubview:btnShow];
        }
        
        
        
        
    }
    
    
    
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(width * count, height);
    self.scrollView.delegate = self;
    

    self.pageControl.userInteractionEnabled = NO;
    self.pageControl.numberOfPages = viewAry.count;
    self.pageControl.currentPage = 0;
}
- (void)initializeAction
{
    
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
