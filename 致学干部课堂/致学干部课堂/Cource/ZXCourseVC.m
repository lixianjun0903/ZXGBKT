//
//  ZXCourseVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXCourseVC.h"
#import "ZXCourseCell.h"
#import "ZXCourseHeadView.h"
#import "ZXEveryWeekVC.h"
#import "ZXSearchVC.h"
#import "ZXLabel.h"

@interface ZXCourseVC ()<UITableViewDataSource,UITableViewDelegate,ZXCourseHeadViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UITableView *custonTableView;
@property (nonatomic,strong)ZXCourseHeadView *headView;
@property (nonatomic,strong)UILabel *topLabel;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic,strong)NSMutableString *topStr;
@property (nonatomic,assign)CGFloat currentOffsetY;
@end

@implementation ZXCourseVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = YES;
    [self setNavStatus];
    [self setTableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTopStr:) name:@"CourseHeadViewSelectedButton" object:nil];
}
- (void)changeTopStr:(NSNotification *)notifacation
{
    self.topLabel.text = notifacation.userInfo[@"title"];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"选课中心 ";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 34, 34)];
    [rightBtn setImage:[UIImage imageNamed:@"course_search"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"course_right_select"] forState:UIControlStateSelected];
    [rightBtn addTarget:self action:@selector(pushToSearch:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
- (void)pushToSearch:(UIButton *)btn
{
    [self.navigationController pushViewController:[[ZXSearchVC alloc] init] animated:YES];
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
                                                      @"您有一张46元的现金红包",
                                                      @"您有一张56元的现金红包",
                                                      @"您有一张66元的现金红包",
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
                                                       @"image_2",
                                                       @"image_3",
                                                       @"image_1",
                                                       nil];
    self.topStr = [NSMutableString stringWithFormat:@"最新·全部·全部"];
    
    ZXCourseHeadView *headView = [ZXCourseHeadView courseHeadView];
    headView.frame = CGRectMake(0, 64, kViewWidth, 270);
    [headView setcontentWithWidth:kWindowWidth];
    headView.courseHeadDelegate = self;
    self.headView = headView;
    [self.view addSubview:headView];
    
    UITableView *custonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(headView.frame), self.view.width, kViewHeight-49)];
    custonTableView.dataSource = self;
    custonTableView.delegate = self;
    custonTableView.backgroundColor = color(238, 238, 238);
    custonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    custonTableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    
    self.custonTableView = custonTableView;
    [self.view addSubview:custonTableView];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, kViewWidth, 35)];
    topLabel.text = self.topStr;
    topLabel.textAlignment = NSTextAlignmentCenter;
    topLabel.font = [UIFont systemFontOfSize:15];
    topLabel.backgroundColor = color(235, 235, 235);
    topLabel.alpha = 0.0;
    topLabel.userInteractionEnabled = YES;
    
    // 单击
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTap.numberOfTapsRequired = 1;
    [topLabel addGestureRecognizer:singleTap];
    self.topLabel = topLabel;
    [[UIApplication sharedApplication].keyWindow addSubview:topLabel];
}
- (void)singleTap:(UIGestureRecognizer *)gesture
{
    [UIView animateWithDuration:0.5 animations:^{
        self.topLabel.alpha = 0.0;
        self.headView.y = 0;
        self.custonTableView.y = 270;
        self.custonTableView.contentOffset = CGPointZero;
    }];
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
    NSInteger index = indexPath.row;
    ZXCourseCell *cell = [ZXCourseCell myCollectCell];
    [cell setContentWithTitle:self.dataArray[index] image:self.imageArray[index]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
#pragma mark -
#pragma mark -Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[[ZXEveryWeekVC alloc]init] animated:YES];
}
#pragma mark -
#pragma mark -scroll delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        if (self.custonTableView.contentOffset.y > self.currentOffsetY)
        {
            if (self.currentOffsetY < self.custonTableView.contentSize.height)
            {
                [UIView animateWithDuration:0.5 animations:^{
                    self.headView.y = -270;
                    self.custonTableView.y = 0;
                }];
            }
        }
        if (self.custonTableView.contentOffset.y < 10)
        {
            [UIView animateWithDuration:0.5 animations:^{
                self.headView.y = 64;
                self.custonTableView.y = 270+ 64;
            }];
        }
    self.currentOffsetY = self.custonTableView.contentOffset.y;
    float alpha = 0.0;
    if (self.custonTableView.contentOffset.y > 20)
    {
        alpha = 1.0;
    }
    [UIView animateWithDuration:0.5 animations:^{
        self.topLabel.alpha = alpha;
    }];
}
#pragma mark -
#pragma mark -headView delegate
- (void)courseHeadView:(ZXCourseHeadView *)headView DidClickButton:(UIButton *)btn
{
    switch (btn.tag)
    {
//            头
        case ZXCourseHeadViewButtonTypeNew:
        {
            [self.headView iterateTop];
            break;
        }
        case ZXCourseHeadViewButtonTypeHot:
        {
            [self.headView iterateTop];
            break;
        }
        case ZXCourseHeadViewButtonTypePraise:
        {
            [self.headView iterateTop];
            break;
        }
//            领域
        case ZXCourseHeadViewButtonTypeFieldAll:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldPolitics:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldEconomic:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldCulture:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldSocial:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldEcological:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldScience:
        {
            [self.headView iterateField];
            break;
        }
        case ZXCourseHeadViewButtonTypeFieldMilitary:
        {
            [self.headView iterateField];
            break;
        }
//            类型
        case ZXCourseHeadViewButtonTypeTypeAll:
        {
            [self.headView iterateType];
            break;
        }
        case ZXCourseHeadViewButtonTypeTypeVideo:
        {
            [self.headView iterateType];
            break;
        }
        case ZXCourseHeadViewButtonTypeTypeAnimation:
        {
            [self.headView iterateType];
            break;
        }
        case ZXCourseHeadViewButtonTypeTypeVisualization:
        {
            [self.headView iterateType];
            break;
        }
        case ZXCourseHeadViewButtonTypeTypeRichMedia:
        {
            [self.headView iterateType];
            break;
        }
//            周期
        case ZXCourseHeadViewButtonTypeCycleDay:
        {
            [self.headView iterateCycle];
            break;
        }
        case ZXCourseHeadViewButtonTypeCycleWeek:
        {
            [self.headView iterateCycle];
            break;
        }
        case ZXCourseHeadViewButtonTypeCycleMonth:
        {
            [self.headView iterateCycle];
            break;
        }
//            时间
        case ZXCourseHeadViewButtonTypeTimeOneWeek:
        {
            [self.headView iterateTime];
            break;
        }
        case ZXCourseHeadViewButtonTypeTimeTwoWeek:
        {
            [self.headView iterateTime];
            break;
        }
        case ZXCourseHeadViewButtonTypeTimeOneMonth:
        {
            [self.headView iterateTime];
            break;
        }
        case ZXCourseHeadViewButtonTypeTimeHalfYear:
        {
            [self.headView iterateTime];
            break;
        }
    }
    btn.selected = !btn.selected;
    [self.headView postSelectButton];
}
- (void)viewWillAppear:(BOOL)animated
{
    self.topLabel.hidden = NO;
}
- (void)viewDidDisappear:(BOOL)animated
{
    self.topLabel.hidden = YES;
}
@end
