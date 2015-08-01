//
//  MainViewController.m
//  干部在线
//
//  Created by lixianjun on 14-12-29.
//  Copyright (c) 2014年 中青年. All rights reserved.
//

#import "MainViewController.h"
#include "ZXHomeVC.h"
#include "ZXCourseVC.h"
#include "ZXAnswerVC.h"
#include "ZXMeTableVC.h"
#import "ZXCustomNavigation.h"
@interface MainViewController ()

{

    SelectTabBar * _SectTabView;

}
@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    self.tabBar.alpha = 0.6;
    //self.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
    
    
}
#pragma mark ---创建takeview
-(void)createView
{
    ZXHomeVC * first = [[ZXHomeVC alloc] init];
    ZXCustomNavigation * nc1 = [[ZXCustomNavigation alloc] initWithRootViewController:first];
//    nc1.navigationBar.translucent = NO;
    nc1.interactivePopGestureRecognizer.enabled = NO;
    ZXCourseVC * elect = [[ZXCourseVC alloc] init];
    ZXCustomNavigation * nc2 = [[ZXCustomNavigation alloc] initWithRootViewController:elect];
//    nc2.navigationBar.translucent = NO;
    ZXAnswerVC * infor = [[ZXAnswerVC alloc] init];
    ZXCustomNavigation * nc3 = [[ZXCustomNavigation alloc] initWithRootViewController:infor];
//    nc3.navigationBar.translucent = NO;
    ZXMeTableVC * my =[[ZXMeTableVC alloc] init];
    ZXCustomNavigation * nc4 = [[ZXCustomNavigation alloc] initWithRootViewController:my];
//    nc4.navigationBar.translucent = NO;
    NSArray * array = @[nc1,nc2,nc3,nc4];
    self.viewControllers = array;
    self.selectedIndex = 0;
    _SectTabView = [[SelectTabBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 49)];
    _SectTabView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin;
    _SectTabView.delegate = self;
    [self.tabBar addSubview:_SectTabView];
//    NSLog(@"tabbar %@", self.tabBar);
    [self OnTabSelect:_SectTabView];
}
- (void)OnTabSelect:(SelectTabBar *)sender {
    int index = sender.miIndex;
//    NSLog(@"OnTabSelect:%d", index);
    self.selectedIndex = index;
    [self.tabBar bringSubviewToFront:_SectTabView];
}
- (BOOL)CanSelectTab:(SelectTabBar *)sender :(int)index
{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
