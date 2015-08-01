//
//  ZXSetView.h
//  致学在线
//
//  Created by lixianjun on 15-5-15.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSetView : UIView
+(ZXSetView*)setView;
@property (weak, nonatomic) IBOutlet UISwitch *newsPushSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *downloadSwitch;

@end
