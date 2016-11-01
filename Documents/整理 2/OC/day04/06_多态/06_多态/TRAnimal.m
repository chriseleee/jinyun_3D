//
//  TRAnimal.m
//  06_多态
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(void)eat
{
    NSLog(@"动物%@在吃", self.name);
}
-(void)sleep
{
    NSLog(@"动物%@在睡", self.name);
}
-(id)initWithName:(NSString *)name andAge:(int)age
{
    if (self = [super init])
    {
        self.name = name;
        self.age = age;
    }
    return self;
}
@end
