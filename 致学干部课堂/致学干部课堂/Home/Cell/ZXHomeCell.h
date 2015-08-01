//
//  ZXHomeCell.h
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXHomeCell : UITableViewCell
+ (ZXHomeCell *)homeCell;
- (void)setWithHeight:(CGFloat)height DetailText:(NSString *)detailText Text:(NSString *)text Image:(NSString *)image BgColor:(UIColor *)bgColor;
- (void)resetContentOffset;
@end
