//
//  ZXProfileHead.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXProfileHead.h"

@interface ZXProfileHead()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *courseBtn;
@property (weak, nonatomic) IBOutlet UIButton *examBtn;
@property (weak, nonatomic) IBOutlet UIButton *classBtn;

@end

@implementation ZXProfileHead
+ (ZXProfileHead *)tableHeadView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXProfileHead" owner:nil options:nil] lastObject];
}
- (void)setcontentWithWidth:(CGFloat)width
{
    self.iconBtn.tag = ZXProfileHeadButtonTypeIcon;
    self.iconBtn.layer.masksToBounds = YES;
    self.iconBtn.layer.cornerRadius = 5;
    self.courseBtn.tag = ZXProfileHeadButtonTypeCourse;
    self.examBtn.tag = ZXProfileHeadButtonTypeExam;
    self.classBtn.tag = ZXProfileHeadButtonTypeClass;
    self.width = width;
}
- (void)setIconImage:(UIImage *)image
{
    [self.iconBtn setImage:image forState:UIControlStateNormal];
}
- (IBAction)clickHeadButton:(UIButton *)sender
{
   if ([self.headDelegate respondsToSelector:@selector(headView:DidClickButton:)])
{
        [self.headDelegate headView:self DidClickButton:(ZXProfileHeadButtonType)sender.tag];
    }
}
@end
