//
//  TRSortViewController.m
//  TRFindDeals
//
//  Created by tarena on 15/9/23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRSortViewController.h"
#import "TRMetaDataTool.h"
#import "TRSort.h"

@interface TRSortViewController ()

@end

@implementation TRSortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat buttonInset  = 15;
    CGFloat buttonWidth  = 100;
    CGFloat buttonHeight = 30;
    
    //1.获取所有的排序数据[TRSort, TRSort, ...]
    NSArray *sortsArray = [TRMetaDataTool sorts];
    NSInteger arrayCount = sortsArray.count;
    
    //设定内容控制器高度的初始值
    CGFloat height = 0;
    
    //2.循环创建7个按钮
    for (int i = 0; i < arrayCount; i++) {
        //创建按钮
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(buttonInset, i*(buttonInset + buttonHeight) + buttonInset, buttonWidth, buttonHeight);
        //设置button文本的颜色
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        //button的背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_normal"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"btn_filter_selected"] forState:UIControlStateHighlighted];
        
        //获取第i个数组中的模型对象，设置button的title
        TRSort *sort = sortsArray[i];
        [button setTitle:sort.label forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(clickSortButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        
        //设置内容控制器的高度
        height = CGRectGetMaxY(button.frame);
    }
    
    //设定弹出/内容控制显示的size大小
    self.preferredContentSize = CGSizeMake(2*buttonInset+buttonWidth, height+buttonInset);

}

- (void)clickSortButton {
    
#warning TODO:实现排序按钮的点击事件
    
}





@end
