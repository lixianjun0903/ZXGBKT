//
//  ZXMyMessageCell.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/21.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyMessageCell.h"

@interface ZXMyMessageCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@end

@implementation ZXMyMessageCell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"ZXMyMessageCell";
    ZXMyMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ZXMyMessageCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
- (void)setContentWithTitle:(NSString *)title content:(NSString *)text IsNew:(BOOL)isNew
{
    self.titleLabel.text = title;
    self.contentLabel.text = text;
    self.showImageView.hidden = isNew;
}
- (void)readed
{
    self.showImageView.hidden = YES;
}
@end
