//
//  ViewController.m
//  Day05-3-PassValue
//
//  Created by tarena on 15/8/5.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField *tf;

@end

@implementation ViewController

- (UITextField *)tf{
    if (!_tf) {
        _tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
//灰色的输入提示
        _tf.placeholder = @"请输入下一页要显示的内容";
        _tf.textColor = [UIColor purpleColor];
//返回按钮的样式，改为确定
        _tf.returnKeyType = UIReturnKeyDone;
        _tf.font = [UIFont systemFontOfSize:20];
//清除内容按钮出现的时机
        _tf.clearButtonMode = UITextFieldViewModeWhileEditing;
//边框样式
        _tf.borderStyle = UITextBorderStyleRoundedRect;
//排版，对齐
        _tf.textAlignment = NSTextAlignmentLeft;
//关联点击return按钮事件触发的方法
//UIControlEventEditingDidEndOnExit 枚举值，代表return按钮被点击后触发的事件
        [_tf addTarget:self action:@selector(clickSure) forControlEvents:UIControlEventEditingDidEndOnExit];
    }
    return _tf;
}

- (void)clickSure{
    SecondViewController *vc = [SecondViewController new];
//把输入框内容传入第二页的message属性中
    vc.message = _tf.text;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tf];
    self.tf.center = CGPointMake(120, 40);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
