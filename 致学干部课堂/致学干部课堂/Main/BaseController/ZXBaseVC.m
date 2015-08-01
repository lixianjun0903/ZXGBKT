//
//  ZXBaseVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXBaseVC.h"

@interface ZXBaseVC ()
@property (nonatomic,strong)UIView *statusBarView;
@end

@implementation ZXBaseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end
