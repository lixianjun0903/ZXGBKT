//
//  ZXExamVC.m
//  致学在线
//
//  Created by zhixue on 15/5/14.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXExamVC.h"
#import "ZXLabel.h"
#import "ZXExamToolBar.h"
#import "ZXExamCard.h"

@interface ZXExamVC ()<UITableViewDataSource,UITableViewDelegate,ZXExamToolBarDelegate,ZXExamCardDelegate>
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *examLabel;
@property (nonatomic,strong)UITableView *customTable;
@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)ZXExamCard *answerCard;
@property (nonatomic,strong)UILabel *numberLabel;
@property (nonatomic,strong)UIButton *answerCardBtn;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)NSInteger time;
@property (nonatomic,strong)NSArray *cellIconArray;
@property (nonatomic,strong)NSArray *cellTitleArray;
@end

@implementation ZXExamVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
    [self addTimer];
}
- (void)setNavStatus
{
    self.time = 3600;
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"考试";
    self.navigationItem.titleView = titleLabel;
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    timeLabel.text = [NSString stringWithFormat:@"%ld:%.2ld",self.time/60,self.time%60];
    timeLabel.font = [UIFont systemFontOfSize:17];
    timeLabel.textColor = color(255, 255, 255);
    timeLabel.textAlignment = NSTextAlignmentRight;
    self.timeLabel = timeLabel;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:timeLabel];
}
- (void)setcontent
{
    self.cellIconArray = [NSArray arrayWithObjects:@"a",
                          @"b",
                          @"c",
                          nil];
    self.cellTitleArray = [NSArray arrayWithObjects:@"部门终身制",
                           @"部门化",
                           @"部门所有制度",
                           nil];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 42)];
    topView.backgroundColor = color(237, 237, 237);
    UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(kMargin, 0, 120, 42)];
    typeLabel.text = @"[单选题]";
    typeLabel.font = [UIFont systemFontOfSize:12];
    typeLabel.textColor = color(235, 67, 67);
    [topView addSubview:typeLabel];
    
    UIButton *markBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    markBtn.frame = CGRectMake(kViewWidth - 50 - 15, 0, 50, 42);
    [markBtn setTitle:@" 标记" forState:UIControlStateNormal];
    [markBtn setImage:[UIImage imageNamed:@"mark"] forState:UIControlStateNormal];
    [markBtn setImage:[UIImage imageNamed:@"mark_highlight"] forState:UIControlStateSelected];
    [markBtn setTitleColor:color(255, 140, 120) forState:UIControlStateNormal];
    markBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    markBtn.contentMode = UIViewContentModeCenter;
    markBtn.adjustsImageWhenHighlighted = NO;
    [markBtn addTarget:self action:@selector(mark:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:markBtn];
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    collectBtn.frame = CGRectMake(kViewWidth - 100 - 35, 0, 50, 42);
    [collectBtn setTitle:@" 收藏" forState:UIControlStateNormal];
    [collectBtn setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
    [collectBtn setImage:[UIImage imageNamed:@"collect_highlight"] forState:UIControlStateSelected];
    [collectBtn setTitleColor:color(140, 214, 181) forState:UIControlStateNormal];
    collectBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    collectBtn.contentMode = UIViewContentModeCenter;
    collectBtn.adjustsImageWhenHighlighted = NO;
    [collectBtn addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:collectBtn];
    
    self.topView = topView;
    [self.view addSubview:topView];
    
    UILabel *examLabel = [[UILabel alloc] init];
    examLabel.width = kViewWidth - 16;
    examLabel.x = 8;
    examLabel.y = CGRectGetMaxY(topView.frame) + kMargin / 2;
    examLabel.numberOfLines = 0;
    examLabel.font = [UIFont systemFontOfSize:17];
    examLabel.textColor = color(51, 51, 51);
    examLabel.backgroundColor = color(255, 255, 255);
    NSString *str = @"1.十八届三中全会强调，打破干部（  ），拓宽选人视野和渠道，加强干部跨条块跨领域交流";
    NSMutableAttributedString * attrstr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    //    paragraphStyle.paragraphSpacing = 10;
    //    paragraphStyle.firstLineHeadIndent = 20;
    [attrstr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    [examLabel setAttributedText:attrstr];
    [examLabel sizeToFit];
    
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:15]};
    CGSize size = [examLabel.text boundingRectWithSize:CGSizeMake(kViewWidth - 16, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    examLabel.height = size.height + 4 * kMargin;
    self.examLabel = examLabel;
    [self.view addSubview:examLabel];
    
    UITableView *customTable = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(examLabel.frame), kViewWidth, kViewHeight - CGRectGetMaxY(examLabel.frame) - 64)];
    customTable.delegate  = self;
    customTable.dataSource = self;
    customTable.scrollEnabled = NO;
    customTable.backgroundColor = color(237, 237, 237);
    customTable.tableFooterView = [[UIView alloc] init];
    self.customTable = customTable;
    [self.view addSubview:customTable];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49)];
    bgView.backgroundColor = color(0, 0, 0);
    bgView.alpha = 0.0;
    bgView.hidden = YES;
    self.bgView = bgView;
    [self.view addSubview:bgView];
    
    ZXExamCard *answerCard = [[ZXExamCard alloc] initWithFrame:CGRectMake(0, kViewHeight - 64 + 30, kViewWidth, kViewWidth)];
    answerCard.contentSize = CGSizeMake(kViewWidth, kViewWidth + 40);
    answerCard.examCardDelegate = self;
    self.answerCard = answerCard;
    [self.view addSubview:answerCard];
    
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(kViewWidth - 60, CGRectGetMinY(answerCard.frame) - 30, 61, 31)];
    numberLabel.text = @"1/49";
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.font = [UIFont systemFontOfSize:17];
    numberLabel.textColor = color(255, 255, 255);
    numberLabel.backgroundColor = color(77, 77, 77);
    numberLabel.layer.masksToBounds = YES;
    numberLabel.layer.cornerRadius = 2;
    self.numberLabel = numberLabel;
    [self.view addSubview:numberLabel];
    
    ZXExamToolBar *toolBar = [[ZXExamToolBar alloc] initWithFrame:CGRectMake(0, kViewHeight - 49 - 64, kViewWidth, 49)];
    toolBar.examDelegate = self;
    [self.view addSubview:toolBar];
}
- (void)mark:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
- (void)collect:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
- (void)addTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(reduceTime) userInfo:nil repeats:YES];
}
- (void)reduceTime
{
    self.time--;
    self.timeLabel.text = [NSString stringWithFormat:@"%ld:%.2ld",self.time/60,self.time%60];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.customTable setSeparatorInset:UIEdgeInsetsZero];
    [self.customTable setLayoutMargins:UIEdgeInsetsZero];
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSInteger index = indexPath.section * 3 + indexPath.row;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 13, 24, 24)];
    imageView.image = [UIImage imageNamed:self.cellIconArray[index]];
    imageView.contentMode = UIViewContentModeCenter;
    [bgView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + kMargin, 0, kViewWidth - CGRectGetMaxY(imageView.frame), 50)];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = color(51, 51, 51);
    label.text = self.cellTitleArray[index] ;
    [bgView addSubview:label];
    
    switch (index)
    {
        case 3:
        {
            label.textColor = color(55, 212, 142);
            break;
        }
        case 4:
        {
            label.textColor = color(235, 67, 67);
            break;
        }
    }
    
    [cell.contentView addSubview:bgView];
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
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (NSIndexPath *cellIndex in [self.customTable indexPathsForVisibleRows])
    {
        [self.customTable cellForRowAtIndexPath:cellIndex].backgroundColor = color(255, 255, 255);
    }
    [self.customTable cellForRowAtIndexPath:indexPath].backgroundColor = color(237, 237, 237);
    switch (indexPath.row)
    {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
    }
}
#pragma mark -
#pragma mark -ZXExamToolBar delegate
- (void)examToolBar:(ZXExamToolBar *)toolBar DidClickButton:(UIButton *)btn
{
    switch (btn.tag)
    {
        case ZXExamToolBarButtonTypeAnswerCard:
        {
            btn.selected = !btn.selected;
            if (btn.selected)
            {
                [UIView animateWithDuration:0.3 animations:^{
                    self.bgView.alpha = 0.4;
                    self.answerCard.y -= (kViewWidth + 30 + 49);
                    self.numberLabel.y -= (kViewWidth + 30 + 49);
                }];
            }else
            {
                [UIView animateWithDuration:0.3 animations:^{
                    self.bgView.alpha = 0.0;
                    self.answerCard.y += kViewWidth + 30 + 49;
                    self.numberLabel.y += kViewWidth + 30 + 49;
                }];
            }
            self.answerCardBtn = btn;
            self.bgView.hidden = btn.isSelected ? NO : YES;
            break;
        }
        case ZXExamToolBarButtonTypeSave:
        {
            break;
        }
        case ZXExamToolBarButtonTypeSubmit:
        {
            
            break;
        }
    }
}
#pragma mark -
#pragma mark -ZXPracticeCard delegate
- (void)examCard:(ZXExamCard *)practiceCar DidClickButton:(UIButton *)btn
{
    btn.backgroundColor = color(140, 214, 181);
    self.numberLabel.text = [NSString stringWithFormat:@"%ld/49",btn.tag + 1];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.5 animations:^{
        self.bgView.alpha = 0.0;
        self.answerCard.y += (kViewWidth + 30 + 49);
        self.numberLabel.y += (kViewWidth + 30 + 49);
    }];
    self.answerCardBtn.selected = NO;
    self.bgView.hidden = YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}@end
