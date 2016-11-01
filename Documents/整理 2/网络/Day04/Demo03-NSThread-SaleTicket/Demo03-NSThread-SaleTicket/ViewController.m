//
//  ViewController.m
//  Demo03-NSThread-SaleTicket
//
//  Created by tarena on 15/9/7.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//BJ-->SH的票数:50
//还剩余多少张票
@property (nonatomic, assign) int leftTicketCount;
//已经卖出多上张票
@property (nonatomic, assign) int soldTicketCount;

//互斥锁的属性
@property (nonatomic, strong) NSLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化两个属性
    self.leftTicketCount = 50;//总的票数
    self.soldTicketCount = 0;//剩余的票数
    
    self.lock = [[NSLock alloc] init];
}
- (IBAction)saleTickeByOneWindow:(id)sender {
    //NSThread <---> 一个窗口
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    thread.name = @"窗口一";
    
    [thread start];
}

- (IBAction)saleTicketByTwoWindows:(id)sender {
    //NSThread <---> 一个窗口
    //NSThread <---> 另一个窗口
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    thread.name = @"窗口一";
    NSThread *secondThread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    secondThread.name = @"窗口二";
    
    [thread start];
    [secondThread start];
}

//卖票的逻辑 50, 49, 48, 47,.....1,0
- (void)saleTicket {
    
    while (1) {
        //加锁
        [self.lock lock];
        
        //情况一：还有剩余的票
        if (self.leftTicketCount > 0) {
            //开始卖
            self.leftTicketCount--;
            self.soldTicketCount++;
            
            NSLog(@"剩余票数:%d;已经卖出:%d;线程:%@", self.leftTicketCount, self.soldTicketCount, [NSThread currentThread]);
            NSLog(@"=================");
            //解锁
            [self.lock unlock];
            
        } else {
            //情况二：票卖完了
            NSLog(@"票已经卖完");
            //解锁
            [self.lock unlock];
            
            break;
        }
    }
}








@end
