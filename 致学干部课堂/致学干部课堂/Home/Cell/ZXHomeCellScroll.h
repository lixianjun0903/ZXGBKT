//
//  ZXHomeCellScroll.h
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXHomeCellScroll;

@interface ZXHomeCellScroll : UIScrollView
+ (ZXHomeCellScroll *)homeCellScroll;
- (void)setContentHomeCellScrollWithHeight:(CGFloat)height AndItemNumber:(NSInteger)itemNumber;
@end
