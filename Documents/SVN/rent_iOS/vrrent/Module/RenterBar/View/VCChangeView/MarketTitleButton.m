//
//  MarketTitleButton.m
//  TradeBook
//
//  Created by clark on 15/12/15.
//  Copyright © 2015年 ethan. All rights reserved.
//

#import "MarketTitleButton.h"

@implementation MarketTitleButton
#pragma mark 事件处理
-(void)marketbtnBeClick
{
    if (self.marketTitleBtnBeClick) {
        self.marketTitleBtnBeClick(self.tag - 1000);
        }
}

#pragma mark 初始化与懒加载
/**
 *  初始化
 */
- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:AdjustFontSize(14)];
        [self setTitleColor:UIColorFromRGBAS(0x7f7f7f, 1) forState:UIControlStateNormal];
        [self setTitleColor:UIColorFromRGBAS(0x308fff, 1) forState:UIControlStateSelected];
        [self setTitle:title forState:UIControlStateNormal];
        [self addTarget:self action:@selector(marketbtnBeClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

/**
 *  取消设置高亮
 */
-(void)setHighlighted:(BOOL)highlighted
{}

/**
 *  进入父类时调用
 */
-(void)didMoveToSuperview
{
    [super didMoveToSuperview];
//    self.contentMode = UIViewContentModeBottom;
//    self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, -7.5, 0);
}
@end
