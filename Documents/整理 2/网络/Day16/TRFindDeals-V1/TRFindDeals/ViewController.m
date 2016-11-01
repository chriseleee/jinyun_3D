//
//  ViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "DPAPI.h"
#import "TRDeal.h"
#import "TRMetaDataTool.h"

@interface ViewController () <DPRequestDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.创建一个DPAPI对象
    DPAPI *api = [[DPAPI alloc] init];
    
    //2.设定参数(city/region/category)
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"city"] = @"北京";
    
    //3.发送团购订单的请求
    [api requestWithURL:@"v1/deal/find_deals" params:params delegate:self];
    
    //验证排序数据的解析
//    NSArray *sortsArray = [TRMetaDataTool sorts];
//    NSArray *secondSorts = [TRMetaDataTool sorts];
//    
//    NSLog(@"hshshsh");
    
    //验证分类
    NSArray *categoryArray = [TRMetaDataTool categories];
    
    //验证城市
    NSArray *cityArray = [TRMetaDataTool cities];
    NSLog(@"dddddd");
    
}

//成功返回
- (void)request:(DPRequest *)request didFinishLoadingWithResult:(id)result {
    NSLog(@"成功返回:%@", result);
    NSArray *dealsArray = result[@"deals"];
    
    //可变数组
    NSMutableArray *dealsMutableArray = [NSMutableArray array];
    for (NSDictionary *dealDic in dealsArray) {
//        [TRDeal parse:dealDic];
        //不同
        TRDeal *deal = [TRDeal new];
        [deal setValuesForKeysWithDictionary:dealDic];
        [dealsMutableArray addObject:deal];
    }
    
    NSLog(@"可变数组:%@", dealsMutableArray);
    
}

//失败返回
- (void)request:(DPRequest *)request didFailWithError:(NSError *)error {
    NSLog(@"失败：%@", error.userInfo);
}





@end
