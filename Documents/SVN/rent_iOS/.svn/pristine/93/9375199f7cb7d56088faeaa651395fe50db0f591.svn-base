//
//  HomePageSecondVC.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/3.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "HomePageSecondVC.h"

@interface HomePageSecondVC ()
/**
 *  主webView
 */
@property(nonatomic,strong)UIWebView *mainWebView;

@end

@implementation HomePageSecondVC

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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.50.206:81/rent/product-rent.html?rentId=%@",self.rentId]];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
}

@end
