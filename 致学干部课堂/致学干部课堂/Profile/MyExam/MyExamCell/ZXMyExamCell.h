//
//  ZXMyExamCell.h
//  致学在线
//
//  Created by zhixue on 15/5/13.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum
{
    ZXMyExamCellButtonTypeDetail,
    ZXMyExamCellButtonTypePratice,
    ZXMyExamCellButtonTypeExam,
}ZXMyExamCellButtonType;

@class ZXMyExamCell;
@protocol ZXMyExamCellDelegate <NSObject>
@optional
- (void)myExamCell:(ZXMyExamCell *)examCell DidClickButton:(UIButton *)btn;
@end

@interface ZXMyExamCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image;

@property (nonatomic,weak) id<ZXMyExamCellDelegate>examCellDelegate;
@end
