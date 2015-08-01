//
//  ZXPersonalVC.m
//  致学在线
//
//  Created by zhixue on 15/5/13.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXPersonalVC.h"
#import <AVFoundation/AVFoundation.h>
#import "ZXImagePickerVC.h"
#import "ZXLabel.h"

@interface ZXPersonalVC ()<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,strong)UITableView *customTableView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@end

@implementation ZXPersonalVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setTableView];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"个人信息";
    self.navigationItem.titleView = titleLabel;
}
- (void)setTableView
{
    self.dataArray = [NSMutableArray arrayWithObjects:@"更改头像",
                                                      @"修改密码",
                                                      @"腾讯QQ",
                                                      @"微信",
                                                      @"新浪微博",
                                                      nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"",
                                                       @"",
                                                       @"profile_qq",
                                                       @"profile_weixin",
                                                       @"profile_sina",
                                                       nil];
    
    UITableView *customTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, kViewHeight)];
    customTableView.dataSource = self;
    customTableView.delegate = self;
    customTableView.tableFooterView = [[UIView alloc] init];
    customTableView.backgroundColor = color(237, 237, 237);
    customTableView.scrollEnabled = NO;
    self.customTableView = customTableView;
    [self.view addSubview:customTableView];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 0)];
    [cell setLayoutMargins:UIEdgeInsetsZero];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.customTableView setSeparatorInset:UIEdgeInsetsZero];
    [self.customTableView setLayoutMargins:UIEdgeInsetsZero];
}
#pragma mark -
#pragma mark Tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 2 : 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSInteger index = indexPath.section * 2 + indexPath.row;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    CGFloat margin = 16;
    CGFloat labelX = 0;
    if (![self.imageArray[index] isEqualToString:@""])
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(margin, 18, 24, 24)];
        imageView.image = [UIImage imageNamed:self.imageArray[index]];
        [bgView addSubview:imageView];
        labelX = CGRectGetMaxX(imageView.frame);
        margin = 6;
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelX + margin, 0, 100, 60)];
    label.font = [UIFont systemFontOfSize:17];
    label.textColor = color(51, 51, 51);
    label.text = self.dataArray[index] ;
    [bgView addSubview:label];
    
    [cell.contentView addSubview:bgView];
    if (indexPath.section == 0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        label.text = @"未绑定";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = color(153, 153, 153);
        label.textAlignment = NSTextAlignmentRight;
        cell.accessoryView = label;
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
    }
    return cell;
}
#pragma mark -
#pragma mark Tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].selectionStyle = UITableViewCellSelectionStyleGray;
    NSInteger index = indexPath.section * 2 + indexPath.row;
    switch (index)
    {
        case 0:
        {
            UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选择", nil];
            [actionSheet showInView:self.customTableView];
            break;
        }
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
    }
}
#pragma mark -
#pragma mark ActionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex)
    {
        case 0:
            [self openCamera];
            break;
        case 1:
            [self openPicture];
            break;
        case 2:
            
            break;
    }
}
#pragma mark -打开相机
- (void)openCamera
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
    //        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    }
    //sourceType = UIImagePickerControllerSourceTypeCamera; //照相机
    //sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //图片库
    //sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum; //保存的相片
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
    picker.delegate = self;
    picker.allowsEditing = YES;//设置可编辑
    picker.sourceType = sourceType;
    [self presentViewController:picker animated:YES completion:nil];//进入照相界面
}
#pragma mark -打开图库
- (void)openPicture
{
    if (![ZXImagePickerVC isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        return;
    
    ZXImagePickerVC *picVC = [[ZXImagePickerVC alloc] init];
    picVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picVC.delegate = self;
    [self presentViewController:picVC animated:YES completion:nil];
}
#pragma mark -UIImagePickerController代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    [userInfo setValue:info[UIImagePickerControllerOriginalImage] forKey:@"image"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SelectionIconFromLib" object:nil userInfo:userInfo];
}
@end
