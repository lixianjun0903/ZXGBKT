//
//  ZXEveryWeekCommentTextView.m
//  致学在线
//
//  Created by lixianjun on 15-5-18.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXEveryWeekCommentTextView.h"

@implementation ZXEveryWeekCommentTextView
-(id)initWithFrame:(CGRect)frame
{
    
    self  = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI
{
    _commentTextFiled = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, self.frame.size.width - 110, 30)];
    _commentTextFiled.backgroundColor =[UIColor whiteColor];
    _commentTextFiled.layer.cornerRadius = 5;
    _commentTextFiled.layer.masksToBounds = YES;
    _commentTextFiled.keyboardType = UIKeyboardTypeDefault;
    _commentTextFiled.returnKeyType = UIReturnKeySend;
    _commentTextFiled.placeholder = @"  说两句，赞一下";
    [self addSubview:_commentTextFiled];
   _commentNumView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width - 90, 8, 80, 34)];
    _commentNumView.backgroundColor = [UIColor whiteColor];
    _commentNumView.layer.cornerRadius = 6;
    _commentNumView.layer.masksToBounds = YES;
    [self addSubview:_commentNumView];
    _commentNumImageView =[[UIImageView alloc] initWithFrame:CGRectMake(6,9, 15, 15)];
    _commentNumImageView.image =[UIImage imageNamed:@"iconfont-pinglun"];
    [_commentNumView addSubview:_commentNumImageView];
     _commentNumLable =[[UILabel alloc] initWithFrame:CGRectMake(25, 8, 50, 16)];
    _commentNumLable.text = @"1289";
    _commentNumLable.font =[UIFont systemFontOfSize:14];
    [_commentNumView addSubview:_commentNumLable];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
