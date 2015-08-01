//
//  ZXCourseCell.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXCourseCell.h"

@interface ZXCourseCell ()
@property (weak, nonatomic) IBOutlet UIImageView *showImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondMarkLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdMarkLabel;

@end

@implementation ZXCourseCell
+ (ZXCourseCell *)myCollectCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXCourseCell" owner:nil options:nil] lastObject];
    
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
}
@end
