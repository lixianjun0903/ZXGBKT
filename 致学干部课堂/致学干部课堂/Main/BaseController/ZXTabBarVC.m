//
//  ZXTabBarVC.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXTabBarVC.h"
#import "ZXHomeVC.h"
#import "ZXCourseVC.h"
#import "ZXAnswerVC.h"
#import "ZXMeTableVC.h"
#import "ZXCustomNavigation.h"
#import "ZXLoginVC.h"
#import "ZXAccountTool.h"
#import "ZXAccount.h"

@interface ZXTabBarVC ()

@end

@implementation ZXTabBarVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.tintColor = color(235, 67, 67);
    
    ZXHomeVC *home = [[ZXHomeVC alloc] init];
    [self addSubViewControl:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted"];
    
    ZXCourseVC *message = [[ZXCourseVC alloc] init];
    [self addSubViewControl:message title:@"课程" image:@"tabbar_course" selectedImage:@"tabbar_course_highlighted"];
    
    ZXAnswerVC *discover = [[ZXAnswerVC alloc] init];
    [self addSubViewControl:discover title:@"答题" image:@"tabbar_question" selectedImage:@"tabbar_question_highlighted"];
    
    ZXMeTableVC *me = [[ZXMeTableVC alloc] init];
    [self addSubViewControl:me title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_highligted"];
}

- (void)addSubViewControl:(UIViewController *)subVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed:image];
    subVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZXCustomNavigation *nav = [[ZXCustomNavigation alloc] initWithRootViewController:subVC];
    [self addChildViewController:nav];
}
- (void)showLogin
{
    ZXAccount *account = [ZXAccountTool account];
    if (account == nil)
    {
        [self presentViewController:[[ZXCustomNavigation alloc] initWithRootViewController:[[ZXLoginVC alloc] init]] animated:YES completion:nil];
    }
}
@end
