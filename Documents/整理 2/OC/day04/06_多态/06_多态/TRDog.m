//
//  TRDog.m
//  06_多态
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDog.h"

@implementation TRDog
-(void)watchHome
{
    NSLog(@"狗看家");
}
-(void)eat
{
    NSLog(@"狗%@啃骨头", self.name);
}
@end
