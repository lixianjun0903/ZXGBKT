//
//  ZXMessageVC.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/21.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMessageVC.h"
#import "ZXLabel.h"
#import "ZXButton.h"
#import "ZXMyMessageCell.h"

@interface ZXMessageVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UIButton *messageBtn;
@property (nonatomic,strong)UIButton *remindBtn;
@property (nonatomic,strong)UIView *bottomLine;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)UITableView *customTableView;
@end

@implementation ZXMessageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTableView];
}
- (void)setTableView
{
    self.titleArray = [NSMutableArray arrayWithObjects:@"最近讲话“习近平讲话”已上架",
                                                       @"恭喜您完场XXXX课程，获得三个学分，继续加油！",
                                                       @"新版本已上线，欢迎大家体验！",
                                                       @"最近讲话“习近平讲话”已上架",
                                                       @"恭喜您完场XXXX课程，获得三个学分，继续加油！",
                                                       @"新版本已上线，欢迎大家体验！",
                                                       nil];
    self.dataArray = [NSMutableArray arrayWithObjects:@"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      @"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      @"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      @"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      @"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      @"考试的重点、难点、热点，结合多个案例进行权威生动的剖析。",
                                                      nil];
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 108)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    customTableView.tableFooterView = [[UIView alloc] init];
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXMyMessageCell *cell = [ZXMyMessageCell cellWithTableView:tableView];
    NSInteger index = indexPath.row;
    [cell setContentWithTitle:self.titleArray[index] content:self.dataArray[index] IsNew:(index == 0 ? 0 : 1)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 31)];
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, kViewWidth, 31)];
    dateLabel.text = @"2015-5-22";
    dateLabel.font = [UIFont systemFontOfSize:15];
    dateLabel.textColor = color(51, 51, 51);
    bgView.backgroundColor = color(238, 238, 238);
    [bgView addSubview:dateLabel];
    if (section == 1)
    {
        dateLabel.text = @"2015-5-21";
    }
    if (section == 2)
    {
        dateLabel.text = @"2015-5-20";
    }
    return bgView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 31;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lu",(long)indexPath.row);
}
- (void)allReaded
{
    for (NSIndexPath *cellIndex in [self.customTableView indexPathsForVisibleRows])
    {
        ZXMyMessageCell *cell = (ZXMyMessageCell *)[self.customTableView cellForRowAtIndexPath:cellIndex];
        [cell readed];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
