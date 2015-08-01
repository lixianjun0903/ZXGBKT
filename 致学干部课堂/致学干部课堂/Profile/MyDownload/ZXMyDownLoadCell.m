//
//  ZXMyDownLoadCell.m
//  致学在线
//
//  Created by lixianjun on 15-5-6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyDownLoadCell.h"
@interface ZXMyDownLoadCell()
@property (weak, nonatomic) IBOutlet UIView *bgview;
@property (weak, nonatomic) IBOutlet UILabel *politicsLale;




@property (nonatomic,strong)UIButton* editLeftBtn;
@end
@implementation ZXMyDownLoadCell
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image
{

    self.politicsLale.layer.cornerRadius  = 2;
    self.politicsLale.layer.masksToBounds = YES;
    
    self.economyLable.layer.cornerRadius = 2;
    self.economyLable.layer.masksToBounds = YES;
    self.civilizationLable.layer.cornerRadius =2;
    self.civilizationLable.layer.masksToBounds = YES;
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
            [self.bgview addSubview:editLeftBtn];
            
            [UIView animateWithDuration:0.4 animations:^{
                self.bgview.transform = CGAffineTransformMakeTranslation(40, 0);
            }];
        }
    }
    else
    {
        [self.editLeftBtn removeFromSuperview];
        [UIView animateWithDuration:0.4 animations:^{
            self.bgview.transform = CGAffineTransformIdentity;
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
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
