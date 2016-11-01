//
//  ViewController.m
//  Demo04-GetJSONDataFromNetwork
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

    //1.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=beijing&units=metric"]];
    
    //2.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //3.创建数据任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //data转换成JOSN对象(NSDictionary/NSArray)
        NSError *jsonError = nil;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError == nil) {
            NSLog(@"json字典对象:%@",jsonDic);
        }
        
    }];
    
    //4.执行任务
    [task resume];
    
    
    
    
    
    
}


@end
