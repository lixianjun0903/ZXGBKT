//
//  ZXPracticeCar.m
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXPracticeCard.h"

@implementation ZXPracticeCard
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = color(54, 54, 54);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        for (int i = 0; i < 49; i++)
        {
            [self setTitle:[NSString stringWithFormat:@"%d",i + 1] tag:i];
        }
    }
    return self;
}
- (void)setTitle:(NSString *)title tag:(NSInteger)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.adjustsImageWhenHighlighted = NO;
    btn.backgroundColor = color(238, 238, 238);
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    btn.tag = tag;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger subViewsCount = self.subviews.count;
    float btnWH = (self.width - 46) / 7;
    for (int i = 0; i < subViewsCount; i++)
    {
        CGFloat col = i % 7;
        CGFloat row = i / 7;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake((btnWH + 5) * col + 8, (btnWH + 5) * row + 15, btnWH, btnWH);
        if (col == 0)
        {
            btn.x = (btnWH + 5) * col + 8;
        }
        if (row == 0)
        {
            btn.y = (btnWH + 5) * row + 15;
        }
        if (i == 0)
        {
            btn.backgroundColor = color(140, 214, 181);
        }
    }
}
- (void)btnClick:(UIButton *)btn
{
    if ([self.practiceCardDelegate respondsToSelector:@selector(practiceCard:DidClickButton:)])
    {
        [self.practiceCardDelegate practiceCard:self  DidClickButton:btn];
    }
}
@end
