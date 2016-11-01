//
//  ViewController.m
//  Demo01-JSON-Model
//
//  Created by tarena on 15/9/16.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "TRWeatherModel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)parseJSON:(id)sender {
    //1.创建request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api.openweathermap.org/data/2.5/weather?q=beijing&units=metric"]];
    
    //2.session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //3.创建task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //NSData -> NSDictionay/NSArray
        if (!error) {
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            //开始解析
            [self parseJSONData:jsonDic];
        }
    }];
    //4.执行task
    [task resume];
}

- (void)parseJSONData:(NSDictionary *)jsonDic {
    //使用对象转模型的方式解析
    TRWeatherModel *weatherModel = [TRWeatherModel weatherWithJSON:jsonDic];
    
    //显示在界面上(回到主线程)
    dispatch_async(dispatch_get_main_queue(), ^{
        self.textView.text = [NSString stringWithFormat:@"lon/lat：%.2f; %.2f", [weatherModel.lon floatValue], [weatherModel.lat floatValue]];
        
    });
    

}











@end
