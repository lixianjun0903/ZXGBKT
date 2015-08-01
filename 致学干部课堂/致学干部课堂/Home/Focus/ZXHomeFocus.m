//
//  ZXHomeFocus.m
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXHomeFocus.h"

//#define kWindowWidth [UIApplication sharedApplication].keyWindow.width

@implementation ZXHomeFocus
+ (UIScrollView *)scrollViewWithRect:(CGRect)rect pageNumber:(NSInteger)pageCount
{
    NSInteger count = pageCount + 1;
    ZXHomeFocus *scrollView = [[ZXHomeFocus alloc] initWithFrame:rect];
    scrollView.contentSize = CGSizeMake(kWindowWidth * count, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    for (int i = 0; i < count; i++)
    {
        UIImageView *subImageView = [[UIImageView alloc] init];
        subImageView.contentMode = UIViewContentModeScaleAspectFill;
        NSString *imageStr = [NSString stringWithFormat:@"home_focus_%d",i+1];
        if (i == 3)
        {
            imageStr = @"home_focus_1";
        }
        subImageView.image = [UIImage imageNamed:imageStr];
        [scrollView addSubview:subImageView];
    }
    
    return scrollView;
}
- (void)setContentWith:(id)sender
{
    
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++)
    {
        UIImageView *subImageView = self.subviews[i];
        subImageView.frame = CGRectMake(kWindowWidth * i, 0, kWindowWidth, 160);
    }
}
@end
