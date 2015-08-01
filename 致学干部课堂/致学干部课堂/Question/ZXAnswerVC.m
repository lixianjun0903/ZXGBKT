//
//  ZXAnswerVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXAnswerVC.h"
#import "ZXLabel.h"

@interface ZXAnswerVC ()

@end

@implementation ZXAnswerVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"答题";
    self.navigationItem.titleView = titleLabel;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
