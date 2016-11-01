//
//  BViewController.m
//  Day12-5-OtherControl
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgress;

@end
@implementation BViewController

- (id)init{
    if (self = [super init]) {
        self.title = @"指示器";
    }
    return self;
}

- (IBAction)startSwitch:(UISwitch *)sender{
    if (sender.isOn) {
        [_indicator startAnimating];
    }else{
        [_indicator stopAnimating];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
//每0.1秒增加1%, 100%为完成
//设置进度条的起始值是0
    _myProgress.progress = 0;
//启动定时器，每0.1秒执行一次方法，方法中给progress的值加0.01
//启动定时器的方式一:
//TimeInterval时间间隔
//userInfo 传递给NSTimer的userInfo属性
//repeats  是否重复执行
//特点:定时器创建完毕之后，不会因为ViewDidLoad方法的结束而结束， 因为会自动被添加到事件循环中。
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeValue:) userInfo:nil repeats:YES];
    
//方式二:使用timerWith打头的方法创建定时器，需要手动的将定时器添加到事件循环中
//    NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(changeValue:) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
}
- (void)changeValue:(NSTimer *)timer{
    _myProgress.progress += 0.01;
    if (_myProgress.progress == 1) {
//当值达到了1的时候，就关掉定时器
        [timer invalidate];
        NSLog(@"定时器停止");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
