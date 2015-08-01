//
//  ZXMyDownLoadCell.h
//  致学在线
//
//  Created by lixianjun on 15-5-6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyDownLoadCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *economyLable;
@property (weak, nonatomic) IBOutlet UILabel *civilizationLable;

- (void)setContentWithTitle:(NSString *)title image:(NSString *)image;
- (void)exchangeSymbol;
@end
