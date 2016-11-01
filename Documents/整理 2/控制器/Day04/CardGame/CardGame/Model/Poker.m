//
//  Poker.m
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Poker.h"
#import "Card.h"

@implementation Poker

/*
 lazy loading   懒加载
 不到使用的时候，就不要提前在内存中申请空间
 什么时候第一次使用了？ 调用getter方法的时候，再分配内存空间
 重写属性的getter方法，实现懒加载
 */
- (NSMutableArray *)allCards{
    if (!_allCards) {
//判断allcard实例变量是否被初始化过，千万不要调用self.allcard， 会无限循环。
        _allCards = [NSMutableArray array];
    }
    return _allCards;
}

- (instancetype)init{
    if (self = [super init]) {
//for in 形式，称为遍历。自动遍历整个数组
//等价于for(int i=0;i<arr.count,i++)
        for (NSString *suit in [Card allSuit]) {
            for (NSString *rank in [Card allRank]) {
                Card *c = [[Card alloc] initWithSuit:suit andRank:rank];
//allcards是懒加载，一定要用self.allCards调用。否则就不懒了.!
                [self.allCards addObject:c];
            }
        }
    }
    return self;
}


@end
