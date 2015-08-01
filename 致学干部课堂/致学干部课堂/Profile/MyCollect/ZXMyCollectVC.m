//
//  ZXCollectVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyCollectVC.h"
#import "ZXMyCollectCell.h"
#import "ZXLabel.h"

#define kCellNumber 6

@interface ZXMyCollectVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *customTableView;
@property(nonatomic,strong)UIButton * ediBtn;
@property (nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIButton * deleteBtn;
@property(nonatomic,strong)UIButton * selectAllBtn;
@property(nonatomic,strong)NSMutableDictionary * deleteDic;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@end

@implementation ZXMyCollectVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTableView];
    [self setNavStatus];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的收藏";
    self.navigationItem.titleView = titleLabel;
    
    self.deleteDic =[[NSMutableDictionary alloc]init];
    
    UIButton *ediBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 20)];
    [ediBtn addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [ediBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [ediBtn setTitle:@"取消" forState:UIControlStateSelected];
    self.ediBtn = ediBtn;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:ediBtn];
    
    CGFloat width = (kViewWidth - 40) / 2;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, kViewHeight-50, kViewWidth, 50)];
    bgView.backgroundColor = color(255, 255, 255);
    bgView.alpha = 0.0;
    
    UIButton *selectAllBtn = [[UIButton alloc] initWithFrame:CGRectMake(kMargin,5,width,40)];
    [selectAllBtn addTarget:self action:@selector(selectAllButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    [selectAllBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    [selectAllBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    selectAllBtn.backgroundColor = color(235, 67, 67);
    selectAllBtn.layer.masksToBounds = YES;
    selectAllBtn.layer.cornerRadius = 5;
    self.selectAllBtn = selectAllBtn;
    [bgView addSubview:selectAllBtn];
    
    UIButton *deleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(selectAllBtn.frame) + 2 * kMargin,5,width,40)];
    [deleteBtn addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    deleteBtn.backgroundColor = color(204, 204, 204);
    deleteBtn.layer.masksToBounds = YES;
    deleteBtn.layer.cornerRadius = 5;
    self.deleteBtn = deleteBtn;
    [bgView addSubview:deleteBtn];
    
     self.bgView = bgView;
   
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
}
- (void)editButtonClick:(UIButton*)btn
{
    btn.selected = !btn.selected;
    [UIView animateWithDuration:0.6 animations:^{
        self.bgView.alpha = btn.selected ? 1.0:0.0;
    }];
    if (btn.selected)
    {
        [self.customTableView setEditing:YES animated:true];
        self.customTableView.height -= 50;
    }
    if (!btn.selected)
    {
        [self.customTableView setEditing:NO animated:true];
        [self.deleteDic removeAllObjects];
        self.customTableView.height += 50;
    }
    [self setDeleteBtnStatus];
}
- (void)deleteButtonClick
{
    [self.customTableView beginUpdates];
    [self.dataArray removeObjectsInArray:[self.deleteDic allKeys]];
    [self.customTableView deleteRowsAtIndexPaths:[NSArray arrayWithArray:[self.deleteDic allValues]] withRowAnimation:UITableViewRowAnimationFade];
    [self.deleteDic removeAllObjects];
    [self.customTableView endUpdates];
    [self setDeleteBtnStatus];
    [self setEditButtonStatus];
}
- (void)selectAllButtonClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    for (int i = 0; i < self.dataArray.count; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        if (btn.isSelected)
        {
            [self tableView:self.customTableView didSelectRowAtIndexPath:indexPath];
        }
        if (!btn.isSelected)
        {
            [self tableView:self.customTableView didDeselectRowAtIndexPath:indexPath];
            [self.deleteDic removeAllObjects];
        }
    }

    [self setDeleteBtnStatus];
}
- (void)setEditButtonStatus
{
    if (self.dataArray.count != 0)
    {
        [self.ediBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.ediBtn.enabled = YES;
    }else
    {
        self.ediBtn.enabled = NO;
        [self.ediBtn setTitleColor:color(167, 167, 167) forState:UIControlStateNormal];
        [UIView animateWithDuration:0.6 animations:^{
            self.bgView.alpha = 0.0;
        }];
    }
}
- (void)setDeleteBtnStatus
{
    self.deleteDic.count == 0 ? (self.deleteBtn.backgroundColor = color(204, 204, 204)) : (self.deleteBtn.backgroundColor = color(235, 67, 67));
    if (self.deleteDic.count != 0)
    {
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除 (%ld)",(unsigned long)self.deleteDic.count] forState:UIControlStateNormal];
        return;
    }
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
}
- (void)setTableView
{
    self.dataArray = [NSMutableArray arrayWithObjects:@"大象理财版上线公告",
                                                      @"优化实名认证规则公告",
                                                      @"新一轮注册送红包活动",
                                                      @"您有一张10元的现金红包",
                                                      @"您有一张20元的现金红包",
                                                      @"您有一张30元的现金红包",
                                                      @"您有一张32元的现金红包",
                                                      @"您有一张33元的现金红包",
                                                      @"您有一张35元的现金红包",
                                                      @"您有一张36元的现金红包",
                                                        nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"image_1",
                                                      @"image_2",
                                                      @"image_3",
                                                      @"image_1",
                                                      @"image_2",
                                                      @"image_3",
                                                      @"image_1",
                                                      @"image_2",
                                                      @"image_3",
                                                      @"image_1",
                                                      nil];
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kViewHeight - 64)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    customTableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [customTableView allowsMultipleSelectionDuringEditing];
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXMyCollectCell *cell = [ZXMyCollectCell myCollectCell];
    NSInteger index = indexPath.row;
    [cell setContentWithTitle:self.dataArray[index] image:self.imageArray[index]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.ediBtn.titleLabel.text isEqualToString:@"取消"])
    {
        ZXMyCollectCell *cell = (ZXMyCollectCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
        [self.deleteDic removeObjectForKey:[self.dataArray objectAtIndex:indexPath.row]];
        [cell setSelected:NO animated:YES];
        [cell exchangeSymbol];
    }
    [self setDeleteBtnStatus];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.ediBtn.titleLabel.text isEqualToString:@"取消"])
    {
        ZXMyCollectCell *cell = (ZXMyCollectCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
        [self.deleteDic setObject:indexPath forKey:[self.dataArray objectAtIndex:indexPath.row]];
        [cell setSelected:YES animated:YES];
        [cell exchangeSymbol];
    }
    [self setDeleteBtnStatus];
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.bgView.hidden = YES;
}
@end
