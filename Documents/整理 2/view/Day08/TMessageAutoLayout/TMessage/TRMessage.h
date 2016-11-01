//
//  TRMessage.h
//  TMessage
//
//  Created by tarena on 15/8/28.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMessage : NSObject
//聊天内容
@property(nonatomic,strong) NSString *content;
//消息来源
@property(nonatomic) BOOL fromMe;

+ (NSArray *)demoData;

@end










