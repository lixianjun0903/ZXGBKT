//
//  ZXSetView.m
//  致学在线
//
//  Created by lixianjun on 15-5-15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSetView.h"

@implementation ZXSetView
+(ZXSetView*)setView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXSetView" owner:self options:nil] lastObject];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
