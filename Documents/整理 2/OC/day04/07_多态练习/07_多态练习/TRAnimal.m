//
//  TRAnimal.m
//  07_多态练习
//
//  Created by tarena on 15/7/20.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRAnimal.h"

@implementation TRAnimal
-(id)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        self.name = name;
    }
    return self;
}
-(void)eat:(TRFood *)food
{
    NSLog(@"动物%@吃食物%@", self.name, food.name);
}
@end
