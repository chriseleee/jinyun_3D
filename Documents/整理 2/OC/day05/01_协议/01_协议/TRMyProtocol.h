//
//  TRMyProtocol.h
//  01_协议
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TRMyProtocol <NSObject>//NSObject是父协议
@property NSString *content;
-(void)show;
@required//是默认方式，表示其下的方法必须遵守，即在采纳该协议的类中必须实现
@optional//表示其下的方法在采纳该协议的类中可实现，可不实现
-(void)option;
@end
