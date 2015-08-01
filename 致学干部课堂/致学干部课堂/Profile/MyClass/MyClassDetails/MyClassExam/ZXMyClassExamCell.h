//
//  ZXMyClassExamCell.h
//  致学在线
//
//  Created by lixianjun on 15-5-14.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyClassExamCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *practiseButton;
+(ZXMyClassExamCell*)myClassExamCell;
-(void)setContentValue;
@end
