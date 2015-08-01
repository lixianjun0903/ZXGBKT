//
//  ZXMyClassVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyClassVC.h"
#import "ZXMyClassCell.h"
#import "ZXMyClassDetailVC.h"
@interface ZXMyClassVC ()<UITableViewDelegate,UITableViewDataSource>
{

    UITableView * _tableView;
    ZXMyClassCell * cell;
}

@end

@implementation ZXMyClassVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    [self setNavStatus];
    [self createTableView ];
}
-(void)createTableView
{

    _tableView =  [[UITableView alloc] initWithFrame:CGRectMake(0,0, kViewWidth, kViewHeight-64)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.tableHeaderView = [[UIView alloc] init];
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString * CELLID =@"CELLID";
    cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXMyClassCell" owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   [cell.enterClass addTarget:self action:@selector(enterClassClick:) forControlEvents:UIControlEventTouchUpInside];
    return cell
    ;
}
-(void)enterClassClick:(UIButton*)sender
{
    ZXMyClassDetailVC * myClass =[[ZXMyClassDetailVC alloc] init];
    myClass.navTilte = @"青年干部学习1班";
    [self.navigationController pushViewController:myClass animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 260;
}

- (void)setNavStatus
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的班级";
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
