//
//  ZXMyClassCourceV.m
//  致学在线
//
//  Created by lixianjun on 15-5-14.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXMyClassCourceV.h"
#define  ZXWIDETH self.frame.size.width
#define ZXHEIGHT  self.frame.size.height
@interface ZXMyClassCourceV()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
}
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *imageArray;
@end
@implementation ZXMyClassCourceV
-(id)initWithFrame:(CGRect)frame
{
    self  = [super initWithFrame:frame];
    if (self) {
        //        self.backgroundColor = [UIColor yellowColor];
      
        [self makeUI];
        
    }
    return self;
}
-(void)makeUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ZXWIDETH, ZXHEIGHT)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self addSubview:_tableView];
    self.dataArray = [NSMutableArray arrayWithObjects:@"大象理财版上线公告",
                      @"优化实名认证规则公告",
                      @"新一轮注册送红包活动",
                      @"您有一张10元的现金红包",
                      @"您有一张20元的现金红包",
                      @"您有一张30元的现金红包",
                      @"您有一张32元的现金红包",
                      @"您有一张33元的现金红包",
                      @"您有一张35元的现金红包",
                      @"您有一张36元的现金红包",
                      nil];
    self.imageArray = [NSMutableArray arrayWithObjects:@"image_1",
                       @"image_2",
                       @"image_3",
                       @"image_1",
                       @"image_2",
                       @"image_3",
                       @"image_1",
                       @"image_2",
                       @"image_3",
                       @"image_1",
                       nil];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZXMyCollectCell *cell = [ZXMyCollectCell myCollectCell];
    NSInteger index = indexPath.row;
    [cell setContentWithTitle:self.dataArray[index] image:self.imageArray[index]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
