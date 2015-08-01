//
//  ZXMyExamCell.m
//  致学在线
//
//  Created by zhixue on 15/5/13.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyExamCell.h"

@interface ZXMyExamCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *examNumberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *endDate;
@property (weak, nonatomic) IBOutlet UIButton *detailBtn;
@property (weak, nonatomic) IBOutlet UIButton *praticeBtn;
@property (weak, nonatomic) IBOutlet UIButton *examBtn;

//@property (nonatomic,strong) UIView *bgView;
//@property (nonatomic,strong)ZXMyExamDetailView *detail;
@end

@implementation ZXMyExamCell
+ (ZXMyExamCell *)myCourseCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXMyExamCell" owner:nil options:nil] lastObject];
}
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image
{
    self.detailBtn.tag = ZXMyExamCellButtonTypeDetail;
    self.praticeBtn.tag = ZXMyExamCellButtonTypePratice;
    self.examBtn.tag = ZXMyExamCellButtonTypeExam;
}
- (IBAction)clickBtn:(UIButton *)sender
{
    if ([self.examCellDelegate respondsToSelector:@selector(myExamCell:DidClickButton:)])
    {
        [self.examCellDelegate myExamCell:self DidClickButton:sender];
    }
}
@end
