//
//  AViewController.m
//  Day12-5-OtherControl
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *headerIV;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//初始化操作
    [self changeButton:_segmentedControl];
}
- (id)init{
    if (self = [super init]) {
        self.title = @"分段控件";
    }
    return self;
}

- (IBAction)changeButton:(UISegmentedControl *)sender {
//获取当前被选中的分段的索引值
    NSInteger index = sender.selectedSegmentIndex;
//通过索引值 获取当前选中分段的题目名称
    NSString *title = [sender titleForSegmentAtIndex:index];
//题目名和图片名是一样的
    _headerIV.image = [UIImage imageNamed:title];
    
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
