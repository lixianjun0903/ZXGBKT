//
//  ZXCourseCell.h
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCourseCell : UITableViewCell
+ (ZXCourseCell *)myCollectCell;
- (void)setContentWithTitle:(NSString *)title image:(NSString *)image;


@end
