//
//  ViewController.m
//  Demo03-JSONParseFromFile
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (IBAction)startParseJSONData:(id)sender {
    
    //1.获取包含JSON格式的数据文件(test.json)，读取数据
    NSString *testFilePath = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:testFilePath];
    
    //2.解析
    /**第二个参数：
     NSJSONReadingMutableContainers(一般用这个类型)：返回字典和数据是可变的(最外层)
     NSJSONReadingMutableLeaves：返回的value是可变的
     NSJSONReadingAllowFragments(很少): 返回JSON数据最外层的括号既不是大括号，也不是中括号
     */
    NSError *error = nil;
    //****该方法返回的类型取决于规则二(大括号用NSDictionary; 中括号用NSArray)
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    //3.将解析后的数据打印
    [self parseJSONData:jsonDic];
    
}
//将解析后的数据打印
- (void)parseJSONData:(NSDictionary *)dic {
    
    /**注意：
     a. 字典中key要和JSON对应的key一模一样
     b. 清楚用iOS中那个类对应的类型来接受(规则二)
     */
    NSString *feelsLike = dic[@"FeelsLikeC"];
    NSString *currentTemp = dic[@"tempC"];
    
    NSArray *requestArray = dic[@"request"];
    NSDictionary *requestDic = requestArray[0];
    NSString *cityName = requestDic[@"query"];
    
    NSLog(@"体感温度:%@;当前温度:%@;城市名字:%@", feelsLike, currentTemp, cityName);
    
}







@end
