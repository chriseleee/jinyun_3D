//
//  TRCamera.m
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRCamera.h"

@implementation TRCamera
-(void)read:(int)bytes
{
    NSLog(@"从摄像头中读取%d字节数据", bytes);
}
@end
