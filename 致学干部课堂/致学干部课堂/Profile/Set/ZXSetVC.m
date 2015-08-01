//
//  ZXSetVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSetVC.h"
#import "ZXSetView.h"
@interface ZXSetVC ()

@end

@implementation ZXSetVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
  [self createView];
}
-(void)createView
{
    ZXSetView * setView = [ZXSetView setView];
    [self.view addSubview:setView];
    setView.frame = CGRectMake(0, 20, kViewWidth, 300);
    [setView.newsPushSwitch addTarget:self action:@selector(newsPushClick:) forControlEvents:UIControlEventValueChanged];
    [setView.downloadSwitch addTarget:self action:@selector(downloadClick:) forControlEvents:UIControlEventValueChanged];
    
}
-(void)newsPushClick:(id)sender
{
    UISwitch *newSwitch=(UISwitch *)sender;
  
    if (newSwitch.isOn) {
   
        NSLog(@"On");
    
    }else{
     
        NSLog(@"Off");
    
    }

}
-(void)downloadClick:(id)sender
{
    UISwitch * downLoadSwitch = (UISwitch *)sender;
    if (downLoadSwitch.isOn) {
        NSLog(@"On");
    }else
    {
        NSLog(@"OFF");
    }
    

}
- (void)setNavStatus
{
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"系统设置";
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
