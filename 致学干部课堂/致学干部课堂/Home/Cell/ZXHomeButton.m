//
//  ZXHomeButton.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXHomeButton.h"

#define kImageRatio 0.4

@implementation ZXHomeButton
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * kImageRatio;
    return  CGRectMake(0, 10, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * kImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
