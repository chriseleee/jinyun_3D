//
//  Game.h
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"
/*
类型:游戏
作用:依靠指定的扑克对象
    1)随机抽取出纸牌
    2）对比纸牌实现业务(具体的玩法)
属性:
    a.存储所有随机选择出的纸牌
    b.记录分数
方法:
    a.根据具体的玩法，进行纸牌对比
*/

@interface Game : NSObject

@property (nonatomic) NSUInteger score;
//Random 随机
@property (nonatomic, strong) NSMutableArray *allRandomCards;

- (instancetype)initWithCardCount:(NSUInteger)count inPoker:(Poker *)poker;

//根据点击的牌的位置，进行对比
- (void)tapCardAtIndex:(NSUInteger)index;
@end







