//
//  ZXMyDownloadVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyDownloadVC.h"
#import "ZXMyDownLoadCell.h"
#import "ZXLabel.h"


@interface ZXMyDownloadVC ()<UITableViewDataSource,UITableViewDelegate>
{
}
@property (nonatomic,strong)UITableView *customTableView;
@property(nonatomic,strong)UIView * selectBgView;
@property (nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIButton * ediBtn;
@property(nonatomic,strong)UIButton * deleteBtn;
@property(nonatomic,strong)UIButton * selectAllBtn;
@property(nonatomic,strong)NSArray * textArray;
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)NSMutableDictionary * deleteDic;


@end
@implementation ZXMyDownloadVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataArray =[NSMutableArray arrayWithCapacity:0];
    self.deleteDic =[[NSMutableDictionary alloc]init];
    self.dataArray =[NSMutableArray arrayWithCapacity:0];
    self.textArray = @[
                       @"课程标题1优化实名认证规则公告",
                       @"课程大象理财版上线公告",
                       @"课程标题3优化实名认证规则公告",
                       @"课程标题4您有一张10元的现金红包",
                       @"课程标题5您有一张10元的现金红包",
                       @"课程标题6您有一张10元的现金红包",
                       @"课程标题7您有一张10元的现金红包",
                       @"课程标题8您有一张10元的现金红包",
                       @"课程标题9您有一张10元的现金红包",
                       @"课程标题10您有一张10元的现金红包"
                       
                       ];
    self.dataArray = [NSMutableArray arrayWithArray:self.textArray];
    self.view.backgroundColor =[UIColor whiteColor];
    
      [self createTable];
      [self setNavStatus];
    
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的下载";
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
    self.deleteDic.count == 0 ? (self.deleteBtn.backgroundColor = color(204, 204, 204)) : (self.deleteBtn.backgroundColor = color(235, 67, 67));
    if (self.deleteDic.count != 0)
    {
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除 (%ld)",(unsigned long)self.deleteDic.count] forState:UIControlStateNormal];
        return;
    }
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
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
-(void)createTable
{
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kViewHeight-64)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    [customTableView allowsMultipleSelectionDuringEditing];
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
    }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
static NSString * CELLID = @"CELLID";
    
    ZXMyDownLoadCell * cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXMyDownLoadCell" owner:self options:nil] firstObject];
    }
    cell.titleLable.text = self.textArray[indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setContentWithTitle:nil image:nil];
    return cell;
}
-(void)selectClick:(UIButton*)sender
{

    sender.selected = !sender.selected;
}
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 96;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.ediBtn.titleLabel.text isEqualToString:@"取消"])
    {
        ZXMyDownLoadCell *cell = (ZXMyDownLoadCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
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
        ZXMyDownLoadCell *cell = (ZXMyDownLoadCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
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
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

