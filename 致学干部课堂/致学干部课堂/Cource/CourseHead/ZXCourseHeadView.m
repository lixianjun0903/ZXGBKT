//
//  ZXCourseHeadView.m
//  致学在线
//
//  Created by zhixue on 15/5/6.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXCourseHeadView.h"

@interface ZXCourseHeadView ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIView *fieldView;
@property (weak, nonatomic) IBOutlet UIView *typeView;
@property (weak, nonatomic) IBOutlet UIView *cycleView;
@property (weak, nonatomic) IBOutlet UIView *timeView;
@property (weak, nonatomic) IBOutlet UIButton *btnNew;
@property (weak, nonatomic) IBOutlet UIButton *btnHot;
@property (weak, nonatomic) IBOutlet UIButton *btnPraise;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldAll;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldPolitics;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldEconomic;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldCulture;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldSocial;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldScience;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldMilitary;
@property (weak, nonatomic) IBOutlet UIButton *btnFieldEcological;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeVideo;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeAnimation;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeVisualization;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeAll;
@property (weak, nonatomic) IBOutlet UIButton *btnTypeRichMedia;
@property (weak, nonatomic) IBOutlet UIButton *btnCycleDay;
@property (weak, nonatomic) IBOutlet UIButton *btnCycleMonth;
@property (weak, nonatomic) IBOutlet UIButton *btnCycleWeek;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeTwoWeek;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeOneWeek;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeOneMonth;
@property (weak, nonatomic) IBOutlet UIButton *btnTimeHalfYear;

@property (nonatomic,strong)NSMutableString *titleStr;
@end

@implementation ZXCourseHeadView
+ (ZXCourseHeadView *)courseHeadView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXCourseHeadView" owner:nil options:nil] lastObject];
}
- (void)setcontentWithWidth:(CGFloat)width
{
    self.width = width;
    self.titleStr = [NSMutableString string];
    
    self.btnNew.tag = ZXCourseHeadViewButtonTypeNew;
    self.btnNew.selected = YES;
    self.btnHot.tag = ZXCourseHeadViewButtonTypeHot;
    self.btnPraise.tag = ZXCourseHeadViewButtonTypePraise;
    
    self.btnFieldAll.tag = ZXCourseHeadViewButtonTypeFieldAll;
    self.btnFieldAll.selected = YES;
    self.btnFieldPolitics.tag = ZXCourseHeadViewButtonTypeFieldPolitics;
    self.btnFieldEconomic.tag = ZXCourseHeadViewButtonTypeFieldEconomic;
    self.btnFieldCulture.tag = ZXCourseHeadViewButtonTypeFieldCulture;
    self.btnFieldSocial.tag = ZXCourseHeadViewButtonTypeFieldSocial;
    self.btnFieldEcological.tag = ZXCourseHeadViewButtonTypeFieldEcological;
    self.btnFieldScience.tag = ZXCourseHeadViewButtonTypeFieldScience;
    self.btnFieldMilitary.tag = ZXCourseHeadViewButtonTypeFieldMilitary;
    
    self.btnTypeAll.tag = ZXCourseHeadViewButtonTypeTypeAll;
    self.btnTypeAll.selected = YES;
    self.btnTypeVideo.tag = ZXCourseHeadViewButtonTypeTypeVideo;
    self.btnTypeAnimation.tag = ZXCourseHeadViewButtonTypeTypeAnimation;
    self.btnTypeVisualization.tag = ZXCourseHeadViewButtonTypeTypeVisualization;
    self.btnTypeRichMedia.tag = ZXCourseHeadViewButtonTypeTypeRichMedia;
    
    self.btnCycleDay.tag = ZXCourseHeadViewButtonTypeCycleDay;
    self.btnCycleWeek.tag = ZXCourseHeadViewButtonTypeCycleWeek;
    self.btnCycleMonth.tag = ZXCourseHeadViewButtonTypeCycleMonth;
    
    self.btnTimeOneWeek.tag = ZXCourseHeadViewButtonTypeTimeOneWeek;
    self.btnTimeTwoWeek.tag = ZXCourseHeadViewButtonTypeTimeTwoWeek;
    self.btnTimeOneMonth.tag = ZXCourseHeadViewButtonTypeTimeOneMonth;
    self.btnTimeHalfYear.tag = ZXCourseHeadViewButtonTypeTimeHalfYear;
}
- (IBAction)clickButton:(UIButton *)sender
{
    if ([self.courseHeadDelegate respondsToSelector:@selector(courseHeadView:DidClickButton:)])
    {
        [self.courseHeadDelegate courseHeadView:self DidClickButton:sender];
    }
}
- (void)iterateTop
{
    for (UIButton *sub in self.topView.subviews)
    {
        sub.selected = NO;
    }
}
- (void)iterateField
{
    for (UIButton *sub in self.fieldView.subviews)
    {
        sub.selected = NO;
    }
}
- (void)iterateType
{
    for (UIButton *sub in self.typeView.subviews)
    {
        sub.selected = NO;
    }
}
- (void)iterateCycle
{
    for (UIButton *sub in self.cycleView.subviews)
    {
        sub.selected = NO;
    }
}
- (void)iterateTime
{
    for (UIButton *sub in self.timeView.subviews)
    {
        sub.selected = NO;
    }
}
- (void)postSelectButton
{
    self.titleStr = nil;
    self.titleStr = [NSMutableString string];
    for (UIButton *sub in self.topView.subviews)
    {
        if (sub.selected)
        {
            [self appendTopStr:sub.titleLabel.text];
        }
    }
    for (UIButton *sub in self.fieldView.subviews)
    {
        if (sub.selected)
        {
            [self appendTopStr:sub.titleLabel.text];
        }
    }
    for (UIButton *sub in self.typeView.subviews)
    {
        if (sub.selected)
        {
            [self appendTopStr:sub.titleLabel.text];
        }
    }
    for (UIButton *sub in self.cycleView.subviews)
    {
        if (sub.selected)
        {
            [self appendTopStr:sub.titleLabel.text];
        }
    }
    for (UIButton *sub in self.timeView.subviews)
    {
        if (sub.selected)
        {
           [self appendTopStr:sub.titleLabel.text];
        }
    }
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    [info setValue:self.titleStr forKey:@"title"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CourseHeadViewSelectedButton" object:nil userInfo:info];
}
- (void)appendTopStr:(NSString *)str
{
    if (self.titleStr.length == 0)
    {
        [self.titleStr appendString:[NSString stringWithFormat:@"%@",str]];
    }else
    {
        [self.titleStr appendString:[NSString stringWithFormat:@"·%@",str]];
    }
}
@end
