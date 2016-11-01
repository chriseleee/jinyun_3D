//
//  ViewController.m
//  Day06-1-HomeWork1
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "StarsViewController.h"
//4
@interface ViewController ()<StarsViewControllerDelegate>

@property (nonatomic, strong) UIButton *chooseBtn;
@property (nonatomic, strong) UILabel *tipsLb;
@end
@implementation ViewController
- (UIButton *)chooseBtn{
    if (!_chooseBtn) {
        _chooseBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _chooseBtn.frame = CGRectMake(0, 0, 200, 40);
        [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _chooseBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        [_chooseBtn setTitle:@"请选择您的星座" forState:UIControlStateNormal];
        _chooseBtn.backgroundColor = [UIColor blueColor];
        [_chooseBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseBtn;
}
- (void)clickBtn{
    StarsViewController *starVC = [StarsViewController new];
//    5
    starVC.delegate = self;
    [self presentViewController:starVC animated:YES completion:nil];
}

//6
- (void)chooseStarDetail:(NSString *)detail{
    _tipsLb.text = detail;
}

- (UILabel *)tipsLb{
    if (!_tipsLb) {
        _tipsLb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 280, 200)];
        _tipsLb.backgroundColor = [UIColor grayColor];
        _tipsLb.numberOfLines = 0; //自动换行
    }
    return _tipsLb;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tipsLb];
    [self.view addSubview:self.chooseBtn];
//按钮位置为屏幕中心下移100个像素
    _chooseBtn.center = CGPointMake(self.view.center.x, self.view.center.y + 100);
//运程标签在中心点上方150像素
    _tipsLb.center = CGPointMake(self.view.center.x
                    , self.view.center.y - 150);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
