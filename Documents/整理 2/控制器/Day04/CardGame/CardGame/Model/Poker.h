//
//  Poker.h
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 类型:用于描述一副有52张纸牌的扑克类型
 属性:
    NSMutableArray 存放了52张纸牌对象
 */

@interface Poker : NSObject

@property (nonatomic, strong) NSMutableArray *allCards;


@end






