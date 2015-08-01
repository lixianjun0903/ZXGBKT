//
//  ZXMyClassDetailVC.m
//  致学在线
//
//  Created by lixianjun on 15-5-14.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyClassDetailVC.h"
#import "ZXMyClassDiscuss.h"
#import "ZXMyClassAdressBookV.h"
#import "ZXMyClassCourceV.h"
#import "ZXMyClassExamV.h"
@interface ZXMyClassDetailVC ()<UIScrollViewDelegate>

{
    
    UIView * bgView;
    UIImageView * bgLineView;
    UIScrollView * _mainSC;
    ZXMyClassCourceV * MyClassCourceView;
    ZXMyClassExamV * MyClassExamView;
    ZXMyClassDiscuss * MyClassDiscussView;
    ZXMyClassAdressBookV * MyClassAdressBookView;
    
}
@end

@implementation ZXMyClassDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.navTilte;
    self.view.backgroundColor =[UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    [self createBgtitleView];
    [self createMainSC];
    [self createView];
    // Do any additional setup after loading the view.
}
-(void)createView
{
    MyClassCourceView = [[ZXMyClassCourceV alloc] initWithFrame:CGRectMake(0, 10, kViewWidth, _mainSC.frame.size.height)];
    [_mainSC addSubview:MyClassCourceView];
    MyClassExamView = [[ZXMyClassExamV alloc] initWithFrame:CGRectMake(kViewWidth, 0, kViewWidth, _mainSC.frame.size.height)];
    [_mainSC addSubview:MyClassExamView];
    MyClassAdressBookView = [[ZXMyClassAdressBookV alloc] initWithFrame:CGRectMake(kViewWidth*2, 10, kViewWidth, _mainSC.frame.size.height)];
    [_mainSC addSubview:MyClassAdressBookView];
    MyClassDiscussView =[[ZXMyClassDiscuss alloc] initWithFrame:CGRectMake(kViewWidth*3, 10, kViewWidth, _mainSC.frame.size.height)];
    [_mainSC addSubview:MyClassDiscussView];
    
}
-(void)createMainSC
{
    _mainSC =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, kViewWidth, kViewHeight -108)];
    _mainSC.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    _mainSC.delegate = self;
    _mainSC.showsHorizontalScrollIndicator =NO;
    _mainSC.pagingEnabled= YES;
    _mainSC.contentSize = CGSizeMake(kViewWidth * 4, kViewHeight - 64 - 44 );
    [self.view addSubview:_mainSC];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint point = scrollView.contentOffset;
    
    bgLineView.frame = CGRectMake((kViewWidth /2- kViewWidth/4.0)/2+point.x/4.0-31, 42, kViewWidth/6.0, 2);
    
    int index = (int)point.x/(kViewWidth/2);
    NSLog(@"index=%d",index);
    UIButton * btn0 = (UIButton *)[bgView viewWithTag:100];
    UIButton * btn1 = (UIButton*)[bgView viewWithTag:101];
    UIButton * btn2 = (UIButton*)[bgView viewWithTag:102];
    UIButton * btn3 = (UIButton*)[bgView viewWithTag:103];
    if (index == 0) {
        btn0.selected = YES;
        btn1.selected = NO;
        btn2.selected = NO;
        btn3.selected = NO;
    }
    else if(index==2||index == 1)
    {
        btn0.selected = NO;
        btn1.selected = YES;
        btn2.selected = NO;
        btn3.selected = NO;
    }
    else if(index ==4||index==3)
    {
        btn0.selected = NO;
        btn1.selected = NO;
        btn2.selected = YES;
        btn3.selected = NO;
    }else if(index ==5||index==6)
    {
        btn0.selected = NO;
        btn1.selected = NO;
        btn2.selected = NO;
        btn3.selected = YES;
    }
    
    NSLog(@"%f~~~~%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
    
    
}

-(void)createBgtitleView
{  bgView =[[UIView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, 44)];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    NSArray * titleArray = @[@"课程",@"考试",@"通讯录",@"讨论区"];
    for (int i = 0; i < titleArray.count; i++) {
        UIButton * titlebutton = [[UIButton alloc] initWithFrame:CGRectMake(kViewWidth/4.0*i, 0, kViewWidth/4.0, 44)];
        [titlebutton setTitle:titleArray[i] forState:UIControlStateNormal];
        [titlebutton setTitleColor:color(88, 88, 88) forState:UIControlStateNormal];
        titlebutton.tag = 100+i;
        [titlebutton addTarget:self action:@selector(buttonCilick:) forControlEvents:UIControlEventTouchUpInside];
        [titlebutton setTitleColor:color(255, 140, 120) forState:UIControlStateSelected];
        if (i==0) {
            titlebutton.selected = YES;
        }
        [bgView addSubview:titlebutton];
        
        UIView * titleLineView = [[UIView alloc] initWithFrame:CGRectMake(kViewWidth/4.0+kViewWidth/4.0*i, 12, 1, 20)];
        titleLineView.backgroundColor = color(204, 204, 204);
        [bgView addSubview:titleLineView];
    }
    
    bgLineView = [[UIImageView alloc] initWithFrame:CGRectMake((kViewWidth/4.0-kViewWidth/6.0)/2.0, 42, kViewWidth/6.0,2)];
    bgLineView.image =[UIImage imageNamed:@"myClassbgLineView"];
    bgLineView.tag = 10;
    [bgView addSubview:bgLineView];
    
}
-(void)buttonCilick:(UIButton*)sender
{ float index = sender.tag - 100;
    for (UIView *view in bgView.subviews)
        
    {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton * btn = (UIButton*)view;
            btn.selected = NO;
        }
        sender.selected = YES;
        
    }
    
    UIImageView * bgLineViews = (UIImageView*)[bgView viewWithTag:10];
    [UIView animateWithDuration:0.3 animations:^{
        _mainSC.contentOffset = CGPointMake(index* kViewWidth, 0);
        bgLineViews.frame = CGRectMake((kViewWidth/4.0-kViewWidth/6.0)/2.0 +kViewWidth/4.0*index, 42, kViewWidth/6.0,2);
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
