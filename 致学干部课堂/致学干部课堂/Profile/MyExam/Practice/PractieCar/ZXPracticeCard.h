//
//  ZXPracticeCar.h
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXPracticeCard;
@protocol ZXPracticeCardDelegate <NSObject>
@optional
- (void)practiceCard:(ZXPracticeCard *)practiceCar DidClickButton:(UIButton *)btn;
@end

@interface ZXPracticeCard : UIScrollView
@property (nonatomic,weak) id<ZXPracticeCardDelegate>practiceCardDelegate;
@end
