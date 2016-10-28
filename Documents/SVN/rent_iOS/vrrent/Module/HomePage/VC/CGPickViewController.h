//
//  CGPickViewController.h
//  vrrent
//
//  Created by 龚俊平 on 16/5/6.
//  Copyright © 2016年 golden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionView.h"

@interface CGPickViewController : UIViewController

/**
 *  参数字典
 */
@property (strong,nonatomic)NSMutableDictionary* parametDic;


/**
 *  类别个数
 */
@property (assign,nonatomic)NSInteger tableViewNumber;
/**
 *  存储所有分类的数据
 */
@property (nonatomic, strong) NSArray *categoryArray;

/**
 *  存储所有分类的数据ID
 */
@property (nonatomic, strong) NSArray *categoryIDArray;

/**
 *  secondArray
 */
@property (strong,nonatomic)NSMutableArray* secondArray;
/**
 *  secondArrayID
 */
@property (strong,nonatomic)NSMutableArray* secondIDArray;

/**
 *  当前点击按钮
 */
@property (assign,nonatomic)NSInteger currentBtnTag;
@property(strong,nonatomic) UITableView *MainTableView;
@property(strong,nonatomic) UITableView *SecondTableView;

@property(strong,nonatomic) SelectionView *fatherView;

@end
