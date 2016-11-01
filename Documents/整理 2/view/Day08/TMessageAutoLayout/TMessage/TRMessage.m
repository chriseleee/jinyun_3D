//
//  TRMessage.m
//  TMessage
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMessage.h"

@implementation TRMessage
+ (NSArray *)demoData{
    TRMessage *m1 = [[TRMessage alloc] init];
    m1.content = @"Hello";
    m1.fromMe = YES;
    
    TRMessage *m2 = [[TRMessage alloc] init];
    m2.content = @"恩?";
    m2.fromMe = NO;
    
    TRMessage *m3 = [[TRMessage alloc] init];
    m3.content = @"听说你班李大神合金弹头玩的很6?";
    m3.fromMe = YES;
    
    TRMessage *m4 = [[TRMessage alloc] init];
    m4.content = @"哎呀，你真是孤陋寡闻，这你就只知其一不知其二了，李大神其实不仅这个玩的6，而且是合金弹头玩家中LOL玩的最好的，LOL玩家中酷跑玩的最6的";
    m4.fromMe = NO;
    
    TRMessage *m5 = [TRMessage new];
    m5.content = @"这是真的吗？那可以告诉我id吗？另外它有没有女朋友啊😳";
    m5.fromMe = YES;
    
    TRMessage *m6 = [TRMessage new];
    m6.content = @"恩，李大神最喜欢静静了。哪个静静？就是安静的做个美男子啦😄";
    m6.fromMe = NO;
    return @[m1,m2,m3,m4,m5,m6];
}
@end









