//
//  ZXEveryClassPlayView.h
//  致学干部课堂
//
//  Created by lixianjun on 15-5-20.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXEveryClassPlayView : UIView
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UIButton *electClassButton;

+(ZXEveryClassPlayView*)everyClassPlayView;
-(void)setContent:(UIImage*)image lableText:(NSString*)str;
@end
