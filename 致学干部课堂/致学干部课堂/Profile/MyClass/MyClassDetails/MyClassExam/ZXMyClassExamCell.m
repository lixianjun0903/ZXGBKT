//
//  ZXMyClassExamCell.m
//  致学在线
//
//  Created by lixianjun on 15-5-14.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyClassExamCell.h"
@interface ZXMyClassExamCell()
@property (weak, nonatomic) IBOutlet UIButton *examButton;

@end
@implementation ZXMyClassExamCell

+(ZXMyClassExamCell*)myClassExamCell
{

    return [[[NSBundle mainBundle] loadNibNamed:@"ZXMyClassExamCell" owner:self options:nil] lastObject];


}
-(void)setContentValue
{
    self.examButton.layer.cornerRadius  = 2;
    self.examButton.layer.masksToBounds = YES;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
