//
//  ZXSearchHeadView.h
//  致学在线
//
//  Created by zhixue on 15/5/11.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXSearchHeadView;
@protocol ZXSearchHeadViewDelegate <NSObject>
@optional
- (void)searchHeadView:(ZXSearchHeadView *)headView DidClickButton:(UIButton *)btn;
@end

@interface ZXSearchHeadView : UIScrollView
@property (nonatomic,weak) id<ZXSearchHeadViewDelegate>searchHeadDelegate;
- (void)addTitle:(NSString *)str;
@end
