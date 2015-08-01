//
//  ZXHomeVC.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXHomeVC.h"
#import "ZXHomeFocus.h"
#import "ZXHomeCell.h"

#define kCellHeight (self.view.height - self.focusHeight - 20 - 20 - 49) / 3
#define kPageNumber 3

@interface ZXHomeVC () <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
/** 表视图 */
@property (nonatomic,strong)UITableView *customTableView;
/** 焦点图 */
@property (nonatomic,weak) ZXHomeFocus  *focusView;
/** 指示器 */
@property (nonatomic,weak) UIPageControl  *pageControl;
/** 定时器 */
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong)NSArray *cellIconArray;
@property (nonatomic,strong)NSArray *cellTitleArray;
@property (nonatomic,strong)NSArray *cellDetailTitleArray;
@property (nonatomic,strong)NSArray *cellBgArray;
@property (nonatomic,assign)CGFloat focusHeight;
@end

@implementation ZXHomeVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.focusHeight = 160;
    if ([UIScreen mainScreen].bounds.size.height == 568)
    {
        self.focusHeight = 130;
    }
    self.navigationController.navigationBar.hidden = YES;
    
    [self setTableView];
    [self addTimer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CellDidSelect:) name:@"ZXHomeCellScrollSelectedNotificaion" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(CellScroll:) name:@"ZXHomeCellScrollNotificaion" object:nil];
}
/**
 *  设置表视图和焦点图
 */
- (void)setTableView
{
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, self.view.width, self.view.height)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    customTableView.scrollEnabled = NO;
    self.customTableView = customTableView;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, self.focusHeight)];
    ZXHomeFocus *focusView = [ZXHomeFocus scrollViewWithRect:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.width, self.focusHeight) pageNumber:kPageNumber];
    focusView.pagingEnabled = YES;
    focusView.delegate = self;
     self.focusView = focusView;
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.y = bgView.height - 10;
    pageControl.width = 60;
    pageControl.height = 10;
    pageControl.numberOfPages = kPageNumber;
    [pageControl setTintColor:[UIColor whiteColor]];
    pageControl.x = (bgView.width - pageControl.width) / 2;
    self.pageControl = pageControl;
    
    customTableView.tableHeaderView = bgView;
    [bgView addSubview:focusView];
    [bgView addSubview:pageControl];
    [self.view addSubview:customTableView];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.tabBarController.tabBar.frame) - 10, kViewHeight, 10)];
    lineView.backgroundColor = color(247, 247, 247);
    [self.view addSubview:lineView];
    
    self.cellIconArray = [NSArray arrayWithObjects:@"home_pic", @"home_course", @"home_compete",nil];
    self.cellTitleArray = [NSArray arrayWithObjects:@"每周一图", @"每周一课", @"每周一擂",nil];
    self.cellBgArray = [NSArray arrayWithObjects:color(164, 213, 181), color(229, 138, 120), color(244, 213, 105),nil];
    self.cellDetailTitleArray = [NSArray arrayWithObjects:@"图文并茂，轻松阅读好文章。", @"最新课程上架了！", @"比一比，谁更牛！",nil];
}
/**
 *  滚动计时器
 */
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(TopScroll) userInfo:nil repeats:YES];
}
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}
/**
 *  处理指示器的显示
 */
- (void)TopScroll
{
    CGFloat currentOffsetX = self.focusView.contentOffset.x;
    NSInteger page = currentOffsetX / self.focusView.width;
    if (page == self.focusView.subviews.count - 1)
    {
        [self.focusView setContentOffset:CGPointZero  animated:NO];
        [self TopScroll];
        return;
    }
    CGFloat offsetX = self.focusView.width * (page + 1);
    [UIView animateWithDuration:1.0 animations:^{
        [self.focusView setContentOffset:CGPointMake(offsetX, 0)  animated:NO];
    }];
}
#pragma mark -
#pragma mark -scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentNumber = (self.focusView.contentOffset.x ) / self.focusView.width;
    if (currentNumber == 3)
    {
        self.pageControl.currentPage = 0;
        if (!self.timer)
        {
            [self.focusView setContentOffset:CGPointZero  animated:NO];
        }
        return;
    }
    self.pageControl.currentPage = currentNumber;
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.section * 1 + indexPath.row;
    ZXHomeCell *cell = [ZXHomeCell homeCell];
    [cell setWithHeight:kCellHeight DetailText:self.cellDetailTitleArray[index] Text:self.cellTitleArray[index] Image:self.cellIconArray[index] BgColor:self.cellBgArray[index]];
    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 3 ? 0 : kCellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selectionStyle = UITableViewCellSelectionStyleNone;
}
#pragma mark -选中课题
- (void)CellDidSelect:(NSNotification *)notification
{
    NSLog(@"%@",notification.userInfo[@"index"]);
}
- (void)CellScroll:(NSNotification *)notification
{
//    NSLog(@"%@",notification.userInfo[@"offsetX"]);
//    NSLog(@"%@",notification.object);
//    UIButton *btn = notification.object;
//    
//    btn.transform = CGAffineTransformTranslate(btn.transform, [notification.userInfo[@"offsetX"] floatValue], 0);
}
#pragma mark -
#pragma mark MemoryWarning
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewWillAppear:(BOOL)animated
{
    for (NSIndexPath *cellIndex in [self.customTableView indexPathsForVisibleRows])
    {
        ZXHomeCell *cell = (ZXHomeCell *)[self.customTableView cellForRowAtIndexPath:cellIndex];
        [cell resetContentOffset];
    }
}
@end
