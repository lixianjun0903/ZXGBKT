//
//  ZXMeTableVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMeTableVC.h"
#import "ZXLabel.h"
#import "ZXProfileHead.h"
#import "ZXLoginVC.h"
#import "ZXCustomNavigation.h"
#import "ZXMyCourseVC.h"
#import "ZXMyExamVC.h"
#import "ZXMyClassVC.h"
#import "ZXMyRecordVC.h"
#import "ZXMyDownloadVC.h"
#import "ZXMyCollectVC.h"
#import "ZXMyMessageVC.h"
#import "ZXSetVC.h"
#import "ZXAboutUsVC.h"
#import "ZXEveryWeekVC.h"
#import "ZXPersonalVC.h"

@interface ZXMeTableVC ()<UITableViewDataSource,UITableViewDelegate,ZXProfileHeadDelegate>
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)ZXProfileHead *tableHeadView;
@property (nonatomic,strong)NSArray *cellIconArray;
@property (nonatomic,strong)NSArray *cellTitleArray;
@end

@implementation ZXMeTableVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setTableView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectionIcon:) name:@"SelectionIconFromLib" object:nil];
}
- (void)setNavStatus
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [btn setTitle:@"登录" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"个人中心";
    self.navigationItem.titleView = titleLabel;
}
- (void)push
{
    [self presentViewController:[[ZXCustomNavigation alloc] initWithRootViewController:[[ZXLoginVC alloc] init]] animated:YES completion:nil];
}
- (void)setTableView
{
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.scrollEnabled = YES;
    customTableView.tableFooterView = [[UIView alloc] init];
    customTableView.scrollEnabled = NO;
    customTableView.backgroundColor = [UIColor clearColor];
    
    ZXProfileHead *tableHeadView = [ZXProfileHead tableHeadView];
    tableHeadView.headDelegate = self;
    self.tableHeadView = tableHeadView;
    [tableHeadView setcontentWithWidth:self.view.width];
    
    customTableView.tableHeaderView = tableHeadView;
    customTableView.tableFooterView = [[UIView alloc] init];
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
    
     self.cellIconArray = [NSArray arrayWithObjects:@"profile_archive", @"profile_download", @"profile_collect", @"profile_message", @"profle_set",@"profile_about",nil];
    self.cellTitleArray = [NSArray arrayWithObjects:@"我的档案", @"我的下载", @"我的收藏", @"消息提醒", @"系统设置",@"关于我们",nil];
}
- (void)selectionIcon:(NSNotification *)notification
{
    [self.tableHeadView setIconImage:notification.userInfo[@"image"]];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 30)];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.customTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.customTableView setLayoutMargins:UIEdgeInsetsZero];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 2 ? 0:3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"HomeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSInteger index = indexPath.section * 3 + indexPath.row;
    cell.textLabel.text = self.cellTitleArray[index];
    cell.imageView.image = [UIImage imageNamed:self.cellIconArray[index]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selectionStyle = UITableViewCellSelectionStyleGray;
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                [self pushToViewController:[[ZXMyRecordVC alloc] init]];
                break;
            case 1:
                [self pushToViewController:[[ZXMyDownloadVC alloc] init]];
                break;
            case 2:
                [self pushToViewController:[[ZXMyCollectVC alloc] init]];
                break;
        }
    }else
    {
        switch (indexPath.row)
        {
            case 0:
                [self pushToViewController:[[ZXMyMessageVC alloc] init]];
                break;
            case 1:
                [self pushToViewController:[[ZXSetVC alloc] init]];
                break;
            case 2:
                [self pushToViewController:[[ZXAboutUsVC alloc] init]];
                break;
        }
    }
}
- (void)pushToViewController:(UIViewController *)ViewController
{
    [self.navigationController pushViewController:ViewController animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        return 44;
    }
    return 60;
}
#pragma mark -
#pragma mark headView delegate
- (void)headView:(ZXProfileHead *)headView DidClickButton:(ZXProfileHeadButtonType)buttonType
{
    switch (buttonType)
    {
        case ZXProfileHeadButtonTypeIcon:
        {
            [self pushToViewController:[[ZXPersonalVC alloc] init]];
            break;
        }
        case ZXProfileHeadButtonTypeCourse:
        {
            [self pushToViewController:[[ZXMyCourseVC alloc] init]];
            break;
        }
        case ZXProfileHeadButtonTypeExam:
        {
            [self pushToViewController:[[ZXMyExamVC alloc] init]];
            break;
        }
        case ZXProfileHeadButtonTypeClass:
        {
            [self pushToViewController:[[ZXMyClassVC alloc] init]];
            break;
        }
    }
}
@end
