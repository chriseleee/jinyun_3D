//
//  AddressVIew.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/5.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "AddressView.h"

#define viewH AdjustH(40)

@interface AddressView ()
@property (nonatomic,weak) UIImageView *addressView;
@end

@implementation AddressView

-(UIImageView *)addressView{
    if (!_addressView) {
        _addressView = [UIImageView shareViewWithName:@"img_address"];
    }
    return _addressView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, viewH)];
    if (self) {
        // 内容模式
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    //初始化
    self.addressLabel = [CGTool createLabelWithFrame:CGRectZero fontColor:UIColorFromRGBA(151, 151, 151, 1) fontSize:14 textAligment:NSTextAlignmentLeft];
    //添加到view
    [self addSubview:self.addressView];
    [self addSubview:self.addressLabel];

    //添加约束
    WS(ws)
    [_addressView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).insets(UIEdgeInsetsMake(0, Margin, 0, SCREEN_WIDTH-Margin-viewH));
    }];
    [_addressLabel makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws).insets(UIEdgeInsetsMake(0, Margin+viewH, 0, Margin));
    }];
    
}

@end
