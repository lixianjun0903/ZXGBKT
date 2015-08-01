//
//  ZXMyMessageCell.h
//  致学干部课堂
//
//  Created by zhixue on 15/5/21.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyMessageCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setContentWithTitle:(NSString *)title content:(NSString *)text IsNew:(BOOL)isNew;
- (void)readed;
@end
