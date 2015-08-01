//
//  ZXExamToolBar.m
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXExamToolBar.h"

@implementation ZXExamToolBar
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = color(255, 255, 255);
        [self setBtn:@"card" HighImage:@"card_highlight" Title:@"答题卡" tag:ZXExamToolBarButtonTypeAnswerCard];
        [self setBtn:@"save" HighImage:@"save_highlight" Title:@"保存" tag:ZXExamToolBarButtonTypeSave];
        [self setBtn:@"submit" HighImage:@"submit_highlight" Title:@"交卷" tag:ZXExamToolBarButtonTypeSubmit];
    }
    return self;
}
- (void)setBtn:(NSString *)image HighImage:(NSString *)highImage Title:(NSString *)title tag:(ZXExamToolBarButtonType)ButtonType
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
//    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateSelected];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
//    [btn setTitleColor:color(255, 255, 255) forState:UIControlStateHighlighted];
    [btn setTitleColor:color(255, 255, 255) forState:UIControlStateSelected];
//    [btn setBackgroundImage:[UIImage imageNamed:@"exam_bg"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage imageNamed:@"exam_bg"] forState:UIControlStateSelected];
    btn.adjustsImageWhenHighlighted = NO;
    btn.backgroundColor = color(255, 255, 255);
    btn.contentMode = UIViewContentModeCenter;
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.tag = ButtonType;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //    NSInteger subViewsCount = self.subviews.count;
    float btnW = self.width / 3;
    float btnH = self.height;
    for (int i = 0; i < 3; i++)
    {
        UIButton *btn = self.subviews[i];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
        if (i != 0)
        {
            btn.x = btnW * i + 1;
            btn.width = btnW - 1;
        }
    }
    
    UIView *leftLineView = [[UIView alloc] initWithFrame:CGRectMake(self.width / 3, 15, 1, 20)];
    leftLineView.backgroundColor = color(204, 204, 204);
    [self addSubview:leftLineView];
    UIView *rightLineView = [[UIView alloc] initWithFrame:CGRectMake((self.width / 3) * 2, 15, 1, 20)];
    rightLineView.backgroundColor = color(204, 204, 204);
    [self addSubview:rightLineView];
}
- (void)btnClick:(UIButton *)btn
{
    if ([self.examDelegate respondsToSelector:@selector(examToolBar:DidClickButton:)])
    {
        [self.examDelegate examToolBar:self  DidClickButton:btn];
    }
}

@end
