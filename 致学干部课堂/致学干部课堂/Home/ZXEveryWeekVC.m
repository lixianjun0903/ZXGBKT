//
//  ZXEveryWeekVC.m
//  致学在线
//
//  Created by lixianjun on 15-5-6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXEveryWeekVC.h"
#import "ZXCommentCell.h"
#import "ZXEveryWeekDetailView.h"
#import "ZXEveryWeekCommentTextView.h"
#import "ZXEveryClassPlayView.h"
@interface ZXEveryWeekVC ()<UITableViewDataSource,UITableViewDelegate>
{
    ZXEveryWeekCommentTextView * commentTextFieldView;
    
}
@property(nonatomic,strong)UITableView * tableView;
@end
@implementation ZXEveryWeekVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self createTable];
    [self createCommentFiledView];
}
-(void)createCommentFiledView
{
    commentTextFieldView = [[ZXEveryWeekCommentTextView alloc] initWithFrame:CGRectMake(0, kViewHeight-50-64, kViewWidth, 50)];
    
    commentTextFieldView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    commentTextFieldView.tag = 101;
    [self.view addSubview:commentTextFieldView];
    
    /*隐藏键盘**/
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide:)];
    tapGestureRecognizer.cancelsTouchesInView = YES;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    /*显示键盘**/
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    
    /*收回键盘**/
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hideKeyBoard:) name:UIKeyboardWillHideNotification object:nil];
    
    
}
-(void)keyboardHide:(UITapGestureRecognizer*)tap
{
    [commentTextFieldView.commentTextFiled resignFirstResponder];
    
    [commentTextFieldView.commentNumView addSubview:commentTextFieldView.commentNumImageView];
    
}
-(void)showKeyBoard:(NSNotification*)notification
{
    commentTextFieldView.commentNumLable.text = @"发送";
    [commentTextFieldView.commentNumImageView removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        
        UIView*textField=(UIView*)[self.view viewWithTag:101];
        textField.frame=CGRectMake(0, self.view.frame.size.height-300, kViewWidth, 50);
    }];
}
-(void)hideKeyBoard:(NSNotification*)notification
{
    
    NSLog(@"键盘收回");
    UIView*textField=(UIView*)[self.view viewWithTag:101];
    textField.frame=CGRectMake(0, kViewHeight-50, kViewWidth, 50);
}
-(void)createTable
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight-64-50)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (indexPath.row==0) {
            ZXEveryWeekDetailView * detailCell  =[tableView dequeueReusableCellWithIdentifier:@"ID"];
            if (!detailCell) {
                detailCell  = [[ZXEveryWeekDetailView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
            }
            detailCell.editing = NO;
            return detailCell;
        }else
        {
            static NSString * CELLID = @"CELLID";
            ZXCommentCell * cell =[tableView dequeueReusableCellWithIdentifier:CELLID];
            if (!cell) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXCommentCell" owner:self options:nil] lastObject];
                
            }
            cell.commentImageView.layer.cornerRadius  = 20;
            cell.commentImageView.layer.masksToBounds = YES;
            return cell;
            
       
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        if (indexPath.row == 0) {
            return 260;
        }else
        {
            
            return 105;
        }
        
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    ZXEveryClassPlayView * playView =[ZXEveryClassPlayView everyClassPlayView];
    [playView setContent:nil lableText:nil];
    return playView;

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 296;
}

-(void)setNavStatus
{
    self.view.backgroundColor =[UIColor whiteColor];
    self.title  = @"每周一课";
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
