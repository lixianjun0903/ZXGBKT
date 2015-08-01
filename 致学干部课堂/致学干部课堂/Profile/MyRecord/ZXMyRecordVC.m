//
//  ZXMyRecordVC.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/21.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyRecordVC.h"

@interface ZXMyRecordVC ()
@property (weak, nonatomic) IBOutlet UILabel *finishHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *allHourLabel;
@property (weak, nonatomic) IBOutlet UILabel *scanLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
@property (weak, nonatomic) IBOutlet UILabel *appearLabel;

@end

@implementation ZXMyRecordVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
}
- (void)setNavStatus
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的档案";
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = titleLabel;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
