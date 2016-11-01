//
//  ViewController.m
//  Day08-3-TableView
//
//  Created by tarena on 15/8/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//创建表视图实例
//bounds 位置x,y 肯定是0，0。以本身为参考系
//frame 以父视图为参考系。 x，y不一定
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
//与其他视图不同，列表视图需要通过代理来添加内部元素
    tableView.delegate = self;  //负责管理表格操作
    tableView.dataSource = self; //负责管理表格展示
}

#pragma mark - UITableViewDataSource
//询问1:表格应该展示多少个组,即Section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;  //默认不引入此协议方法，则为1
}

//询问2:每个分组中，应该显示多少行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

//询问:每一行数据长什么样？
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = @"Hello";
//    cell.userInteractionEnabled=NO;

    return cell;
}

#pragma mark - UITableViewDelegate
//切记耍帅，由于代理有30个左右的方法，而且方法名经常只差几个字符。  一定要看准代码自动提示的方法是你想要的再回车做选择，千万要不要感觉出提示，一个回车就出来了，很帅的样子。
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    didSelect 当选中某一行时触发这个代理
    NSLog(@"second %ld, row %ld", indexPath.section, indexPath.row);
}
/* 注意两个方法只差一个 De，千万别弄混了。
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
                              
                              
