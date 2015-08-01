//
//  ZXMyMessageVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyMessageVC.h"
#import "ZXLabel.h"
#import "ZXButton.h"
#import "ZXMessageVC.h"
#import "ZXRemindVC.h"

@interface ZXMyMessageVC ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIButton *messageBtn;
@property (nonatomic,strong)UIButton *remindBtn;
@property (nonatomic,strong)UIView *bottomLine;
@property (nonatomic,strong)ZXMessageVC *messageVC;
@property (nonatomic,strong)ZXRemindVC *remindVC;
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation ZXMyMessageVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = color(237, 237, 237);
    
    [self setNavStatus];
    [self setTopContent];
    [self setcontent];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"消息提醒";
    self.navigationItem.titleView = titleLabel;
    
    ZXButton *allReadBtn = [[ZXButton alloc] initWithFrame:CGRectMake(0, 0, 70, 44)];
    [allReadBtn setTitle:@"全部已读" forState:UIControlStateNormal];
    [allReadBtn addTarget:self action:@selector(allReaded:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:allReadBtn];
}
- (void)allReaded:(UIButton *)btn
{
    if (self.messageBtn.selected)
    {
        [self.messageVC allReaded];
    }else
    {
        [self.remindVC allreaded];
    }
}
- (void)setTopContent
{
    UIView  *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 44)];
    bgView.backgroundColor = color(255, 255, 255);
    UIButton *messageBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kViewWidth / 2 - 0.5, 44)];
    [messageBtn setTitle:@"消息" forState:UIControlStateNormal];
    [messageBtn setTitleColor:color(51, 51, 51) forState:UIControlStateNormal];
    [messageBtn setTitleColor:color(235, 99, 99) forState:UIControlStateSelected];
    messageBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [messageBtn addTarget:self action:@selector(messageView:) forControlEvents:UIControlEventTouchUpInside];
    messageBtn.selected = YES;
    messageBtn.userInteractionEnabled = NO;
    self.messageBtn = messageBtn;
    [bgView addSubview:messageBtn];
    
    UIButton *remindBtn = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth / 2 + 0.5, 0, kViewWidth / 2 - 0.5, 44)];
    [remindBtn setTitle:@"提醒" forState:UIControlStateNormal];
    [remindBtn setTitleColor:color(51, 51, 51) forState:UIControlStateNormal];
    [remindBtn setTitleColor:color(235, 99, 99) forState:UIControlStateSelected];
    remindBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [remindBtn addTarget:self action:@selector(remindView:) forControlEvents:UIControlEventTouchUpInside];
    self.remindBtn = remindBtn;
    [bgView addSubview:remindBtn];
    
    UIView *middleLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(messageBtn.frame), 15, 1, 15)];
    middleLine.backgroundColor = color(204, 204, 204);
    [bgView addSubview:middleLine];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.height = 2;
    bottomLine.width = 87;
    bottomLine.y = CGRectGetMaxY(messageBtn.frame) - 2;
    bottomLine.centerX = CGRectGetMidX(messageBtn.frame);
    bottomLine.backgroundColor = color(235, 99, 99);
    self.bottomLine = bottomLine;
    [bgView addSubview:bottomLine];
    
    [self.view addSubview:bgView];
}
- (void)messageView:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.remindBtn.selected = !btn.selected;
    if (btn.selected)
    {
        btn.userInteractionEnabled = NO;
        self.remindBtn.userInteractionEnabled  = YES;
        [UIView animateWithDuration:0.3 animations:^{
            self.bottomLine.centerX = CGRectGetMidX(btn.frame);
            self.scrollView.contentOffset = CGPointZero;
        }];
    }
}
- (void)remindView:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.messageBtn.selected = !btn.selected;
    if (btn.selected)
    {
        btn.userInteractionEnabled = NO;
        self.messageBtn.userInteractionEnabled = YES;
        [UIView animateWithDuration:0.3 animations:^{
            self.bottomLine.centerX = CGRectGetMidX(btn.frame);
            self.scrollView.contentOffset = CGPointMake(kViewWidth, 0);
        }];
    }
}
- (void)setcontent
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.messageBtn.frame), kViewWidth, kViewHeight - CGRectGetMaxY(self.messageBtn.frame) - 64)];
    scrollView.contentSize = CGSizeMake(kViewWidth * 2, scrollView.height);
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    
    ZXMessageVC *messageVC = [[ZXMessageVC alloc] init];
    messageVC.view.frame = CGRectMake(0, 0, kViewWidth, kViewHeight - CGRectGetMaxY(self.messageBtn.frame) - 64);
    self.messageVC = messageVC;
    [scrollView addSubview:messageVC.view];
    
    ZXRemindVC *remindVC = [[ZXRemindVC alloc] init];
    remindVC.view.frame = CGRectMake(kViewWidth, 0, kViewWidth, kViewHeight - CGRectGetMaxY(self.messageBtn.frame) - 64);
    self.remindVC = remindVC;
    [scrollView addSubview:remindVC.view];
    
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}
#pragma mark -UIScrollView delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    BOOL index = scrollView.contentOffset.x / kViewWidth;
    self.messageBtn.selected = !index;
    self.messageBtn.userInteractionEnabled = index;
    self.remindBtn.selected = index;
    self.remindBtn.userInteractionEnabled = !index;
    if (self.remindBtn.selected)
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.bottomLine.centerX = CGRectGetMidX(self.remindBtn.frame);
        }];
    }else
    {
        [UIView animateWithDuration:0.25 animations:^{
            self.bottomLine.centerX = CGRectGetMidX(self.messageBtn.frame);
        }];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
