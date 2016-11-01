//
//  TRMessage.h
//  TMessage
//
//  Created by tarena on 15-6-30.
//  Copyright (c) 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMessage : NSObject

//聊天内容
@property(nonatomic,strong)NSString *content;
//消息来源
@property(nonatomic)BOOL fromMe;

+(NSArray *)demoData;

@end








