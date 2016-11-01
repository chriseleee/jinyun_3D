//
//  StarsViewController.m
//  Day06-1-HomeWork1
//
//  Created by tarena on 15/8/6.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "StarsViewController.h"

@interface StarsViewController ()

@property(nonatomic, strong) NSArray *starNames;  //星座名称
@property(nonatomic, strong) NSArray *starDetails; //星座详情
@property(nonatomic, strong) NSMutableArray *starBtns;
@end
@implementation StarsViewController
- (NSArray *)starNames{
    if (!_starNames) {
        _starNames = @[@"金牛座", @"狮子座", @"处女座", @"双子座", @"射手座", @"摩羯座", @"天蝎座", @"天秤座", @"巨蟹座", @"双鱼座", @"白羊座", @"水瓶座"];
    }
    return _starNames;
}

- (NSArray *)starDetails{
    if (!_starDetails) {
        _starDetails = @[@"金牛座4月21日~5月20日",
                         @"狮子座7月23日~8月22日",
                         @"处女座8月23日~9月22日",
                         @"双子座5月21日~6月21日",
                         @"射手座11月23日~12月21日",
                         @"摩羯座12月22日~1月19日",
                         @"天蝎座10月24日~11月22日",
                         @"天秤座9月23日~10月23日",
                         @"巨蟹座6月22日~7月22日",
                         @"双鱼座2月19日~3月20日",
                         @"白羊座3月21日~4月20日",
                         @"水瓶座1月20日~3月20日"];
    }
    return _starDetails;
}

- (NSMutableArray *)starBtns{
    if (!_starBtns) {
        _starBtns = [NSMutableArray new];
    }
    return _starBtns;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (int i = 0; i < self.starNames.count; i++) {
        UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [starBtn setTitle:self.starNames[i] forState:UIControlStateNormal];
        starBtn.backgroundColor = [UIColor greenColor];
        [starBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        starBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        starBtn.frame = CGRectMake(20 + i%3 * 100, 40 + i/3 * 100, 80, 80);
        [starBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:starBtn];
        [self.starBtns addObject:starBtn];
    }
    self.view.backgroundColor = [UIColor whiteColor];
}
- (void)click:(UIButton *)sender{
//找到点击按钮的索引值
    NSInteger index = [self.starBtns indexOfObject:sender];
    NSString *detail = self.starDetails[index];
    NSLog(@"%@", detail);
//3
    [_delegate chooseStarDetail:detail];
    [self dismissViewControllerAnimated:YES completion:nil];
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
