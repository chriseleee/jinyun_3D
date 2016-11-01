//
//  TRDog.m
//  08_继承
//
//  Created by tarena on 15/7/17.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDog.h"

@implementation TRDog
-(void)watchHome
{
    NSLog(@"狗狗%@在看家", self.name);
}
-(id)initWithName:(NSString *)name andAge:(int)age andWeight:(int)weight
{
    if (self = [super initWithName:name andAge:age])
    {
        self.weight = weight;
    }
    return self;
}
-(void)eat
{
    NSLog(@"狗狗%@在啃骨头", self.name);
}
-(void)bark
{
    NSLog(@"狗狗%@在汪汪的叫", self.name);
}
@end
