//
//  TRComputer.h
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUSB.h"

@interface TRComputer : NSObject
@property id<TRUSB> usb1;
@property id<TRUSB> usb2;
-(void)dataCopiedFromUSB1ToUSB2:(int)bytes;
@end
