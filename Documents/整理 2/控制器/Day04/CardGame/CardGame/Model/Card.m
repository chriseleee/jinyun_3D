//
//  Card.m
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank{
/*
 self = [super init];
 if(self) 等价于 if(self != nil)
 */
    if (self = [super init]) {
//   把局部变量赋值给属性， 进行属性的初始化操作
        _suit = suit;
        _rank = rank;
        _faceUp = NO;
        _matched = NO;
    }
    return self;
}

//重写cardInfo的getter方法
- (NSString *)cardInfo{
    return [_suit stringByAppendingString:_rank];
}

//花色组
+ (NSArray *)allSuit{
//heitao  hongxin caohua fangkuai
    return @[@"♠️", @"❤️", @"♣️", @"♦️"];
}

//大小组
+ (NSArray *)allRank{
    return @[@"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}


@end




