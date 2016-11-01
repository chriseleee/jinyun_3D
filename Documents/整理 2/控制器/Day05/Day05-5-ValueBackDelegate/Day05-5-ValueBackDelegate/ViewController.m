//
//  ViewController.m
//  Day05-5-ValueBackDelegate
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
//4
@interface ViewController ()<SecondViewControllerDelegate>

@property (nonatomic, strong) UILabel *tipLb;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (UILabel *)tipLb{
    if (!_tipLb) {
        _tipLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        _tipLb.backgroundColor = [UIColor grayColor];
    }
    return _tipLb;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"跳转" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor redColor];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        _btn.frame = CGRectMake(0, 0, 100, 40);
    }
    return _btn;
}

- (void)click{
    SecondViewController *secondVC = [SecondViewController new];
//设置B的代理方为本身  5
    secondVC.delegate = self;
    [self presentViewController:secondVC animated:YES completion:nil];
}
//6
- (void)viewController:(SecondViewController *)viewcontroller didFinishInputWithMessage:(NSString *)msg{
    _tipLb.text = msg;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.btn];
    self.btn.center = self.view.center;
    [self.view addSubview:self.tipLb];
    self.tipLb.center = CGPointMake(120, 60);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
