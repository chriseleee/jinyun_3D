//
//  ViewController.m
//  Day14-1-GotoOtherScene
//
//  Created by tarena on 15/8/18.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
//通过model模式进行跳转，需要首先获得跳转到的场景的对象
//两种方式
//方式一:
//    1 获得Main.storyboad的对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    2 获得故事板对象中的唯一标识是BViewController的场景对象
    UIViewController *bVC = [storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    [self presentViewController:bVC animated:YES completion:nil];
//方式二
//如果实现跳转操作的两个场景是属于同一个故事板的话
//那么可以用简单的方法获取到当前故事板
//self.storyboard可以直接获取当前故事板对象，不需要专门初始化一个故事板对象。
    UIViewController *bVC1 = [self.storyboard instantiateViewControllerWithIdentifier:@"BViewController"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
