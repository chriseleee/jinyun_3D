//
//  MarketDetailVC.m
//  vrrent
//
//  Created by 龚俊平 on 16/5/3.
//  Copyright © 2016年 golden. All rights reserved.
//

#import "MarketDetailVC.h"

@interface MarketDetailVC ()

/**
 *  主webView
 */
@property(nonatomic,strong)UIWebView *mainWebView;

@end

@implementation MarketDetailVC

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
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.50.206:81/rent/product.html?productId=%@",self.productId]];
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:url]];
    
}


@end
