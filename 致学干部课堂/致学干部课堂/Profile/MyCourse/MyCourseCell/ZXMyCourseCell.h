//
//  ZXMyCourseCell.h
//  致学在线
//
//  Created by zhixue on 15/5/12.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMyCourseCell : UITableViewCell
+ (ZXMyCourseCell *)myCourseCell;
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image;
- (void)exchangeSymbol;
@end
