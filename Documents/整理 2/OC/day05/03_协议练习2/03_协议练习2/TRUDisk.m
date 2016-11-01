//
//  TRUDisk.m
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRUDisk.h"

@implementation TRUDisk
-(void)read:(int)bytes
{
    NSLog(@"从U盘当中读取%d字节数据", bytes);
}
-(void)write:(int)bytes
{
    NSLog(@"向U盘当中写入%d字节数据", bytes);
}
@end
