//
//  main.m
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRComputer.h"
#import "TRUDisk.h"
#import "TRCamera.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TRComputer *c = [[TRComputer alloc]init];
        TRUDisk *ud1 = [[TRUDisk alloc]init];
        TRUDisk *ud2 = [[TRUDisk alloc]init];
        c.usb1 = ud1;
        c.usb2 = ud2;
        [c dataCopiedFromUSB1ToUSB2:1024];
        
        TRCamera *camera = [[TRCamera alloc] init];
        c.usb1 = camera;
        [c dataCopiedFromUSB1ToUSB2:1024 * 1024];//将摄像头中的数据存入U盘2
    }
    return 0;
}
