//
//  Card.h
//  CardGame
//
//  Created by tarena on 15/8/4.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

/*command+control+⬆️或者⬇️  快捷切换.h文件和.m文件*/

/*
类型：纸牌类，用于描述一张牌的信息，主要功能就是存储。 属于数据模型 Model层
属性：
  花色: suit
  大小: rank
  面儿是否朝上: faceUp
  是否被匹配:   matched
 */


@interface Card : NSObject
/*
 只有为NSString赋值NSMutableString的值时，会存在值被其他引用修改的风险，导致本不可变字符串内容在不知情的情况下被其他引用修改掉，此时使用copy关键字保证将赋值的copy出来的不可变版本作为属性赋的值，但大部分情况下，为了效率，使用strong修饰亦可
 */

/*
 编写了一句property以后，系统做了什么？
 1.为存储这个属性的值，创建了一个实例变量，变量名系统默认为_suit
 2.为访问这个实例变量，添加了setter和getter方法
 3.self.suit 系统会调用getter方法
 4.self.suit = @"abc" 系统会调用setter方法
 ⬇️
 4.[self setSuit:@"abc"];
 */

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSString *rank;
@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isMatched) BOOL matched;
//为了控制器读取方便，增加一个只读的牌面信息属性
@property (nonatomic, strong, readonly) NSString *cardInfo;

- (instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank;

//需要有两个类方法，告诉别人牌都可以选择什么花色，选择什么大小
+ (NSArray *)allSuit;
+ (NSArray *)allRank;
@end







