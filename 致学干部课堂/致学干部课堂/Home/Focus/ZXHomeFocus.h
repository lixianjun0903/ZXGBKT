//
//  ZXHomeFocus.h
//  致学在线
//
//  Created by zhixue on 15/4/30.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXHomeFocus : UIScrollView
+ (ZXHomeFocus *)scrollViewWithRect:(CGRect)rect pageNumber:(NSInteger)pageCount;
- (void)setContentWith:(id)sender;
@end
