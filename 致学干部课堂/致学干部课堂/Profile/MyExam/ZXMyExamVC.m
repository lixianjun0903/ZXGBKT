//
//  ZXMyExamVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyExamVC.h"
#import "ZXLabel.h"
#import "ZXMyExamCell.h"
#import "ZXMyExamDetailCell.h"
#import "ZXPracticeVC.h"
#import "ZXExamVC.h"

static NSString *kExamCellIdentifier = @"ZXMyExamCell";
static NSString *kExamDetailCellIdentifier = @"ZXMyExamDetailCell";

@interface ZXMyExamVC ()<UITableViewDataSource,UITableViewDelegate,ZXMyExamCellDelegate>
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *recordDetailArray;
@end

@implementation ZXMyExamVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setTableView];
    [self registerCell];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的考试";
    self.navigationItem.titleView = titleLabel;
}
- (void)setTableView
{
    self.dataArray = [NSMutableArray arrayWithObjects:@"cell",@"cell",@"cell",@"cell",@"cell",nil];
    self.recordDetailArray = [NSMutableArray array];
    for (int i = 0; i < self.dataArray.count; i++)
    {
        UIButton *btn = [[UIButton alloc] init];
        [self.recordDetailArray addObject:btn];
    }
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.width, kViewHeight - 64)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.backgroundColor = color(237, 237, 237);
    customTableView.tableFooterView = [[UIView alloc] init];
    customTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    customTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
}
#pragma mark -注册单元格
- (void)registerCell
{
    UINib *hotNib = [UINib nibWithNibName:@"ZXMyExamCell" bundle:nil];
    [self.customTableView registerNib:hotNib forCellReuseIdentifier:kExamCellIdentifier];
    UINib *newNib = [UINib nibWithNibName:@"ZXMyExamDetailCell" bundle:nil];
    [self.customTableView registerNib:newNib forCellReuseIdentifier:kExamDetailCellIdentifier];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark -Tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataArray[indexPath.row] isEqualToString:@"cell"])
    {
        ZXMyExamCell *cell = [ZXMyExamCell cellWithTableView:tableView];
        [cell setContentWithTitle:nil image:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.examCellDelegate = self;
        return cell;
    }
    if ([self.dataArray[indexPath.row] isEqualToString:@"detail"])
    {
        ZXMyExamDetailCell *cell = [ZXMyExamDetailCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}
#pragma mark -
#pragma mark -Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataArray[indexPath.row] isEqualToString:@"cell"])
    {
        return 260;
    }else
    {
       return 220;
    }
}
#pragma mark -
#pragma mark -scrollview delegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    if (self.customTableView.contentOffset.y > 260)
//    {
//        NSInteger index = (self.customTableView.contentOffset.y - 260) / 260;
//        if ([self.dataArray[index] isEqualToString:@"detail"])
//        {
//            UIButton *btn = self.recordDetailArray[index];
//            btn.selected = !btn.selected;
//            [self.dataArray removeObjectAtIndex:index];
//            self.customTableView.contentOffset = CGPointMake(0, self.customTableView.contentOffset.y - 220);
//            [self.customTableView reloadData];
//        }
//    }
//}
#pragma mark -
#pragma mark -ZXMyExamCellDelegate delegate
- (void)myExamCell:(ZXMyExamCell *)examCell DidClickButton:(UIButton *)btn
{
    btn.selected = !btn.selected;
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    CGRect newFrame = [btn convertRect:btn.frame toView:window];
    NSInteger index = self.dataArray.count * ((newFrame.origin.y + self.customTableView.contentOffset.y) / self.customTableView.contentSize.height);
    switch (btn.tag)
    {
        case ZXMyExamCellButtonTypeDetail:
        {
            if (btn.selected)
            {
                [self.dataArray insertObject:@"detail" atIndex:index];
                [self.recordDetailArray replaceObjectAtIndex:index - 1 withObject:btn];
            }else
            {
                [self.dataArray removeObjectAtIndex:index];
                UIButton *tempBtn = [[UIButton alloc] init];
                [self.recordDetailArray replaceObjectAtIndex:index - 1 withObject:tempBtn];
            }
            [self.customTableView reloadData];
            break;
        }
        case ZXMyExamCellButtonTypePratice:
            [self.navigationController pushViewController:[[ZXPracticeVC alloc] init] animated:YES];
            break;
        case ZXMyExamCellButtonTypeExam:
            [self.navigationController pushViewController:[[ZXExamVC alloc] init] animated:YES];
            break;
    }
}
@end
