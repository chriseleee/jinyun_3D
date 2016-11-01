//
//  TRAnimal.h
//  03_组合练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRHead.h"
#import "TRLimb.h"
#import "TRTrunk.h"

@interface TRAnimal : NSObject
@property TRHead *head;
@property TRLimb *limb;
@property TRTrunk *trunk;
@end
