//
//  ZXExamCard.h
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXExamCard;
@protocol ZXExamCardDelegate <NSObject>
@optional
- (void)examCard:(ZXExamCard *)practiceCar DidClickButton:(UIButton *)btn;
@end

@interface ZXExamCard : UIScrollView
@property (nonatomic,weak) id<ZXExamCardDelegate>examCardDelegate;
@end
