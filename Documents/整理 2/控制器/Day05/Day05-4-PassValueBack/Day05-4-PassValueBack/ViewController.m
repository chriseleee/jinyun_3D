//
//  ViewController.m
//  Day05-4-PassValueBack
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *tipLb;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation ViewController

- (UILabel *)tipLb{
    if (!_tipLb) {
        _tipLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
        _tipLb.backgroundColor = [UIColor grayColor];
        _tipLb.textColor = [UIColor purpleColor];
    }
    return _tipLb;
}

- (UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_btn setTitle:@"跳转" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor orangeColor];
        _btn.frame = CGRectMake(0, 0, 100, 40);
        _btn.titleLabel.font = [UIFont systemFontOfSize:30];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
//视图将要显示， 每当当前视图控制器将要显示出来时，就会自动触发下面的方法
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _tipLb.text = _message;
}

- (void)click{
    SecondViewController *bVC = [SecondViewController new];
//把本身的对象指针告诉B页面
    bVC.vc = self;
    [self presentViewController:bVC animated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.btn];
    self.btn.center = CGPointMake(120, 60);
    [self.view addSubview:self.tipLb];
    self.tipLb.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
