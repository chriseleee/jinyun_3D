//
//  MarketTitleHeaderView.h
//  TradeBook
//
//  Created by clark on 15/12/15.
//  Copyright © 2015年 ethan. All rights reserved.
//******************市场顶部控制器切换栏****************//

#import <UIKit/UIKit.h>
#import "MarketTitleButton.h"

@protocol MarketTitleHeaderViewDelegate <NSObject>

@optional
/**
 *  切换控制器
 *
 *  @param fromIndex 当前选择控制器
 *  @param toIndex   选择控制器
 */
-(void)changeVCformIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;

@end

@interface MarketTitleHeaderView : UIView

/**
 *  被选中标题按钮
 */
@property (nonatomic,strong)MarketTitleButton *beSelectedBtn;

/**
 *  底部蓝色下划线
 */
@property (nonatomic,strong)UIView *bottomBlueLineView;

/**
 *  底部分隔线
 */
@property (nonatomic,strong)UIView *separateLine;

/**
 *  当前选中控制器索引
 */
@property (nonatomic,assign)NSInteger selectedIndex;

/**
 *  代理
 */
@property (nonatomic,weak)id<MarketTitleHeaderViewDelegate> delegate;

/**
 *  标题数组
 */
@property (nonatomic,strong)NSArray *titleBtnArr;

/**
 *  初始化
 *
 *  @param arr 按钮名称数组
 */
-(instancetype)initWithFrame:(CGRect)frame titleName:(NSArray *)arr;

@end
