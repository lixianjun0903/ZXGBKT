//
//  ZXMyCourseCell.m
//  致学在线
//
//  Created by zhixue on 15/5/12.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyCourseCell.h"

@interface ZXMyCourseCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *firstMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *examBtn;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@property (nonatomic,strong)UIButton* editLeftBtn;

@end

@implementation ZXMyCourseCell
+ (ZXMyCourseCell *)myCourseCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXMyCourseCell" owner:nil options:nil] lastObject];
}
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image
{
    self.titleLabel.text = title;
    self.showImageView.image = [UIImage imageNamed:image];
    
    self.firstMarkLabel.layer.masksToBounds = YES;
    self.firstMarkLabel.layer.cornerRadius = 2;
    self.secondMarkLabel.layer.masksToBounds = YES;
    self.secondMarkLabel.layer.cornerRadius = 2;
    self.thirdMarkLabel.layer.masksToBounds = YES;
    self.thirdMarkLabel.layer.cornerRadius = 2;
    self.examBtn.layer.masksToBounds = YES;
    self.examBtn.layer.cornerRadius = 2;
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    if (editing)
    {
        if (self.editingStyle == (UITableViewCellEditingStyleInsert|UITableViewCellEditingStyleDelete))
        {
            UIButton* editLeftBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, (self.height - 15) / 2, 15, 15)];
            editLeftBtn.contentMode = UIViewContentModeCenter;
            [editLeftBtn setBackgroundImage:[UIImage imageNamed:@"register_protocol"] forState:UIControlStateNormal];
            [editLeftBtn setBackgroundImage:[UIImage imageNamed:@"register_protocol"] forState:UIControlStateSelected];
            [editLeftBtn setImage:[UIImage imageNamed:@"profile_collect_select"] forState:UIControlStateSelected];
            [editLeftBtn addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
            self.editLeftBtn = editLeftBtn;
            [self.bgView addSubview:editLeftBtn];
            
            [UIView animateWithDuration:0.4 animations:^{
                self.width = ((kWindowWidth - 40) / kWindowWidth) * kWindowWidth;
                self.bgView.transform = CGAffineTransformMakeTranslation(40, 0);
            }];
        }
    }
    else
    {
        [self.editLeftBtn removeFromSuperview];
        [UIView animateWithDuration:0.4 animations:^{
            self.width = kWindowWidth;
            self.bgView.transform = CGAffineTransformIdentity;
        }];
    }
}
- (void)test
{
    NSLog(@"++++");
    //    self.selected = !self.selected;
}
- (void)exchangeSymbol
{
    self.editLeftBtn.selected = self.selected;
}
@end
