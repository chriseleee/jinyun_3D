//
//  SeachResultTableViewController.h
//  Day08-1-SearchAfter-iOS8
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
//用于显示搜索结果的表视图控制器
//需要公开一个数组属性，接收待显示的商品数据
@interface SeachResultTableViewController : UITableViewController
@property(nonatomic,strong) NSArray *resultArray;
@end



