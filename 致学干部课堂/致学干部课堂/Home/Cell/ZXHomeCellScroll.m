//
//  ZXHomeCellScroll.m
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXHomeCellScroll.h"

@interface ZXHomeCellScroll ()<UIScrollViewDelegate>

@end

@implementation ZXHomeCellScroll
+ (ZXHomeCellScroll *)homeCellScroll
{
    return [[ZXHomeCellScroll alloc] init];
}
- (void)setContentHomeCellScrollWithHeight:(CGFloat)height AndItemNumber:(NSInteger)itemNumber
{
    self.frame = CGRectMake(0, kMargin, kWindowWidth, height);
    self.contentSize = CGSizeMake((height + kMargin) * (itemNumber + 1), height);
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    self.bounces = NO;
    self.delegate = self;
    
    for (int i = 0; i < itemNumber; i++)
    {
        UIButton *subBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, height, height)];
        subBtn.backgroundColor = randomColor;
        subBtn.tag = i;
        [subBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:subBtn];
    }
}
- (void)clickBtn:(UIButton *)btn
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[@"index"] = [NSString stringWithFormat:@"%ld",(long)btn.tag];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ZXHomeCellScrollSelectedNotificaion" object:nil userInfo:userInfo];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger subViewsCount = self.subviews.count;
    float btnWH = self.height;
    for (int i = 0; i < subViewsCount; i++)
    {
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake((btnWH + kMargin) * (i + 1), 0, btnWH, btnWH);
    }
}
#pragma mark -
#pragma mark -scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
//    userInfo[@"offsetX"] = [NSString stringWithFormat:@"%f",scrollView.contentOffset.x];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ZXHomeCellScrollNotificaion" object:self.subviews[0] userInfo:userInfo];
}
@end
