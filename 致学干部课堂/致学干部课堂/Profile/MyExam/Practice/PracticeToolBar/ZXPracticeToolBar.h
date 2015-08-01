//
//  ZXPracticeToolBar.h
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZXPracticeToolBarButtonTypeAnswerCard,
    ZXPracticeToolBarButtonTypeSubmit,
}ZXPracticeToolBarButtonType;

@class ZXPracticeToolBar;
@protocol ZXPracticeToolBarDelegate <NSObject>
@optional
- (void)practiceToolBar:(ZXPracticeToolBar *)toolBar DidClickButton:(UIButton *)btn;
@end


@interface ZXPracticeToolBar : UIView
@property (nonatomic,weak) id<ZXPracticeToolBarDelegate>practiceDelegate;
@end
