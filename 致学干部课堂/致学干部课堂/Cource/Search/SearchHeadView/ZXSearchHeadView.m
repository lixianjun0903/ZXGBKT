//
//  ZXSearchHeadView.m
//  致学在线
//
//  Created by zhixue on 15/5/11.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSearchHeadView.h"

@interface ZXSearchHeadView ()
@property (nonatomic,assign)CGFloat subX;
@property (nonatomic,assign)CGFloat contentWidth;
@end

@implementation ZXSearchHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.subX = 0;
        [self addTitle:@"热搜"];
//        self.contentSize = CGSizeMake(kWindowWidth * 2, self.height);
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}
- (void)addTitle:(NSString *)str
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    CGSize size = [str boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    self.contentWidth += (2 * kMargin + kMargin + size.width);
    self.contentSize = CGSizeMake(self.contentWidth, 44);
    
    UIButton *subBtn = [[UIButton alloc] init];
    [subBtn setTitle:str forState:UIControlStateNormal];
    subBtn.layer.masksToBounds = YES;
    subBtn.layer.cornerRadius = 4;
    [subBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    subBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    subBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [subBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:subBtn];
    
    [self setNeedsLayout];
}
- (void)clickButton:(UIButton *)btn
{
    if ([self.searchHeadDelegate respondsToSelector:@selector(searchHeadView:DidClickButton:)])
    {
        [self.searchHeadDelegate searchHeadView:self DidClickButton:btn];
    }
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger subViewsCount = self.subviews.count;
    for (int i = 0; i < subViewsCount; i++)
    {
        float btnH = self.height;
        UIButton *btn = self.subviews[i];
        NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
        CGSize size = [btn.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
        btn.frame = CGRectMake(self.subX + kMargin, 10, size.width + 2 * kMargin, btnH - 20);
        if (i != 0)
        {
            btn.backgroundColor = color(255, 255, 255);
        }
        if (i == 0)
        {
            btn.titleLabel.font = [UIFont systemFontOfSize:17];
            btn.frame = CGRectMake(0, 0, size.width + 2 * kMargin, btnH);
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
            btn.userInteractionEnabled = NO;
        }
        self.subX = CGRectGetMaxX(btn.frame);
    }
}
@end
