//
//  ZXCourseHeadView.h
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    ZXCourseHeadViewButtonTypeNew,
    ZXCourseHeadViewButtonTypeHot,
    ZXCourseHeadViewButtonTypePraise,
    
    ZXCourseHeadViewButtonTypeFieldAll,
    /** 政治 */
    ZXCourseHeadViewButtonTypeFieldPolitics,
    /** 经济 */
    ZXCourseHeadViewButtonTypeFieldEconomic,
    /** 文化 */
    ZXCourseHeadViewButtonTypeFieldCulture,
    /** 社会 */
    ZXCourseHeadViewButtonTypeFieldSocial,
    /** 生态文明 */
    ZXCourseHeadViewButtonTypeFieldEcological,
    /** 科技 */
    ZXCourseHeadViewButtonTypeFieldScience,
    /** 军事 */
    ZXCourseHeadViewButtonTypeFieldMilitary,
    
    ZXCourseHeadViewButtonTypeTypeAll,
    ZXCourseHeadViewButtonTypeTypeVideo,
    ZXCourseHeadViewButtonTypeTypeAnimation,
    ZXCourseHeadViewButtonTypeTypeVisualization,
    ZXCourseHeadViewButtonTypeTypeRichMedia,
    
    ZXCourseHeadViewButtonTypeCycleDay,
    ZXCourseHeadViewButtonTypeCycleWeek,
    ZXCourseHeadViewButtonTypeCycleMonth,
    
    ZXCourseHeadViewButtonTypeTimeOneWeek,
    ZXCourseHeadViewButtonTypeTimeTwoWeek,
    ZXCourseHeadViewButtonTypeTimeOneMonth,
    ZXCourseHeadViewButtonTypeTimeHalfYear
}ZXCourseHeadViewButtonType;

@class ZXCourseHeadView;
@protocol ZXCourseHeadViewDelegate <NSObject>
@optional
- (void)courseHeadView:(ZXCourseHeadView *)headView DidClickButton:(UIButton *)btn;
@end

@interface ZXCourseHeadView : UIView
+ (ZXCourseHeadView *)courseHeadView;
- (void)setcontentWithWidth:(CGFloat)width;
- (void)iterateTop;
- (void)iterateField;
- (void)iterateType;
- (void)iterateCycle;
- (void)iterateTime;
- (void)postSelectButton;

@property (nonatomic,weak) id<ZXCourseHeadViewDelegate>courseHeadDelegate;
@end
