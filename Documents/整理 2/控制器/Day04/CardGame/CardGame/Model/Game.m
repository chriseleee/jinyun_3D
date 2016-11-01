//
//  Game.m
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Game.h"
#import "Card.h"

@implementation Game

//根据传入的扑克牌对象和要抽取的个数，随机取出本次游戏的纸牌
- (instancetype)initWithCardCount:(NSUInteger)count inPoker:(Poker *)poker{
    if (self = [super init]) {
        _score = 0;
        for (int i = 0; i < count; i ++) {
//每次循环，都随机取出一张牌，放到随机牌数组中
//            arc4random() 取随机数
            NSInteger index = arc4random()%poker.allCards.count;
//通过随机获取的下标，取得对应的随机牌
            Card *randomCard = poker.allCards[index];
            [self.allRandomCards addObject:randomCard];
//将抽取出的牌从poker中移除
            [poker.allCards removeObjectAtIndex:index];
        }
    }
    return self;
}
//懒加载，重写getter方法，使用self.allRandomCards时，触发下面的方法
- (NSMutableArray *)allRandomCards{
    if (!_allRandomCards) {
        _allRandomCards = [NSMutableArray new];
    }
    return _allRandomCards;
}

/*
 1.根据点击的位置，找到点击的牌对象card
 2.if 面朝上
    将纸牌返回背朝上
 3.else(面朝下)
    a.将纸牌翻回面朝上
    b.遍历数组 获取除本次点击的其余所有牌
        如果 其余牌 有 面朝上， 则比对
            如果两张牌花色相同，设置matched=YES，分数+1
            如果两张牌大小相同，设置matched=YES,分数+4
            else
            两张牌返回背朝上
 */
- (void)tapCardAtIndex:(NSUInteger)index{
    Card *chooseCard = self.allRandomCards[index];
    if (chooseCard.isFaceUp) { //chooseCard.faceUp
//        面朝上
        chooseCard.faceUp = NO;
    }else{
//        面朝下
        chooseCard.faceUp = YES;
        for (int i = 0; i < self.allRandomCards.count; i ++) {
            if (i != index) {
                Card *otherCard = self.allRandomCards[i];
                if (otherCard.isFaceUp &&
                    !otherCard.matched) {
                    if ([chooseCard.suit isEqualToString:otherCard.suit]) {
//两张牌花色匹配
                        chooseCard.matched = YES;
                        otherCard.matched = YES;
                        _score += 1;
                    }else if([chooseCard.rank isEqualToString:otherCard.rank]){
//两张牌大小匹配
                        chooseCard.matched = YES;
                        otherCard.matched = YES;
                        _score += 4;
                    }else{
//两张反过来的牌不匹配，那么把之前的牌背过去
                        otherCard.faceUp = NO;
                    }
                }
            }
        }
    }
}











@end
