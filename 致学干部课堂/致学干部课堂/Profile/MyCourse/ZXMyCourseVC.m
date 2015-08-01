//
//  ZXMyCourseVC.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyCourseVC.h"
#import "ZXMyCourseCell.h"
#import "ZXLabel.h"

@interface ZXMyCourseVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)UIButton *completeBtn;
@property (nonatomic,strong)UIButton *notCompleteBtn;
@property (nonatomic,strong)UIView *topButtonLine;
@property (nonatomic,strong)UIButton *requireBtn;
@property (nonatomic,strong)UIButton *optionalBtn;
@property (nonatomic,strong)UIButton *editBtn;
@property(nonatomic,strong)NSMutableDictionary * deleteDic;
@property (nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIButton * deleteBtn;
@property(nonatomic,strong)UIButton * selectAllBtn;
@end

@implementation ZXMyCourseVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setTableView];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"我的课程";
    self.navigationItem.titleView = titleLabel;
    
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
- (void)deleteButtonClick
{
    [self.customTableView beginUpdates];
    [self.dataArray removeObjectsInArray:[self.deleteDic allKeys]];
    [self.customTableView deleteRowsAtIndexPaths:[NSArray arrayWithArray:[self.deleteDic allValues]] withRowAnimation:UITableViewRowAnimationFade];
    [self.deleteDic removeAllObjects];
    [self.customTableView endUpdates];
    [self setDeleteBtnStatus];
}
- (void)selectAllButtonClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    [self setDeleteBtnStatus];
    if (btn.selected)
    {
        for (int i = 0; i < self.dataArray.count; i++)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self tableView:self.customTableView didSelectRowAtIndexPath:indexPath];
        }
    }else
    {
        for (int i = 0; i < self.dataArray.count; i++)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self tableView:self.customTableView didDeselectRowAtIndexPath:indexPath];
        }
    }
    for (NSIndexPath *cellIndex in [self.customTableView indexPathsForVisibleRows])
    {
        [self.customTableView cellForRowAtIndexPath:cellIndex].selected = btn.selected;
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
    self.deleteDic =[[NSMutableDictionary alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 90)];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 44)];
    
    UIButton *completeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth - 50 - 90, 0, 90, 44)];
    [completeBtn setTitle:@"已完成课程" forState:UIControlStateNormal];
    [completeBtn setTitleColor:color(235, 99, 99) forState:UIControlStateSelected];
    [completeBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    completeBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [completeBtn addTarget:self action:@selector(clickComplete:) forControlEvents:UIControlEventTouchUpInside];
    completeBtn.adjustsImageWhenHighlighted = NO;
    self.completeBtn = completeBtn;
    [topView addSubview:completeBtn];
    
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(kWindowWidth / 2, 10, 1, 24)];
    topLine.backgroundColor = color(203, 203, 203);
    [topView addSubview:topLine];
    
    UIButton *notCompleteBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 90, 44)];
    [notCompleteBtn setTitle:@"未完成课程" forState:UIControlStateNormal];
    [notCompleteBtn setTitleColor:color(235, 99, 99) forState:UIControlStateSelected];
    [notCompleteBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    notCompleteBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [notCompleteBtn addTarget:self action:@selector(clickNotComplete:) forControlEvents:UIControlEventTouchUpInside];
    notCompleteBtn.selected = YES;
    notCompleteBtn.adjustsImageWhenHighlighted = NO;
    self.notCompleteBtn = notCompleteBtn;
    [topView addSubview:notCompleteBtn];
    
    UIView *topButtonLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(notCompleteBtn.frame), CGRectGetMaxY(notCompleteBtn.frame), CGRectGetWidth(notCompleteBtn.frame), 1)];
    topButtonLine.backgroundColor = color(235, 99, 99);
    self.topButtonLine = topButtonLine;
    [topView addSubview:topButtonLine];
    
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame) + 1, kViewWidth, 0.5)];
//    lineView.backgroundColor = color(235, 99, 99);
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(topButtonLine.frame), kViewWidth, 44)];
    bottomView.backgroundColor = color(238, 238, 238);
    
    UIButton *requireBtn = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth / 2 - 100, 5, 100, 34)];
    [requireBtn setTitle:@"必修  40" forState:UIControlStateNormal];
    [requireBtn setTitleColor:color(235, 99, 99) forState:UIControlStateNormal];
    [requireBtn setTitleColor:color(102, 102, 102) forState:UIControlStateSelected];
    [requireBtn setBackgroundImage:[UIImage imageNamed:@"profile_course_bg"] forState:UIControlStateNormal];
    [requireBtn setBackgroundImage:[UIImage imageNamed:@"profile_course_select_bg"] forState:UIControlStateSelected];
    [requireBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    [requireBtn setTitleColor:color(255, 255, 255) forState:UIControlStateSelected];
    requireBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [requireBtn addTarget:self action:@selector(clickRequire:) forControlEvents:UIControlEventTouchUpInside];
    requireBtn.selected = YES;
    requireBtn.adjustsImageWhenHighlighted = NO;
    self.requireBtn = requireBtn;
    [bottomView addSubview:requireBtn];
    
    UIButton *optionalBtn = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth/2, 5, 100, 34)];
    [optionalBtn setTitle:@"选修  22" forState:UIControlStateNormal];
    [optionalBtn setTitleColor:color(235, 99, 99) forState:UIControlStateNormal];
    [optionalBtn setTitleColor:color(102, 102, 102) forState:UIControlStateSelected];
    [optionalBtn setBackgroundImage:[UIImage imageNamed:@"profile_course_bg"] forState:UIControlStateNormal];
    [optionalBtn setBackgroundImage:[UIImage imageNamed:@"profile_course_select_bg"] forState:UIControlStateSelected];
    [optionalBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    [optionalBtn setTitleColor:color(255, 255, 255) forState:UIControlStateSelected];
    optionalBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [optionalBtn addTarget:self action:@selector(clickOptional:) forControlEvents:UIControlEventTouchUpInside];
    optionalBtn.adjustsImageWhenHighlighted = NO;
    self.optionalBtn = optionalBtn;
    [bottomView addSubview:optionalBtn];
    
    UIButton *editBtn = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth - 60 - kMargin, 0, 60, 44)];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [editBtn setTitle:@"取消" forState:UIControlStateSelected];
    [editBtn setTitleColor:color(102, 102, 102) forState:UIControlStateNormal];
    editBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [editBtn addTarget:self action:@selector(clickEdit:) forControlEvents:UIControlEventTouchUpInside];
    editBtn.hidden = YES;
    editBtn.adjustsImageWhenHighlighted = NO;
    self.editBtn = editBtn;
    [bottomView addSubview:editBtn];
    
    [bgView addSubview:topView];
//    [bgView addSubview:lineView];
    [bgView addSubview:bottomView];
    [self.view addSubview:bgView];
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame), self.view.width, kViewHeight - bgView.height - 64)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    customTableView.contentInset = UIEdgeInsetsMake(10, 0, 10, 0);
    [customTableView allowsMultipleSelectionDuringEditing];
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
}
- (void)clickComplete:(UIButton *)btn
{
    btn.selected = YES;
    self.notCompleteBtn.selected = NO;
    self.topButtonLine.x = CGRectGetMinX(self.completeBtn.frame);
//    self.requireBtn.selected = YES;
//    self.optionalBtn.selected = NO;
    [self updateEditStatus];
    [self clearEditStatus];
}
- (void)clickNotComplete:(UIButton *)btn
{
    btn.selected = YES;
    self.completeBtn.selected = NO;
    self.topButtonLine.x = CGRectGetMinX(self.notCompleteBtn.frame);
//    self.requireBtn.selected = YES;
//    self.optionalBtn.selected = NO;
    [self updateEditStatus];
    [self clearEditStatus];
}
- (void)clickRequire:(UIButton *)btn
{
    btn.selected = YES;
    self.optionalBtn.selected = NO;
    [self updateEditStatus];
    [self clearEditStatus];
}
- (void)clickOptional:(UIButton *)btn
{
    btn.selected = YES;
    self.requireBtn.selected = NO;
    [self updateEditStatus];
    [self clearEditStatus];
}
- (void)updateEditStatus
{
    self.editBtn.hidden = YES;
    if (self.notCompleteBtn.selected == YES && self.optionalBtn.selected == YES)
    {
        self.editBtn.hidden = NO;
    }
}
- (void)clearEditStatus
{
    if (self.editBtn.isSelected)
    {
        self.editBtn.selected = NO;
        [UIView animateWithDuration:0.6 animations:^{
            self.bgView.alpha = 0.0;
        }];
        [self.customTableView setEditing:NO animated:true];
        [self.deleteDic removeAllObjects];
        self.customTableView.height += 50;
        [self setDeleteBtnStatus];
    }
}
- (void)clickEdit:(UIButton *)btn
{
    btn.selected = !btn.selected;
    [UIView animateWithDuration:0.6 animations:^{
        self.bgView.alpha = btn.selected ? 1.0:0.0;
    }];
    if (btn.selected)
    {
        [self.customTableView setEditing:!self.customTableView.editing animated:true];
        self.customTableView.height -= 50;
    }
    if (!btn.selected)
    {
        [self.customTableView setEditing:!self.customTableView.editing animated:true];
        for (NSIndexPath *cellIndex in [self.customTableView indexPathsForVisibleRows])
        {
            [self.customTableView cellForRowAtIndexPath:cellIndex].selected = NO;
        }
        [self.deleteDic removeAllObjects];
        self.customTableView.height += 50;
    }
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
    ZXMyCourseCell *cell = [ZXMyCourseCell myCourseCell];
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
    if ([self.editBtn.titleLabel.text isEqualToString:@"取消"])
    {
        [self.deleteDic removeObjectForKey:[self.dataArray objectAtIndex:indexPath.row]];
        [self.customTableView cellForRowAtIndexPath:indexPath].selected = NO;
        ZXMyCourseCell *cell = (ZXMyCourseCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
        [cell exchangeSymbol];
    }
    [self setDeleteBtnStatus];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.editBtn.titleLabel.text isEqualToString:@"取消"])
    {
        [self.deleteDic setObject:indexPath forKey:[self.dataArray objectAtIndex:indexPath.row]];
        [self.customTableView cellForRowAtIndexPath:indexPath].selected = YES;
        ZXMyCourseCell *cell = (ZXMyCourseCell *)[self.customTableView cellForRowAtIndexPath:indexPath];
        [cell exchangeSymbol];
    }
    [self setDeleteBtnStatus];
}
- (void)viewWillDisappear:(BOOL)animated
{
    self.bgView.hidden = YES;
}
@end
