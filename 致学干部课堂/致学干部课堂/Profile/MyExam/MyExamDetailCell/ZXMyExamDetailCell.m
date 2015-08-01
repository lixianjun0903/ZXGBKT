//
//  ZXMyExamDetailCell.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/20.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyExamDetailCell.h"

@interface ZXMyExamDetailCell ()
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (weak, nonatomic) IBOutlet UILabel *requireLbel;

@end

@implementation ZXMyExamDetailCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ZXMyExamDetailCell";
    ZXMyExamDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXMyExamDetailCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
