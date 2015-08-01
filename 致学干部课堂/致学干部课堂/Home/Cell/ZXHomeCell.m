//
//  ZXHomeCell.m
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXHomeCell.h"
#import "ZXHomeCellScroll.h"
#import "ZXHomeButton.h"

@interface ZXHomeCell () <UIScrollViewDelegate>
@property (nonatomic,strong)ZXHomeButton *headBtn;
@property (nonatomic,strong)UILabel *headLabel;
@property (nonatomic,assign)CGFloat itemWidth;
@property (nonatomic,strong)ZXHomeCellScroll *scrollView;
@end

@implementation ZXHomeCell
+ (ZXHomeCell *)homeCell
{
    return [[ZXHomeCell alloc] init];
}
- (void)setWithHeight:(CGFloat)height DetailText:(NSString *)detailText Text:(NSString *)text Image:(NSString *)image BgColor:(UIColor *)bgColor
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.x = 22;
    titleLabel.height = 25;
    titleLabel.width = 320;
    titleLabel.y = height - 25;
    titleLabel.text = detailText;
    titleLabel.font = [UIFont systemFontOfSize:15];
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        titleLabel.x = 12;
        titleLabel.height = 21;
        titleLabel.y = height - 21;
        titleLabel.font = [UIFont systemFontOfSize:13];
    }
    [self addSubview:titleLabel];
    
    ZXHomeCellScroll *scrollView = [ZXHomeCellScroll homeCellScroll];
    CGFloat scrollHeight = height - kMargin - titleLabel.height;
    [scrollView setContentHomeCellScrollWithHeight:scrollHeight AndItemNumber:6];
    scrollView.delegate = self;
    self.scrollView = scrollView;
    [self addSubview:scrollView];
    
    self.itemWidth = scrollHeight;
    
    ZXHomeButton *headBtn = [[ZXHomeButton alloc] initWithFrame:CGRectMake(0, kMargin, scrollHeight, scrollHeight)];
    [headBtn setTitle:text forState:UIControlStateNormal];
    [headBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    headBtn.imageView.contentMode = UIViewContentModeCenter;
    headBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    headBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        headBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    headBtn.backgroundColor = bgColor;
    headBtn.userInteractionEnabled = NO;
    self.headBtn = headBtn;
    [self addSubview:headBtn];
    
    UILabel *headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kMargin, kMargin * 3, scrollHeight)];
    headLabel.text = text;
    headLabel.backgroundColor = bgColor;
    headLabel.textColor = [UIColor whiteColor];
    headLabel.numberOfLines = 0;
    headLabel.hidden = YES;
    headLabel.font = [UIFont systemFontOfSize:17];
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        headLabel.font = [UIFont systemFontOfSize:16];
    }
    headLabel.textAlignment = NSTextAlignmentCenter;
    self.headLabel = headLabel;
    [self addSubview:headLabel];
}
#pragma mark -
#pragma mark -scrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x < self.itemWidth - 3 * kMargin)
    {
        self.headBtn.imageView.hidden = NO;
        self.headBtn.titleLabel.hidden = NO;
        self.headLabel.hidden = YES;
        CGFloat scale = (self.itemWidth - (scrollView.contentOffset.x)) / self.itemWidth;
        self.headBtn.frame = CGRectMake(0, kMargin, self.itemWidth * scale, self.itemWidth);
        return;
    }else
    {
        self.headBtn.imageView.hidden = YES;
        self.headBtn.titleLabel.hidden = YES;
        self.headLabel.hidden = NO;
    }
    self.headBtn.frame = CGRectMake(0, kMargin, 3 * kMargin, self.itemWidth);

}
- (void)resetContentOffset
{
    self.scrollView.contentOffset = CGPointMake(0, 0);
}
@end
