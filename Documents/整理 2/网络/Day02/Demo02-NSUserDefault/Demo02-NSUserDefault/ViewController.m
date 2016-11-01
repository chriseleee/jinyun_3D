//
//  ViewController.m
//  Demo02-NSUserDefault
//
//  Created by tarena on 15/9/2.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSUserDefaults *defaults;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取系统创建好的单例对象
    self.defaults = [NSUserDefaults standardUserDefaults];

}

- (IBAction)saveData:(id)sender {
    //模拟注册：name; isLogIn; skills; age
    NSArray *skills = @[@"Java", @"Ruby", @"Objective-C"];
    //1. 指定唯一"key"
    [self.defaults setValue:@"Jonny" forKey:@"name"];
    [self.defaults setObject:skills forKey:@"skills"];
    [self.defaults setBool:YES forKey:@"isLogin"];
    [self.defaults setInteger:19 forKey:@"age"];
    
    //2.执行存入沙盒的动作(内存->磁盘)
    [self.defaults synchronize];
}

- (IBAction)getData:(id)sender {
    //获取存储的数据
    NSString *content = [NSString stringWithFormat:@"name:%@; skillsArray:%@; isLogin:%d; age:%ld",
        [self.defaults stringForKey:@"name"],
        [self.defaults arrayForKey:@"skills"],
        [self.defaults boolForKey:@"isLogin"],
        (long)[self.defaults integerForKey:@"age"]];
    
    NSLog(@"获取数据：%@", content);
}

- (IBAction)deleteData:(id)sender {
    
    [self.defaults removeObjectForKey:@"name"];
    [self.defaults removeObjectForKey:@"skills"];
    [self.defaults removeObjectForKey:@"isLogin"];
    [self.defaults removeObjectForKey:@"age"];
}

@end
