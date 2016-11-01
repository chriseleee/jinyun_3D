//
//  MyViewController.m
//  Day01-3-ViewController
//
//  Created by tarena on 15/7/30.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController
//作用⬇️
//负责创建视图，管理视图的生命周期，响应视图与用户的交互。
//特点⬇️
//控制器天生就带有一个视图界面，可以通过view属性来访问到他携带的这个视图，对其进行操作。view属性就是UIView类型

//第一个运行的,初始化方法，适合进行数据的初始化
- (id)init{
    if (self = [super init]) {
        
    }
    return self;
}

//第二个运行。 load加载，view视图控制器自带的那个view
- (void)loadView{
    
    [super loadView];
}

//第三个运行，视图控制器自带的view被加载完成了
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
// 什么是UIView
//  能够在界面上看得见的界面元素，都可以称为视图
//  是系统定义的一种抽象的类型，描述了在界面中占据了一定矩形空间，并能够承载其他显示元素的一种界面。
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor purpleColor];
//    添加到视图控制器自带的view容器中
    [self.view addSubview:view];
    
//    练习:画一条红色直线，长度200，高度1，位置在0，20
    UIView *redLine = [[UIView alloc] initWithFrame:CGRectMake(0, 20, 200, 1)];
    redLine.backgroundColor = [UIColor redColor];
    [self.view addSubview:redLine];
    
}

//第四步，视图控制器默认的view将要显示在屏幕上
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

//第五步，视图控制器的默认view已经显示在屏幕上了
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

//第六步, self.view将要消失
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

//第七步，self.view消失了
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
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
