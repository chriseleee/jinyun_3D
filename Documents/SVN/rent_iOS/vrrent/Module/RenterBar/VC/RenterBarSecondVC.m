//
//  RenterBarSecondVC.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/3.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "RenterBarSecondVC.h"

@interface RenterBarSecondVC ()

/**
 *  主webView
 */
@property(nonatomic,strong)UIWebView *mainWebView;

@end

@implementation RenterBarSecondVC

-(UIWebView *)mainWebView{
    if (!_mainWebView) {
        _mainWebView = [[UIWebView alloc]init];
        [self.view addSubview:_mainWebView];
        WS(ws)
        [_mainWebView makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(ws.view);
        }];
    }
    return _mainWebView;
}


-(void)viewDidLoad{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.50.206:81/rent/detail.html?detailId=%@",self.detailId]];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];

}

-(void)viewWillAppear:(BOOL)animated{
    
    UIBarButtonItem* firstItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickFirst) image:@"btn_comment_white" selectedImage:@"btn_comment" title:@"8"];
    UIBarButtonItem* secondItem = [UIBarButtonItem itemWithTarget:self action:@selector(clickSecond) image:@"btn_like_white" selectedImage:@"btn_like" title:@"8"];
    self.navigationItem.rightBarButtonItems = @[firstItem,secondItem];
    
}

-(void)clickFirst{
    
}
-(void)clickSecond{
    
}
@end
