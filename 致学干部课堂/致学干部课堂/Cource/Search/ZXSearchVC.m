//
//  ZXSearchVC.m
//  致学在线
//
//  Created by zhixue on 15/5/11.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSearchVC.h"
#import "ZXSearchHeadView.h"

@interface ZXSearchVC () <UITableViewDataSource,UITableViewDelegate,ZXSearchHeadViewDelegate>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *titleDataArray;
@end

@implementation ZXSearchVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setTableView];
}
- (void)setNavStatus
{
    UIButton *label = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:label];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kViewHeight - 2 * kMargin - 50, 30)];
    searchBar.placeholder = @"请输入讲师、课程等关键字";
    self.searchBar = searchBar;
    self.navigationItem.titleView = searchBar;
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 34, 34)];
    [rightBtn setImage:[UIImage imageNamed:@"course_right_select"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(backTo:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}
- (void)backTo:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setTableView
{
    self.dataArray = [NSMutableArray arrayWithObjects:@"历史搜索",
                                                      @"党章的概念",
                                                      @"城乡统筹中的社会管理",
                                                      @"文化体制改革",
                                                      @"文明建设",
                                                      @"社会意义",
                                                      nil];
    self.titleDataArray = [NSMutableArray arrayWithObjects:@"王小明",
                                                          @"文化改革",
                                                          @"习近平讲话",
                                                          @"腐败",
                                                          @"习近平讲话",
                                                          @"文化改革",
                                                          nil];
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kViewHeight)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.backgroundColor = color(238, 238, 238);
    
    ZXSearchHeadView *headView = [[ZXSearchHeadView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 44)];
    for (NSString *str in self.titleDataArray)
    {
        [headView addTitle:str];
    }
    headView.scrollEnabled = YES;
    headView.userInteractionEnabled = YES;
    headView.searchHeadDelegate = self;
    customTableView.tableHeaderView = headView;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewHeight, 50)];
    UIButton *clearHistoryBtn = [[UIButton alloc] init];
    clearHistoryBtn.height = 36;
    clearHistoryBtn.width = 160;
    clearHistoryBtn.x = (kViewWidth - 160) / 2;
    clearHistoryBtn.y = 10;
    clearHistoryBtn.backgroundColor = color(255, 255, 255);
    clearHistoryBtn.layer.masksToBounds = YES;
    clearHistoryBtn.layer.cornerRadius = 4;
    clearHistoryBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [clearHistoryBtn setTitle:@"清空历史搜索记录" forState:UIControlStateNormal];
    [clearHistoryBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [clearHistoryBtn addTarget:self action:@selector(clearHistory:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:clearHistoryBtn];
    customTableView.tableFooterView = bgView;
    
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
    [self.searchBar becomeFirstResponder];
}
- (void)clearHistory:(UIButton *)btn
{
    [self.dataArray removeAllObjects];
    
    [self.customTableView reloadData];
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
#pragma mark -Tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"SearchCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row != 0)
    {
        cell.textLabel.textColor = color(102, 102, 102);
    }
    return cell;
}
#pragma mark -
#pragma mark -scroll delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchBar endEditing:YES];
}
#pragma mark -
#pragma mark -scroll delegate
- (void)searchHeadView:(ZXSearchHeadView *)headView DidClickButton:(UIButton *)btn
{
    NSLog(@"%@",btn.titleLabel.text);
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.searchBar endEditing:YES];
}
@end
