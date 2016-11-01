//
//  TRProtocol2.h
//  01_协议
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRProtocol1.h"
          //子协议         父协议
@protocol TRProtocol2 <TRProtocol1>//协议TRProtocol2继承了协议TRProtocol1
-(void)method2;
@end
