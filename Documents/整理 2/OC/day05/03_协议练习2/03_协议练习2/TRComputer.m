//
//  TRComputer.m
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRComputer.h"

@implementation TRComputer
-(void)dataCopiedFromUSB1ToUSB2:(int)bytes
{
    [self.usb1 read:bytes];
    [self.usb2 write:bytes];
}
@end
