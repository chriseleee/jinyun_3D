//
//  TRMessage.m
//  TMessage
//
//  Created by tarena on 15-6-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import "TRMessage.h"

@implementation TRMessage

+ (NSArray *)demoData{
    TRMessage *m1 = [[TRMessage alloc]init];
    m1.content = @"Hello";
    m1.fromMe = YES;

    TRMessage *m2 = [[TRMessage alloc]init];
    m2.content = @"干嘛";
    m2.fromMe = NO;

    TRMessage *m3 = [[TRMessage alloc]init];
    m3.content = @"最近怎么样";
    m3.fromMe = YES;

    TRMessage *m4 = [[TRMessage alloc]init];
    m4.content = @"还可以吧你怎么样为什么突然联系我";
    m4.fromMe = NO;

    TRMessage *m5 = [[TRMessage alloc]init];
    m5.content = @"这是一段很长的文字需要测试是否可以换行及标签的宽度要不再写几个字来看看";
    m5.fromMe = YES;

    TRMessage *m6 = [[TRMessage alloc]init];
    m6.content = @"没词了说点什么呢要不就算了吧别说了我想静静不要问我静静是谁";
    m6.fromMe = NO;

    TRMessage *m7 = [[TRMessage alloc]init];
    m7.content = @"再见不见";
    m7.fromMe = YES;

    return @[m1,m2,m3,m4,m5,m6,m7];

}
@end









