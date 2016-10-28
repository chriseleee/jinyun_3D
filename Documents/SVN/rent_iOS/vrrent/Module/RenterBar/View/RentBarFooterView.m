//
//  RentBarFooterView.m
//  vrrent
//
//  Created by 龚俊平 on 16/4/29.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RentBarFooterView.h"
#import "CGUpDownButton.h"
@implementation RentBarFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self creatUI];
    }
    return self;
}

-(void)creatUI{
    
    CGUpDownButton *btn = [[CGUpDownButton alloc]initWithFrame:CGRectZero withImageName:@"btn_next" selectedImage:@"btn_next"];
    [self addSubview:btn];
    WS(ws)
    [btn makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];
    [btn setTitle:@"更多" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    UIView *upLine = [[UIView alloc]init];
    upLine.backgroundColor = [UIColor color999999];
    [self addSubview:upLine];
    [upLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(10);
        make.right.equalTo(ws.right);
        make.top.equalTo(ws.top);
        make.height.mas_equalTo(@1);
    }];
    
    UIView *downLine = [[UIView alloc]init];
    downLine.backgroundColor = [UIColor color999999];
    [self addSubview:downLine];
    [downLine makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.left).offset(10);
        make.right.equalTo(ws.right);
        make.bottom.equalTo(ws.bottom);
        make.height.mas_equalTo(@1);
    }];

}

//筛选按钮点击事件
-(void)titleClick:(UIButton *)titleButton{
    
    CGLog(@"点击了更多");
}


@end
