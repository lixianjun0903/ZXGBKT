//
//  ZXEveryWeekDetailView.m
//  致学在线
//
//  Created by lixianjun on 15-5-17.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXEveryWeekDetailView.h"
#define CellWIDETH [[UIScreen mainScreen] bounds].size.width
@implementation ZXEveryWeekDetailView

//-(id)initWithFrame:(CGRect)frame
//{
//    
//    self  = [super initWithFrame:frame];
//    if (self) {
//        [self createUI];
//    }
//    return self;
//}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
        
    }
    return self;
}
-(void)createUI
{

    contentScView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 10, CellWIDETH-10, 61)];
    [self.contentView addSubview:contentScView];
    UILabel  * detailLable = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, CellWIDETH-10, 42)];
    detailLable.text = @"  中央网信办、团中央开展“双争”主题宣传教育实践活动 秦宜智:以改革精神谋划和推动共青团工作创新发展 ";
    detailLable.font =[UIFont systemFontOfSize:15];
    detailLable.textColor = color(51, 51, 51);
    detailLable.numberOfLines = 0;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:detailLable.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [detailLable.text length])];
    detailLable.attributedText = attributedString;
    [contentScView addSubview:detailLable];
    moreLable =[[UILabel alloc] initWithFrame:CGRectMake(5, 46, CellWIDETH-80, 15)];
    moreLable.textColor = color(51, 51, 51);
    moreLable.font =[UIFont systemFontOfSize:15];
    moreLable.text = @"中央网信办、团中央全体负责同志参与清明祭英烈主题活动 中央网";
    [contentScView addSubview:moreLable];
    UIButton * moreButton = [[UIButton alloc] initWithFrame:CGRectMake(CellWIDETH -90, 45, 25, 18)];
    [moreButton addTarget:self action:@selector(moreClick) forControlEvents:UIControlEventTouchUpInside];
    [contentScView addSubview:moreButton];
    moreImageView  =[[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 12, 8)];
    moreImageView.image =[UIImage imageNamed:@"iconfont-jiantou"];
    [moreButton addSubview:moreImageView];
    
    commentBGv = [[UIView alloc] initWithFrame:CGRectMake(0, 85, CellWIDETH,140+25)];
    [self.contentView addSubview:commentBGv];
    NSArray * commentArray = @[@"coments",@"hots",@"shares"];
    NSArray * commentLableArray = @[@"134",@"33",@"21"];
    NSArray * commentColorArray = @[[UIColor colorWithRed:0.55f green:0.84f blue:0.71f alpha:1.00f],[UIColor colorWithRed:0.97f green:0.45f blue:0.37f alpha:1.00f],[UIColor colorWithRed:0.98f green:0.78f blue:0.22f alpha:1.00f]];
    for (int i =0; i < commentArray.count; i++) {
        
        UIView * commentBgView = [[UIView alloc] initWithFrame:CGRectMake(70+(CellWIDETH-140-100)/3*i+i*50, 0, (CellWIDETH-140-100)/2.2, 40)];
        [commentBGv addSubview:commentBgView];
        UIButton* commentButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,40,40)];
        commentButton.backgroundColor = commentColorArray[i];
        commentButton.layer.cornerRadius = 20;
        commentButton.layer.masksToBounds = YES;
        
        [commentBgView addSubview:commentButton];
        
        UIImageView * commengtImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5, 12.5, 15, 15)];
        commengtImageView.image = [UIImage imageNamed:commentArray[i]];
        [commentButton addSubview:commengtImageView];
        UILabel * commentLable = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, 20, 40)];
        commentLable.text =commentLableArray[i];
        commentLable.adjustsFontSizeToFitWidth = YES;
        commentLable.textColor = color(51, 51, 51);
        commentLable.font =  [UIFont systemFontOfSize:12];
        [commentBgView addSubview:commentLable];
    }
    //相关课程
    UIView * reletView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, CellWIDETH, 40)];
    [commentBGv addSubview:reletView];
    UILabel * reletLable =[[UILabel alloc] initWithFrame:CGRectMake(5, 5, 60, 15)];
    reletLable.text = @"相关课程";
    [reletView addSubview:reletLable];
    reletLable.textColor  = color(102, 102, 102);
    reletLable.font =[UIFont systemFontOfSize:15];
    
    UIView * lineView = [[UIView alloc] initWithFrame:CGRectMake(20, 70, CellWIDETH-30, 1)];
    lineView.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.93f alpha:1.00f];
    [commentBGv addSubview:lineView];
    
    UIScrollView * reletSC = [[UIScrollView alloc] initWithFrame:CGRectMake(0,80, CellWIDETH, 60)];
    reletSC.showsHorizontalScrollIndicator = NO;
    [commentBGv addSubview:reletSC];
    NSArray * reletImageArray = @[@"image_1",@"image_2",@"image_3",@"image_1",@"image_2",@"image_3",@"image_1",@"image_2"];
    for (int i = 0; i < reletImageArray.count; i++) {
        UIImageView * releteImageViwe =[[UIImageView alloc] initWithFrame:CGRectMake(10 + 80*i + i*20, 0, 80, 60)];
        releteImageViwe.image =[UIImage imageNamed:reletImageArray[i]];
        [reletSC addSubview:releteImageViwe];
        
    }
    reletSC.contentSize = CGSizeMake(10+reletImageArray.count* 80 + (reletImageArray.count-1)*20, 40);
    
    UILabel * commentLalbe = [[UILabel alloc] initWithFrame:CGRectMake(5, 150, CellWIDETH, 15)];
    commentLalbe.text = @"课程评论";
    commentLalbe.font = [UIFont systemFontOfSize:15];
    commentLalbe.textColor = color(51, 51, 51);
    [commentBGv addSubview:commentLalbe];
}
-(void)moreClick
{
      [moreImageView removeFromSuperview];
    
    [UIView animateWithDuration:0.3 animations:^{
        moreLable.frame = CGRectMake(5, 46, CellWIDETH-15, 15+27);
        contentScView.frame = CGRectMake(5, 10, CellWIDETH-10, 61+15);
        contentScView.contentSize = CGSizeMake(CellWIDETH-10, 100);
        moreLable.text = @"中央网信办、团中央开展“双争”主题宣传教育实践活动 秦宜智:以改革精神谋划.";
        moreLable.numberOfLines = 0;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:moreLable.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [moreLable.text length])];
        moreLable.attributedText = attributedString;
        [contentScView addSubview:moreLable];
//        commentBGv.frame = CGRectMake(0, 85+27, self.frame.size.width,140+25);
        
    }];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
