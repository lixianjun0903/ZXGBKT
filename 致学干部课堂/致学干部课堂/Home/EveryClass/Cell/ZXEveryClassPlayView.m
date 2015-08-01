//
//  ZXEveryClassPlayView.m
//  致学干部课堂
//
//  Created by lixianjun on 15-5-20.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXEveryClassPlayView.h"

@implementation ZXEveryClassPlayView
- (IBAction)downButton:(id)sender {
}

+(ZXEveryClassPlayView*)everyClassPlayView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZXEveryClassplay" owner:self options:nil] lastObject];



}
-(void)setContent:(UIImage*)image lableText:(NSString*)str
{   self.downButton.layer.cornerRadius = 2;
    self.downButton.layer.masksToBounds = YES;
    self.electClassButton.layer.cornerRadius = 2;
    self.electClassButton.layer.masksToBounds = YES;
    


}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
