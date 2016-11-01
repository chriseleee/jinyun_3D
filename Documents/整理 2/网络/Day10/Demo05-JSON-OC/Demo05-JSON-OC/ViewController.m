//
//  ViewController.m
//  Demo05-JSON-OC
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *weatherTextView;
@property (weak, nonatomic) IBOutlet UITextView *jsonTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
//2:to; 4:for
- (IBAction)json2OC:(id)sender {
    //1.创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=beijing&units=metric"]];
    
    //2.创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //3.创建data task任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //注意点：子线程
        NSLog(@"线程:%@",[NSThread currentThread]);
        
        //开始NSData -> NSArray/NSDictionary
        NSError *jsonError = nil;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        //开始解析JSON数据,并显示在界面上
        [self parseJSONFromNet:jsonDic];
    }];
    
    //4.执行data任务
    [task resume];
}

- (void)parseJSONFromNet:(NSDictionary *)jsonDic {
    //开始解析(从最外层开始解析，一层一层地获取数据)
    //经纬度
    NSDictionary *coordDic = jsonDic[@"coord"];
    NSNumber *lon = coordDic[@"lon"];
    NSNumber *lat = jsonDic[@"coord"][@"lat"];
    
    //unix时间戳(NSDate/NSDateFormatter/转换)
    //日出HH:MM:SS
    NSDictionary *sysDic = jsonDic[@"sys"];
    NSNumber *sunrise = sysDic[@"sunrise"];
    NSDate *sunriseDate = [NSDate dateWithTimeIntervalSince1970:[sunrise doubleValue]];
    NSDateFormatter *sunriseFormatter = [NSDateFormatter new];
    //05:15
    [sunriseFormatter setDateFormat:@"HH:MM:SS"];
    NSString *sunriseStr = [sunriseFormatter stringFromDate:sunriseDate];
    
    //回到主线程更新UI
    dispatch_async(dispatch_get_main_queue(), ^{
        self.weatherTextView.text = [NSString stringWithFormat:@"经度:%.2f;纬度:%.2f;日出时间:%@",[lon floatValue], [lat floatValue], sunriseStr];
    });
}

- (IBAction)oc2JSON:(id)sender {
    
    //1. 准备oc对象(NSArray[NSDictionary])
    NSDictionary *firstPerson = @{@"name":@"Jonny", @"age":@18, @"skills":@[@"Objective-C",@"perl"]};
    NSDictionary *secondPerson = @{@"name":@"Maggie", @"age":@19,@"skills":@[@"Java", @"Ruby"]};
    NSArray *array = @[firstPerson, secondPerson];
    
    //2.判断是否oc对象可以转成JSON对象
    BOOL isConverted = [NSJSONSerialization isValidJSONObject:array];
    
    if (isConverted) {
        //3. 执行转换(可以转换)
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
        if (error == nil) {
            NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            self.jsonTextView.text = dataStr;
        }
    }
    
    
}








@end
