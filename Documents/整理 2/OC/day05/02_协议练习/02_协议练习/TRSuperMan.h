//
//  TRSuperMan.h
//  02_协议练习
//
//  Created by tarena on 15/7/21.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRPerson.h"
#import "TRFly.h"

@interface TRSuperMan : NSObject<TRFly, TRPerson>

@end
