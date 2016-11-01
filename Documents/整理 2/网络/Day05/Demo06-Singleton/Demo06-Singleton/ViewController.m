//
//  ViewController.m
//  Demo06-Singleton
//
//  Created by tarena on 15/9/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "DataCenterManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)threadUnsafeSingleton:(id)sender {
    //创建两个线程
    NSThread *firstThread = [[NSThread alloc] initWithTarget:self selector:@selector(createUnsafeSingleton) object:nil];
    NSThread *secondThread = [[NSThread alloc] initWithTarget:self selector:@selector(createUnsafeSingleton) object:nil];
    
    [firstThread start];
    [secondThread start];

}

- (void)createUnsafeSingleton {
    //创建DataCenterManager对象的单例
    DataCenterManager *centerManager = [DataCenterManager sharedDataCenterByNormal];
    NSLog(@"常用单例创建方式:%p", centerManager);
    
}


- (IBAction)threadSafeSingleton:(id)sender {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(createSafeSingleton) object:nil];
    NSThread *secondThread = [[NSThread alloc] initWithTarget:self selector:@selector(createSafeSingleton) object:nil];
    
    [thread start];
    [secondThread start];
    
}

- (void)createSafeSingleton {
    DataCenterManager *dataCenter = [DataCenterManager sharedDataCenterByGCD];
    NSLog(@"使用GCD创建单例:%p", dataCenter);
}






@end
