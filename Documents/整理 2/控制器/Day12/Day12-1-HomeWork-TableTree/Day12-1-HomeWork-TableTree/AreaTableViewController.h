//
//  AreaTableViewController.h
//  Day12-1-HomeWork-TableTree
//
//  Created by tarena on 15/8/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Area.h"

@interface AreaTableViewController : UITableViewController
//每个控制器实例对应的界面都是用下面数据来进行显示的
@property(nonatomic, strong) Area *area;

@end







