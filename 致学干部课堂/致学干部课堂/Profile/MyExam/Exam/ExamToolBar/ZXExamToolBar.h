//
//  ZXExamToolBar.h
//  致学在线
//
//  Created by zhixue on 15/5/15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZXExamToolBarButtonTypeAnswerCard,
    ZXExamToolBarButtonTypeSave,
    ZXExamToolBarButtonTypeSubmit,
}ZXExamToolBarButtonType;

@class ZXExamToolBar;
@protocol ZXExamToolBarDelegate <NSObject>
@optional
- (void)examToolBar:(ZXExamToolBar *)toolBar DidClickButton:(UIButton *)btn;
@end

@interface ZXExamToolBar : UIView
@property (nonatomic,weak) id<ZXExamToolBarDelegate>examDelegate;
@end
