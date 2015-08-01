//
//  ZXProfileHead.h
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZXProfileHeadButtonTypeIcon,
    ZXProfileHeadButtonTypeCourse,
    ZXProfileHeadButtonTypeExam,
    ZXProfileHeadButtonTypeClass,
}ZXProfileHeadButtonType;

@class ZXProfileHead;
@protocol ZXProfileHeadDelegate <NSObject>
@optional
- (void)headView:(ZXProfileHead *)headView DidClickButton:(ZXProfileHeadButtonType)buttonType;
@end

@interface ZXProfileHead : UIView
+ (ZXProfileHead *)tableHeadView;
- (void)setcontentWithWidth:(CGFloat)width;
- (void)setIconImage:(UIImage *)image;

@property (nonatomic,weak) id<ZXProfileHeadDelegate>headDelegate;
@end
