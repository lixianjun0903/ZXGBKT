//
//  ZXAboutUsVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXAboutUsVC.h"

@interface ZXAboutUsVC ()
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;

@end

@implementation ZXAboutUsVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"关于我们";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}
- (void)setcontent
{
    self.showImageView.layer.masksToBounds = YES;
    self.showImageView.layer.cornerRadius = 5;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
