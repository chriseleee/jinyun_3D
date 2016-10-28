//
//  MarketTitleButton.h
//  TradeBook
//
//  Created by clark on 15/12/15.
//  Copyright © 2015年 ethan. All rights reserved.
//******************市场子控制器标题按钮****************//

#import <UIKit/UIKit.h>

@interface MarketTitleButton : UIButton

/**
 *  点击事件处理 回调block
 */
@property (nonatomic,copy) void(^marketTitleBtnBeClick)(NSInteger index);

/**
 *  初始化
 */
- (instancetype)initWithTitle:(NSString *)title;

/**
 *  按钮点击事件
 */
-(void)marketbtnBeClick;

@end
