//
//  ViewController.m
//  Demo05-NSThread-SaleTicket
//
//  Created by tarena on 15/9/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//总共多少张票/还剩余多少张
@property (nonatomic, assign) int leftTicketCount;

//已经卖出去多少张
@property (nonatomic, assign) int soldTicketCount;

//锁的属性
@property (nonatomic, strong) NSLock *lock;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化两个属性
    self.leftTicketCount = 100;//总共多少张
    self.soldTicketCount = 0;

}

- (IBAction)saleTicketByOneWindow:(id)sender {
    //NSThread <--> 窗口一
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    thread.name = @"窗口一";
    //线程要执行的任务 <---> 卖票
    [thread start];
}

//卖票
- (void)saleTicket {
    while (1) {
        
        //加锁
        [self.lock lock];
        //开始卖票
        if (self.leftTicketCount > 0) {
            //还有票
            self.leftTicketCount--;
            self.soldTicketCount++;
            
            NSLog(@"剩余票数:%d; 已经卖出:%d; 线程:%@",self.leftTicketCount, self.soldTicketCount, [NSThread currentThread]);
            NSLog(@"============================");
            //解锁
            [self.lock unlock];
            
        } else {
            //票卖完了，跳出循环
            NSLog(@"票已经卖完");
            //解锁
            [self.lock unlock];
            
            break;
        }
        
        
    }
}


- (IBAction)saleTicketByTwoWindows:(id)sender {
    //初始化锁对象
    self.lock = [[NSLock alloc] init];
    
    //创建两个线程 ---> 两个窗口
    NSThread *firstThread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    firstThread.name = @"窗口一";
    
    NSThread *secondThread = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    secondThread.name = @"窗口二";
    
    //两个窗口一起卖票
    [firstThread start];
    [secondThread start];
    
}






@end
