//
//  MyHeaderView.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/3.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "MyHeaderLoginView.h"

@interface MyHeaderLoginView ()

@property (strong,nonatomic)UIImageView* headerImage;



@end



@implementation MyHeaderLoginView

-(UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [[UIImageView alloc]init];
//        UITapGestureRecognizer *headImageTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTap:)];
//        headImageTap.numberOfTouchesRequired = 1;//手指数
//        headImageTap.numberOfTapsRequired = 1;//tap次数
//        _headerImage.userInteractionEnabled = YES;
        _headerImage.layer.cornerRadius = AdjustH(40);
        _headerImage.layer.masksToBounds = YES;
//        [_headerImage addGestureRecognizer:headImageTap];
    }
    return _headerImage;
}

-(UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];

        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
    }
    return _loginBtn;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        //创建headerView
        UIImageView *backgroundImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_head_portrait"]];
        backgroundImage.frame = CGRectMake(0,0, SCREEN_WIDTH, AdjustH(200));
        backgroundImage.clipsToBounds = NO;
        backgroundImage.contentMode = UIViewContentModeBottom;
        [self addSubview:backgroundImage];
        WS(ws)
        [backgroundImage makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws);
        }];
        
        [self addSubview:self.headerImage];
        [self addSubview:self.loginBtn];

    }
    return self;
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if ([self.headerData[@"isLogin"] isEqualToString:@"YES"]){
        
        UIImageView *imageView = self.headerData[@"AccountImage"];
        if (imageView == nil) {
            self.headerImage.image =[UIImage imageNamed:@"qq"];
            [self.loginBtn setTitle:@"请修改账户信息" forState:UIControlStateNormal];
        }else{
            self.headerImage.image = imageView.image;
            [self.loginBtn setTitle:self.headerData[@"AccountName"] forState:UIControlStateNormal];
        }
    }else{
        self.headerImage.image =[UIImage imageNamed:@"qq"];
        [self.loginBtn setTitle:@"请登录" forState:UIControlStateNormal];
//        self.loginBtn.userInteractionEnabled = YES;
    }
    
    
    WS(ws)
    [_headerImage makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.mas_centerX);
        make.top.equalTo(ws.top).offset(AdjustH(60));
        make.size.mas_equalTo(CGSizeMake(AdjustH(80), AdjustH(80)));
    }];
    
    [_loginBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws);
        make.top.equalTo(_headerImage.bottom).offset(AdjustH(12));
        make.size.mas_equalTo(CGSizeMake(AdjustH(100), AdjustH(17)));
    }];
   
}

//-(void)titleClick:(UIButton *)titleButton{
//    
//    
//}

@end
