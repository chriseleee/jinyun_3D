//
//  ViewController.m
//  Demo02-JSON-Model-Array
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRDealModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1.获取数据
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:jsonFilePath];
    
    //2.转换(NSData -> NSArray/NSDictionary)
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
    
    //3.解析并打印
    NSArray *dealsArray = jsonDic[@"deals"];
    //dealsArray[NSDictionary1,NSDictionary2.....]
    //声明一个可变数组
    NSMutableArray *dealsMutableArray = [NSMutableArray array];
    
    //循环一个一个解析
    for (NSDictionary *dealDic in dealsArray) {
        //使用自定义类的方法来解析
        TRDealModel *dealModel = [TRDealModel parseDealJSON:dealDic];
        //将解析完的模型对象添加到可变数组中
        [dealsMutableArray addObject:dealModel];
    }
    //dealsMutableArray[TRDealModel1,TRDealModel2]
    NSLog(@"解析完的数据:%@", dealsMutableArray);
    
    
    
}



@end
