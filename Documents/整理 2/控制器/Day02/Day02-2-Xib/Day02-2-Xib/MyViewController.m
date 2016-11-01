//
//  MyViewController.m
//  Day02-2-Xib
//
//  Created by tarena on 15/7/31.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
//weak xib。storyboard连线自动生成，不要手写
//assign，属性默认就是这个，不用写。用于基础类型
//strong 对象
//copy，复制指针和指针指向的内存块的内容。主要是防止strong那种原对象被修改，现对象也被修改。
//nonatomic 效率比 atomic高，默认是atomic
//IBOutlet 就代表这个属性是由xib拖拽生成的
@property (weak, nonatomic) IBOutlet UILabel *label;


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//IBAction->InterfaceBuilderAction
//用户界面搭建操作,看到这个返回值，必然说明这个方法是由xib拖拽生成的
- (IBAction)click:(UIButton *)sender {
    NSLog(@"1111");
    self.label.text = @"Hello";
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
