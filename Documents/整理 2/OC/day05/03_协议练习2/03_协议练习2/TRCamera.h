//
//  TRCamera.h
//  03_协议练习2
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRUSB.h"
@interface TRCamera : NSObject<TRUSB>
//摄像头不可能被写入数据，所以只需实现读的方法
@end
