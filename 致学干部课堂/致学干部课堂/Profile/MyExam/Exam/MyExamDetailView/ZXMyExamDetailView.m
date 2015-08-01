//
//  ZXMyExamDetailView.m
//  致学在线
//
//  Created by zhixue on 15/5/13.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyExamDetailView.h"

@interface ZXMyExamDetailView ()
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation ZXMyExamDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, kWindowWidth, frame.size.height)];
        imageView.image = [UIImage imageNamed:@"profile_mycourse_detail"];
        [self addSubview:imageView];
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 15, kWindowWidth, frame.size.height - 10)];
        scrollView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        
        UILabel *introLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, 0, scrollView.width - 4, 25)];
        introLabel.text = @"考试简介:";
        introLabel.font = [UIFont systemFontOfSize:14];
        introLabel.backgroundColor = color(237, 237, 237);
        introLabel.textColor = color(51, 51, 51);
        introLabel.textAlignment = NSTextAlignmentLeft;
        introLabel.userInteractionEnabled = NO;
        [scrollView addSubview:introLabel];
        
        UILabel *introContent = [[UILabel alloc] initWithFrame:CGRectMake(2, CGRectGetMaxY(introLabel.frame), scrollView.width - 4, 60)];
        introContent.text = @"      为贯彻落实团的十七大、十七届二中全会精神，团中央决定于2014年对全国地市级团委班子成员和县级团委书记进行全员轮训。";
        introContent.font = [UIFont systemFontOfSize:14];
        introContent.textColor = color(85, 85, 85);
        introContent.textAlignment = NSTextAlignmentLeft;
        introContent.numberOfLines = 0;
        introContent.userInteractionEnabled = NO;
        [scrollView addSubview:introContent];
        
        UILabel *requireLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, CGRectGetMaxY(introContent.frame), scrollView.width - 4, 25)];
        requireLabel.text = @"考试要求:";
        requireLabel.font = [UIFont systemFontOfSize:14];
        requireLabel.backgroundColor = color(237, 237, 237);
        requireLabel.textColor = color(51, 51, 51);
        requireLabel.textAlignment = NSTextAlignmentLeft;
        requireLabel.userInteractionEnabled = NO;
        [scrollView addSubview:requireLabel];
        
        UILabel *requireContent = [[UILabel alloc] initWithFrame:CGRectMake(2, CGRectGetMaxY(requireLabel.frame), scrollView.width - 4, 60)];
        requireContent.text = @"      培训期间将就团干部应知应会知识点组织一次闭卷考试，参训学员要提前认真学习考试重点参考篇目,考试成绩不合格者将不予发放结业证书。";
        requireContent.font = [UIFont systemFontOfSize:14];
        requireContent.textColor = color(85, 85, 85);
        requireContent.textAlignment = NSTextAlignmentLeft;
        requireContent.numberOfLines = 0;
        requireContent.userInteractionEnabled = NO;
        [scrollView addSubview:requireContent];
        
        UILabel *qualifiLabel = [[UILabel alloc] initWithFrame:CGRectMake(2, CGRectGetMaxY(requireContent.frame), scrollView.width - 4, 25)];
        qualifiLabel.text = @"考试资格:";
        qualifiLabel.font = [UIFont systemFontOfSize:14];
        qualifiLabel.backgroundColor = color(237, 237, 237);
        qualifiLabel.textColor = color(51, 51, 51);
        qualifiLabel.textAlignment = NSTextAlignmentLeft;
        qualifiLabel.userInteractionEnabled = NO;
        [scrollView addSubview:qualifiLabel];
        
        UILabel *qualifiContent = [[UILabel alloc] initWithFrame:CGRectMake(2, CGRectGetMaxY(qualifiLabel.frame), scrollView.width - 4, 60)];
        qualifiContent.text = @"      培训期间将就团干部应知应会知识点组织一次闭卷考试，参训学员要提前认真学习考试重点参考篇目,考试成绩不合格者将不予发放结业证书。";
        qualifiContent.font = [UIFont systemFontOfSize:14];
        qualifiContent.textColor = color(85, 85, 85);
        qualifiContent.textAlignment = NSTextAlignmentLeft;
        qualifiContent.numberOfLines = 0;
        qualifiContent.userInteractionEnabled = NO;
        [scrollView addSubview:qualifiContent];
        
        scrollView.contentSize = CGSizeMake(kWindowWidth - 20, CGRectGetMaxY(qualifiContent.frame) + kMargin);
        self.scrollView = scrollView;
        [self addSubview:scrollView];
    }
    return self;
}
@end
