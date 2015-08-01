//
//  ZXNewFeatureVC.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXNewFeatureVC.h"
#import "ZXTabBarVC.h"
#import "ZXAccount.h"
#import "ZXAccountTool.h"
#import "ZXLoginVC.h"
#import "ZXCustomNavigation.h"

#define kPageCount 4

@interface ZXNewFeatureVC ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation ZXNewFeatureVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setContent];
}
- (void)setContent
{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.contentSize = CGSizeMake(kPageCount * scrollView.width, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i<kPageCount; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        NSString *name = [NSString stringWithFormat:@"newFeature_%d", i];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        if (i == kPageCount - 1)
        {
            [self setupLastImageView:imageView];
        }
    }
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = kPageCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = color(235, 67, 67);
    pageControl.pageIndicatorTintColor = color(255, 255, 255);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 50;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
}
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.7;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    // 2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateHighlighted];
    startBtn.size = startBtn.currentBackgroundImage.size;
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.8;
    startBtn.layer.masksToBounds = YES;
    startBtn.layer.cornerRadius = 5;
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
}
- (void)shareClick:(UIButton *)shareBtn
{
    shareBtn.selected = !shareBtn.isSelected;
}
- (void)startClick
{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    ZXAccount *account = [ZXAccountTool account];
//    if (account)
//    {
//        [window switchRootViewController];
//    }else
//    {
//        window.rootViewController = [[ZXCustomNavigation alloc] initWithRootViewController:[[ZXLoginVC alloc] init]];
//    }
    ZXTabBarVC *tabBar = [[ZXTabBarVC alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
    [tabBar showLogin];
}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
